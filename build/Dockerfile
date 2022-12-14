FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest
RUN apt-get install -qqy npm
RUN git clone https://github.com/anandj123/ccda-parser-personal.git --quiet
WORKDIR ccda-parser-personal
RUN npm install
RUN pip install -r requirements.txt
CMD python3 parser/ccda-parser-to-bigquery.py -gcs_location $GCS_LOCATION -bq_location $BQ_LOCATION
