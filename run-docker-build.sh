docker build -t ccda-parser . 
docker tag ccda-parser gcr.io/anand-bq-test-2/ccda-parser:latest
docker push gcr.io/anand-bq-test-2/ccda-parser:latest

# Test container locally
#docker run  -e GCS_LOCATION="gs://anand-bq-test-2/HCA_TEST/Clinical/cerner" -e BQ_LOCATION="anand-bq-test-2.hca_clinical.ccda-golden" gcr.io/anand-bq-test-2/ccda-parser:latest

# Copy test data to GCS
# gsutil -m cp test-data/*.* gs://anand-bq-test-2/HCA_TEST/Clinical/cerner/

#logn to container bash
#docker run -it ccda-parser bash

# Run the batch job with batch_v1.json configuration
gcloud batch jobs submit  ccda-parser-job-$(date +%s) --location us-central1 --config batch_v1.json


<<TESTING
# Testing and to-do items

# immunization_declines - need to get an example
bq rm -f -t anand-bq-test-2:hca_clinical.ccda-golden 
bq mk anand-bq-test-2:hca_clinical.ccda-golden schema.json

# Local testing 
git pull && gsutil -m cp test-data/* gs://anand-bq-test-2/HCA_TEST/Clinical/cerner/ && python3 ccda-parser-to-bigquery.py -gcs_location gs://anand-bq-test-2/HCA_TEST/Clinical/cerner -bq_location anand-bq-test-2.hca_clinical.ccda-golden



Gerrit

cd
git clone https://github.com/googlestaging/ccda-parser.git && (cd ccda-parser && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit-review.googlesource.com/tools/hooks/commit-msg ; chmod +x `git rev-parse --git-dir`/hooks/commit-msg)


TESTING