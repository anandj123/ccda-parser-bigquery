docker build -t ccda-parser . 
docker tag ccda-parser gcr.io/anand-bq-test-2/ccda-parser:latest
docker push gcr.io/anand-bq-test-2/ccda-parser:latest


docker run  -e GCS_LOCATION="gs://anand-bq-test-2/HCA_TEST/Clinical/cerner" -e BQ_LOCATION="anand-bq-test-2.hca_clinical.ccda-golden" gcr.io/anand-bq-test-2/ccda-parser:latest



#logn to container bash
#docker run -it ccda-parser bash

# Run the batch job with batch_v1.json configuration
gcloud batch jobs submit  ccda-parser-job-$(date +%s) --location us-central1 --config batch_v1.json