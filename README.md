# Overview
This application will allow healthcare providers to parse and load C-CDA "[Consolidated Clinical Document Architecture](https://en.wikipedia.org/wiki/Consolidated_Clinical_Document_Architecture)"  files from XML format to BigQuery so that analytics and models on this data could be leveraged to better serve the patients.

This application uses [BlueButton.js](https://github.com/blue-button/bluebutton.js) module to parse C-CDA files and loads into BigQuery. This application can be used as a batch load of C-CDA files available in (specified) GCS location and loaded into (Specified) BigQuery table.

# Architecture

![Architecture](./img/arch.png)

# Build instructions
## Prerequisite
The following prerequisite are required for the build

1. [Installed python3](https://www.python.org/downloads/)
2. [Installed node.js](https://nodejs.org/en/download/package-manager/)
3. [Installed Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Clone the repo
1. Clone this repo for building the application image in your environment.

```sh
git clone https://github.com/anandj123/ccda-parser-personal.git

```
## Google Cloud CLI (command line interface) setup
Setup Google Cloud IAM permissions for access to read GCS files and write to BigQuery tables.

Get the authentication token to run this application for your GCP project. 

```sh
gcloud auth application-default login
gcloud config set project <YOUR_PROJECT_NAME>
```

## Setup environment variables for the application

The following environment variables are required for the application.

```sh
export PROJECT_ID=<YOUR_PROJECT_ID>
export GCS_LOCATION=<YOUR_GCS_LOCATION_FOR_CCDA_XML_FILES>
export BQ_LOCATION=<TARGET_BQ_TABLE>
export IMAGE_LOCATION=<YOUR_IMAGE_LOCATION>
export REGION=<YOUR_REGION>
```
|Variable Name|Description|
|---|---|
|PROJECT_ID|Provide your project id. |
|GCS_LOCATION| Provide GCS location for input CCDA XML files e.g. gs://bucket_name/folder_name/ |
|BQ_LOCATION| Provide BigQuery table name to store the result e.q. project-id.data-set-id.table-id |
|IMAGE_LOCATION|Provide the artifact registry location e.g. us-docker.pkg.dev/<YOUR_PROJECT_ID>/ccda-bigquery-repo/ccda-bigquery:latest|
|REGION|Provide the Google Cloud region for your application. e.g. us-east-1 |

## Build application
Build the application

```sh

cd ccda-parser/build && chmod +x cloud-build.sh && ./cloud-build.sh
```

This above command will build the image using [Google Cloud Build](https://cloud.google.com/build) and push the build image to ```$IMAGE_LOCATION```

# Build the application and create an image


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



# Output

The output BigQuery table looks like the following

![BigQuery Table](./img/output.png)

The following sections of the C-CDA documents are parsed.
```sh
ccda.data.document
ccda.data.allergies
ccda.data.care_plan
ccda.data.chief_complaint
ccda.data.demographics
ccda.data.encounters
ccda.data.functional_statuses
ccda.data.immunizations
ccda.data.instructions
ccda.data.results
ccda.data.medications
ccda.data.problems
ccda.data.procedures
ccda.data.smoking_status
ccda.data.vitals
```

