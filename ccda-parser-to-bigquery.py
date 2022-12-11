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
from colorama import Fore, Back, Style, init
from google.cloud import storage

init(autoreset=True)

gcs_location = ''
bq_location = ''

def main():
    parser = argparse.ArgumentParser(description= \
        '''This application downloads CCDA files from GCS, 
        parses them using bluebutton.js library
        and uploads the parsed content to BigQuery.''')

    parser.add_argument('-gcs_location', 
                    required=True,
                    help='''Provide GCS location for input CCDA XML files
                    e.g. gs://bucket_name/folder_name/''')
    parser.add_argument('-bq_location', 
                        required=True,
                        help='''Provide BigQuery table name to store the result
                                e.q. project-id.data-set-id.table-id''')

    options = parser.parse_args()
    global gcs_location 
    gcs_location = options.gcs_location
    global bq_location 
    bq_location = options.bq_location

    valid = True
    print()
    print('-'*60)
    if (not gcs_location.startswith("gs://")):
        print("GCS location for CCDA files: " + Fore.RED + gcs_location)
        print("Please provide GCS location as " + Fore.GREEN + "gs://bucket/folder/")
        valid = False
    
    bq = bq_location.split('.')
    if (len(bq)<3):
        print()
        print("BQ location for CCDA files: " + Fore.RED + bq_location)
        print('Please provide BQ location as ' + Fore.GREEN + 'project.dataset.table')
        valid = False
    if (not valid):
        exit()
    print("{:<30}".format("Processing CCDA files from ") + Fore.GREEN + gcs_location)
    print("{:<30}".format("Loading to ") + Fore.GREEN + bq_location)

def parse():
    print()
    print("Start processing CCDA documents ... ")
    print('-'*60)
    bq = bq_location.split('.')

    project_id = bq[0]
    data_set_id = bq[1]
    table_id = bq[2]
    gcs = gcs_location.split('/')
    bucket_name = gcs[2]
    folder_name = '/'.join(gcs[3:]) 

    # Initialise a client
    storage_client = storage.Client(project_id)

    # Create a bucket object for our bucket and download CCDA documents 
    # for processing.
    bucket = storage_client.get_bucket(bucket_name)
    delimiter = None
    all_blobs = bucket.list_blobs(prefix=folder_name, delimiter=delimiter)

    # Note: The call returns a response only when the iterator is consumed.
    bigquery_client = bigquery.Client(project=project_id)
    dataset_ref = bigquery_client.dataset(data_set_id)
    table_ref = dataset_ref.table(table_id)
    table = bigquery_client.get_table(table_ref)  # API call
    job_config = bigquery.LoadJobConfig()
    job_config.source_format = bigquery.SourceFormat.NEWLINE_DELIMITED_JSON
    
    total_files_processed = 0
    for blob in all_blobs:

        if (blob.name.startswith(folder_name+"/done/")):
            continue

        if blob.name.endswith('.xml'):
            print("{:<30}".format("Parsing CCDA XML file") + Fore.GREEN + blob.name)
            destination_uri = "{}/{}".format('.', "current.xml")
            blob.download_to_filename(destination_uri)

            path_to_file = 'current.xml'
            try:
                # if node isn't on your path, the first arg should instead be a path to the node bin
                cmd_list = ['node', 'ccda-parse.js', path_to_file]

                p = subprocess.Popen(cmd_list, 
                                    stdout=subprocess.PIPE,
                                    stdin=subprocess.PIPE, 
                                    stderr=subprocess.PIPE)
                result, error = p.communicate()
                p.stdin.close()

                if p.returncode != 0:
                    print(error.decode('UTF-8'))
                    print("Failed to parse clinical XML at %s" % blob.name)
                    continue                

                result = result.decode('utf-8').replace("\n", "")

                stringio_data = io.StringIO(result)

                load_job = bigquery_client.load_table_from_file(
                                                stringio_data, 
                                                table, 
                                                job_config=job_config)
                print("{:<30}".format("Loading to BigQuery job_id") + 
                        Fore.GREEN + 
                        load_job.job_id + '\n')
                
                while True:
                    load_job = bigquery_client.get_job( load_job.job_id )  # API request - fetches job
                    if load_job.state != "RUNNING":
                        break
                    print( "Job {} is currently in state {}".format( load_job.job_id, load_job.state ) )
                    time.sleep( 5 )
                if load_job.errors != None:
                    print( "Query Failed." )
                else:
                    bucket.rename_blob(blob, new_name=blob.name.replace(folder_name, folder_name+'/'+'done'))
                    print( "Job finished state {}".format( load_job.state ) )
                    
                total_files_processed = total_files_processed + 1
            except:
                print("{:<30}".format("Error during processing") + 
                        Fore.RED + 
                        blob.name + '\n')
                

    print("Finished processing. Summary statistics")
    print('-'*60)
    print("{:<30}".format("Total CCDA files parsed") + Fore.GREEN + str(total_files_processed))

if __name__ == '__main__':
    main()
    parse()
# [END ccda_parser_to_bigquery]
