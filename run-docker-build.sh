docker build -t ccda-parser . 
docker tag ccda-parser gcr.io/anand-bq-test-2/ccda-parser:latest
docker push gcr.io/anand-bq-test-2/ccda-parser:latest
docker run  -e GCS_LOCATION="gs://anand-bq-test-2/HCA_TEST/Clinical/HCA" -e BQ_LOCATION="anand-bq-test-2.hca_clinical.hca_ccda_sample_table" ccda-parser

docker run  -e GCS_LOCATION="gs://anand-bq-test-2/HCA_TEST/Clinical/cerner" -e BQ_LOCATION="anand-bq-test-2.hca_clinical.ccda-golden" gcr.io/anand-bq-test-2/ccda-parser:latest



ccda-parser-to-bigquery.py -gcs_location "gs://anand-bq-test-2/HCA_TEST/Clinical/cerner" -bq_location "anand-bq-test-2.hca_clinical.ccda-golden"

#logn to container bash

docker run -it ccda-parser bash

