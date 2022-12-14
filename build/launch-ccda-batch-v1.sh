#!/bin/bash
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer "$(gcloud auth application-default print-access-token) \
-X POST https://batch.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/jobs?job_id=ccda-parser-job-$(date +%s) \
-d '{"taskGroups": [ {"taskSpec": {"runnables": [{"container": {"image_uri": "$IMAGE_LOCATION"},"environment": {"variables": {"GCS_LOCATION": "$GCS_LOCATION","BQ_LOCATION": "$BQ_LOCATION"}}}],"computeResource": {"cpuMilli": 2000,"memoryMib": 2000}},"taskCount": 1,"parallelism": 1}],"allocationPolicy": {"instances": [{"policy": {"machineType": "e2-medium"}}]},"labels": {"department": "clinical","env": "dev"},"logsPolicy": {"destination": "CLOUD_LOGGING"}}'
