FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest
#FROM alpine

#RUN apt-get update
RUN apt-get install -qqy npm
RUN git clone https://github.com/anandj123/ccda-parser-personal.git --quiet
WORKDIR ccda-parser-personal

RUN npm install
RUN pip install -r requirements.txt

#ENTRYPOINT ["python3", "ccda-parser-to-bigquery.py"]
#CMD ["-gcs_location", "gs://anand-bq-test-2/HCA_TEST/Clinical/cerner", "-bq_location", "anand-bq-test-2.hca_clinical.ccda-golden"]

CMD python3 ccda-parser-to-bigquery.py -gcs_location $GCS_LOCATION -bq_location $BQ_LOCATION
