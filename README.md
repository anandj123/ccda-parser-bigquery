# Overview
This application uses blue-button js module to parse CCDA files and loads into BigQuery.
This application is used as batch load of CCDA files available in GCS location that will be downloaded parsed
and then loaded into BigQuery.


# Architecture

![Architecture](./img/arch.png)

# Setup instructions
1. Clone this repo for the running this application on a server.
3. Install python3 (if you don't have python3 already installed)
4. Install latest version of node.js
5. Install latest version of google-cloud-storage
```sh
python3 -m pip install google-cloud-storage
python3 -m pip install google-cloud-bigquery
```

6. Install required node modules
```sh
npm install
```

# Google Cloud setup
Setup Google Cloud IAM permissions for access to read GCS files and write to BigQuery tables.

For local testing:
Get the authentication token to run this application for your GCP project. 

```sh
gcloud auth application-default login
gcloud config set project <YOUR_PROJECT_NAME>
```

# Run application
To run the sample use the following command

Get help of how to run the application

```sh
python3 ccda-parser-to-bigquery.py  -h
```

Usage of the application:
```sh
usage: ccda-parser-to-bigquery.py [-h] -gcs_location GCS_LOCATION -bq_location
                                  BQ_LOCATION

This application downloads CCDA files from GCS, parses them using
bluebutton.js library and uploads the parsed content to BigQuery.

optional arguments:
  -h, --help            show this help message and exit
  -gcs_location GCS_LOCATION
                        Provide GCS location for input CCDA XML files e.g.
                        gs://bucket_name/folder_name/
  -bq_location BQ_LOCATION
                        Provide BigQuery table name to store the result e.q.
                        project-id.data-set-id.table-id

```

# Parameters

| Name | Description |
|---|----|
|-gcs_location| Provide GCS location for input CCDA XML files e.g. gs://bucket_name/folder_name/ |
|-bq_location| Provide BigQuery table name to store the result e.q. project-id.data-set-id.table-id |


# Output

If all the inputs are provided properly the output should look like following:
```sh

------------------------------------------------------------
Processing CCDA files from    gs://<bucket>/<folder>/<folder>/
Loading to                    <project_id>.<dataset_id>.<table_id>

Start processing CCDA documents ...
------------------------------------------------------------
Parsing CCDA XML file         <bucket>/<folder>/<folder>/file1.xml
Loading to BigQuery job_id    ad9ca47e-b9b0-41f3-9c17-69fdee928f62

Parsing CCDA XML file         <bucket>/<folder>/<folder>/file2.xml
Loading to BigQuery job_id    8c9f6368-5430-4298-99f8-88fa476021a2

Parsing CCDA XML file         <bucket>/<folder>/<folder>/file3.xml
Loading to BigQuery job_id    bdcd417a-3916-49e3-a3ed-beb9978dff56

Finished processing. Summary statistics
------------------------------------------------------------
Total CCDA files parsed       3
```
