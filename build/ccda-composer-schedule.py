# Copyright 2019 Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# [START ccda-composer-schedule]

import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import timedelta

default_args = {
    'start_date': airflow.utils.dates.days_ago(0),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'schedule_interval': '0 * * * *'
}

dag = DAG(
    'ccda-composer-schedule',
    default_args=default_args,
    description='Schedule CCDA parser job on Google Cloud Batch',
    schedule_interval=None,
    dagrun_timeout=timedelta(hours=24))

# priority_weight has type int in Airflow DB, uses the maximum.
t1 = BashOperator(
    task_id='ccda-batch-job',
    bash_command='./scripts/launch-ccda-batch-custom.sh',
    dag=dag,
    depends_on_past=False,
    priority_weight=2**31-1)

# [END ccda-composer-schedule]