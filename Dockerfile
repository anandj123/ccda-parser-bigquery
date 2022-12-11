FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest
WORKDIR /ccda-parser

RUN apt-get -qqy update
RUN apt-get -qqy install \
    nodejs \
    npm 
RUN python3 --version
RUN node -v
RUN npm -v
RUN git --version
RUN rm -rf ./ccda-parser-personal
RUN git clone https://github.com/anandj123/ccda-parser-personal.git --quiet

RUN git fetch --all
RUN git reset --hard 
RUN git pull
#RUN npm install ejs
RUN npm install
#RUN npm audit fix 
RUN pip install -r requirements.txt

CMD python3 ccda-parser-personal/ccda-parser-to-bigquery.py -gcs_location $GCS_LOCATION -bq_location $BQ_LOCATION

