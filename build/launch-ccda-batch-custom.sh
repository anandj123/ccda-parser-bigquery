# Run the batch job with batch_v1_custom.json configuration

#gcloud batch jobs submit  ccda-parser-job-$(date +%s) \
#--location us-east-1 \
#--config ccda-batch-config-custom.json

curl -d "@ccda-batch-config-custom.json" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
-X POST https://batch.googleapis.com/v1/projects/anand-bq-test-2/locations/us-east1/jobs?job_id=ccda-parser-job-$(date +%s)
