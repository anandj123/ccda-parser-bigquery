#!/bin/bash
# Run the batch job with batch_v1_custom.json configuration

#gcloud batch jobs submit  ccda-parser-job-$(date +%s) \
#--location $REGION \
#--config ccda-batch-config-custom.json

SCRIPT_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
curl --data-binary @$SCRIPT_PATH/ccda-batch-config-custom.json \
-H "Content-Type: application/json" \
-H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
-X POST https://batch.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/jobs?job_id=ccda-parser-job-$(date +%s)
