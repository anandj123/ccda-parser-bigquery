docker build -t ccda-parser . 
docker tag ccda-parser gcr.io/anand-bq-test-2/ccda-parser:latest
docker push gcr.io/anand-bq-test-2/ccda-parser:latest
docker run  -e GCS_LOCATION="gs://anand-bq-test-2/HCA_TEST/Clinical/HCA" -e BQ_LOCATION="anand-bq-test-2.hca_clinical.hca_ccda_sample_table" ccda-parser

docker run  -e GCS_LOCATION="gs://anand-bq-test-2/HCA_TEST/Clinical/cerner" -e BQ_LOCATION="anand-bq-test-2.hca_clinical.cerner3" gcr.io/anand-bq-test-2/ccda-parser:latest