# Run the batch job with batch_v1.json configuration
#
#   export PROJECT_ID=<YOUR_PROJECT_NAME>
#   export GCS_LOCATION=<CCDA_XML_FILE_LOCATION>
#   export BQ_LOCATION=<BIQUERY_TARGET_TABLE>
#
# this will replace the configuration in ccda_batch_v1.json for 
#   $PROJECT_ID
#   $GCS_LOCATION
#   $BQ_LOCATION

envsubst < ccda_batch_v1.json > launch.json

gcloud batch jobs submit  ccda-parser-job-$(date +%s) \
--location us-central1 \
--config launch.json
#cat launch.json
#rm -rf launch.json