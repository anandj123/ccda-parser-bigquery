# Run the batch job with batch_v1_custom.json configuration

#gcloud batch jobs submit  ccda-parser-job-$(date +%s) \
#--location $REGION \
#--config ccda-batch-config-custom.json

curl -d "@ccda-batch-config-custom.json" -X \
POST https://batch.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/jobs?job_id=ccda-parser-job-$(date +%s)
