# Copyright 2019 Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# [START ccda_parser_to_bigquery]

import subprocess
from google.cloud import bigquery
import io
import json
import re
import argparse
import time
import os
from google.cloud import storage

gcs_location = ''
bq_location = ''

def load_params():
  parser = argparse.ArgumentParser(description= \
      """This application downloads CCDA files from GCS, 
        parses them using bluebutton.js library
        and uploads the parsed content to BigQuery.""")

  parser.add_argument(
      '-gcs_location',
      required=True,
      help="""Provide GCS location for input CCDA XML files
                    e.g. gs://bucket_name/folder_name/""")
  parser.add_argument(
      '-bq_location',
      required=True,
      help="""Provide BigQuery table name to store the result
                                e.q. project-id.data-set-id.table-id""")

  options = parser.parse_args()
  global gcs_location
  gcs_location = options.gcs_location
  global bq_location
  bq_location = options.bq_location
  valid = True

  if (not gcs_location.startswith('gs://')):
    print('GCS location for CCDA files: ' + gcs_location)
    print('Please provide GCS location as ' + 'gs://bucket/folder/')
    valid = False

  bq = bq_location.split('.')
  if (len(bq) < 3):
    print()
    print('BQ location for CCDA files: ' + bq_location)
    print('Please provide BQ location as ' + 'project.dataset.table')
    valid = False

  if (not valid):
    exit()
  print('Processing CCDA files from GCS location: {}'.format(gcs_location))
  print('BigQuery destination table: {}'.format(bq_location))


def parse():

  # Extract projcet_id, data_set_id, table_id, bucket_name, folder_name 
  # from the input parameters.
  (project_id,data_set_id,table_id) = bq_location.split('.')
  (_,_,bucket_name,*folder_names) = gcs_location.split('/')
  folder_name = '/'.join(folder_names)

  # Initialise a client
  storage_client = storage.Client(project_id)

  # Create a bucket object for the bucket and download CCDA documents
  # for processing.
  bucket = storage_client.get_bucket(bucket_name)
  all_blobs = bucket.list_blobs(prefix=folder_name, delimiter=None)

  # create BigQuery client for inserting parsed CCDA document
  bigquery_client = bigquery.Client(project=project_id)
  dataset_ref = bigquery_client.dataset(data_set_id)
  table_ref = dataset_ref.table(table_id)

  table_exist = True
  try:
    table = bigquery_client.get_table(table_ref)  
  except:
    table_exist = False

  if not table_exist:
    try:
      print('Table not found, creating table {}.{}.{}.'.format(
                            project_id, 
                            data_set_id, 
                            table_id))
      schema = bigquery_client.schema_from_json(
        '{}/schema.json'.format(
          os.path.dirname(os.path.realpath(__file__))))
      table = bigquery.Table(table_ref, schema=schema)
      table = bigquery_client.create_table(table)  # Make an API request.
    except:
      print('Error cannot create BigQuery table, exiting.')
      exit(0)

  job_config = bigquery.LoadJobConfig()
  job_config.source_format = bigquery.SourceFormat.NEWLINE_DELIMITED_JSON
  archive_folder = 'done/' if folder_name[-1] == '/' else '/done/'
  total_success_files = 0
  total_error_files = 0
  for blob in all_blobs:
    try:

      # Ignore files that are in /done folder
      if (blob.name.startswith(folder_name + archive_folder)):
        continue
      # Process files if they are of .XML extension
      if blob.name.endswith('.xml'):
        print('Parsing CCDA XML file: {}'.format(blob.name))

        # Download XML to current local location for Node to process
        path_to_file = 'current.xml'
        destination_uri = '{}/{}'.format('.', path_to_file)
        blob.download_to_filename(destination_uri)

        
        # Call node subprocess to parse the CCDA file
        cmd_list = ['node', '{}/ccda-parse.js'.format(
          os.path.dirname(os.path.realpath(__file__))), path_to_file]
        
        p = subprocess.Popen(
            cmd_list,
            stdout=subprocess.PIPE,
            stdin=subprocess.PIPE,
            stderr=subprocess.PIPE)
        result, error = p.communicate()
        p.stdin.close()

        # Error during parsing, print the error message and continue
        if p.returncode != 0:
          print(error.decode('UTF-8'))
          print('Failed to parse clinical XML at %s' % blob.name)
          total_error_files = total_error_files + 1
          continue
        
        # Convert the result json from binary to string,
        #  remove all new line character
        #  create a Load job to load data to BigQuery
        
        load_job = bigquery_client.load_table_from_file(
            io.StringIO(result.decode('utf-8').replace('\n', '')), 
            table, 
            job_config=job_config)

        # If load job failed, we print error message and proceed to next file
        if load_job.errors != None:
          print('Load to BigQuery failed: {}'.format(load_job.errors))
          total_error_files = total_error_files + 1
          continue

        # Wait till the BigQuery job is finished
        #  this is so that the BigQuery table update quote is not violated.
        while True:
          load_job = bigquery_client.get_job(
              load_job.job_id)  # API request - fetches job
          if load_job.state != 'RUNNING':
            break
          print('Job {} is currently in state {}'.format(
              load_job.job_id, load_job.state))
          time.sleep(5)

        # If BigQuery job failed, print error message and proceed to next file
        if load_job.errors != None:
          print('Load to BigQuery failed: {}'.format(load_job.errors))
          total_error_files = total_error_files + 1
          continue
        else:
          # move the file to DONE folder so that it is not processed again
          print('Job {} state {}'.format(load_job.job_id, load_job.state))
          
          bucket.rename_blob(
              blob,
              new_name=blob.name.replace(folder_name,folder_name + archive_folder))
          total_success_files = total_success_files + 1
    except:
      print('Error during processing: {}'.format(blob.name))

  print('Total CCDA files parsed with SUCCESS: {} with ERRORS: {}'.format(
      total_success_files, total_error_files))


if __name__ == '__main__':
  load_params()
  parse()
# [END ccda_parser_to_bigquery]
