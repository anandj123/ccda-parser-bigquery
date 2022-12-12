# Build docker image and push it to gcr.io
gcloud builds submit --region=us-west2 \
--tag us-docker.pkg.dev/anand-bq-test-2/ccda-bigquery-repo/ccda-bigquery:latest