# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

connection: "argolis_asw"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project

explore: ccda_file {
  hidden: no

  join: ccda_file__results {
    view_label: "CCDA File: Results"
    sql: LEFT JOIN UNNEST(${ccda_file.results}) as ccda_file__results ;;
    relationship: one_to_many
  }

  join: ccda_file__problems {
    view_label: "CCDA File: Problems"
    sql: LEFT JOIN UNNEST(${ccda_file.problems}) as ccda_file__problems ;;
    relationship: one_to_many
  }

  join: ccda_file__allergies {
    view_label: "CCDA File: Allergies"
    sql: LEFT JOIN UNNEST(${ccda_file.allergies}) as ccda_file__allergies ;;
    relationship: one_to_many
  }

  join: ccda_file__encounters {
    view_label: "CCDA File: Encounters"
    sql: LEFT JOIN UNNEST(${ccda_file.encounters}) as ccda_file__encounters ;;
    relationship: one_to_many
  }

  join: ccda_file__procedures {
    view_label: "CCDA File: Procedures"
    sql: LEFT JOIN UNNEST(${ccda_file.procedures}) as ccda_file__procedures ;;
    relationship: one_to_many
  }

  join: ccda_file__medications {
    view_label: "CCDA File: Medications"
    sql: LEFT JOIN UNNEST(${ccda_file.medications}) as ccda_file__medications ;;
    relationship: one_to_many
  }

  join: ccda_file__immunizations {
    view_label: "CCDA File: Immunizations"
    sql: LEFT JOIN UNNEST(${ccda_file.immunizations}) as ccda_file__immunizations ;;
    relationship: one_to_many
  }

  join: ccda_file__documentation_of {
    view_label: "CCDA File: Documentation Of"
    sql: LEFT JOIN UNNEST(${ccda_file.documentation_of}) as ccda_file__documentation_of ;;
    relationship: one_to_many
  }

  join: ccda_file__author__name__given {
    view_label: "CCDA File: Author Name Given"
    sql: LEFT JOIN UNNEST(${ccda_file.author__name__given}) as ccda_file__author__name__given ;;
    relationship: one_to_many
  }

  join: ccda_file__results__tests {
    view_label: "CCDA File: Results Tests"
    sql: LEFT JOIN UNNEST(${ccda_file__results.tests}) as ccda_file__results__tests ;;
    relationship: one_to_many
  }

  join: ccda_file__author__address__street {
    view_label: "CCDA File: Author Address Street"
    sql: LEFT JOIN UNNEST(${ccda_file.author__address__street}) as ccda_file__author__address__street ;;
    relationship: one_to_many
  }

  join: ccda_file__location__address__street {
    view_label: "CCDA File: Location Address Street"
    sql: LEFT JOIN UNNEST(${ccda_file.location__address__street}) as ccda_file__location__address__street ;;
    relationship: one_to_many
  }

  join: ccda_file__demographics__name__given {
    view_label: "CCDA File: Demographics Name Given"
    sql: LEFT JOIN UNNEST(${ccda_file.demographics__name__given}) as ccda_file__demographics__name__given ;;
    relationship: one_to_many
  }

  join: ccda_file__encounters__findings {
    view_label: "CCDA File: Encounters Findings"
    sql: LEFT JOIN UNNEST(${ccda_file__encounters.findings}) as ccda_file__encounters__findings ;;
    relationship: one_to_many
  }

  join: ccda_file__encounters__location__street {
    view_label: "CCDA File: Encounters Location Street"
    sql: LEFT JOIN UNNEST(${ccda_file__encounters.location__street}) as ccda_file__encounters__location__street ;;
    relationship: one_to_many
  }

  join: ccda_file__documentation_of__name__given {
    view_label: "CCDA File: Documentation Of Name Given"
    sql: LEFT JOIN UNNEST(${ccda_file__documentation_of.name__given}) as ccda_file__documentation_of__name__given ;;
    relationship: one_to_many
  }

  join: ccda_file__procedures__performer__street {
    view_label: "CCDA File: Procedures Performer Street"
    sql: LEFT JOIN UNNEST(${ccda_file__procedures.performer__street}) as ccda_file__procedures__performer__street ;;
    relationship: one_to_many
  }

  join: ccda_file__demographics__address__street {
    view_label: "CCDA File: Demographics Address Street"
    sql: LEFT JOIN UNNEST(${ccda_file.demographics__address__street}) as ccda_file__demographics__address__street ;;
    relationship: one_to_many
  }

  join: ccda_file__documentation_of__address__street {
    view_label: "CCDA File: Documentation Of Address Street"
    sql: LEFT JOIN UNNEST(${ccda_file__documentation_of.address__street}) as ccda_file__documentation_of__address__street ;;
    relationship: one_to_many
  }

  join: ccda_file__demographics__guardian__name__given {
    view_label: "CCDA File: Demographics Guardian Name Given"
    sql: LEFT JOIN UNNEST(${ccda_file.demographics__guardian__name__given}) as ccda_file__demographics__guardian__name__given ;;
    relationship: one_to_many
  }

  join: ccda_file__demographics__provider__address__street {
    view_label: "CCDA File: Demographics Provider Address Street"
    sql: LEFT JOIN UNNEST(${ccda_file.demographics__provider__address__street}) as ccda_file__demographics__provider__address__street ;;
    relationship: one_to_many
  }

  join: ccda_file__demographics__guardian__address__street {
    view_label: "CCDA File: Demographics Guardian Address Street"
    sql: LEFT JOIN UNNEST(${ccda_file.demographics__guardian__address__street}) as ccda_file__demographics__guardian__address__street ;;
    relationship: one_to_many
  }
}
