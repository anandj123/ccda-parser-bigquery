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

include: "/views/ccda_file.view"

view: +ccda_file {

# CPT-4 Codes: 2.16.840.1.113883.6.12 -- https://terminology.hl7.org/2.1.0/CodeSystem-v3-cpt-4.html
# ICD10 PCS Procedure: 2.16.840.1.113883.6.4 -- https://phinvads.cdc.gov/vads/ViewCodeSystem.action?id=2.16.840.1.113883.6.4
# Snomed-CT: 2.16.840.1.113883.6.96 -- https://phinvads.cdc.gov/vads/ViewCodeSystem.action?id=2.16.840.1.113883.6.96
# LOINC: 1.3.6.1.4.1.12009.10.3.1 -- https://loinc.org/oids/1.3.6.1.4.1.12009.10.3.1/
  dimension: code_system_string {
    type: string
    sql:
      case
        when ${ccda_file__procedures.code_system} = '2.16.840.1.113883.6.12' then 'CPT4'
        when ${ccda_file__procedures.code_system} = '2.16.840.1.113883.6.4' then 'ICD-10-PCS'
        when ${ccda_file__procedures.code_system} = '2.16.840.1.113883.6.96' then 'Snomed-CT'
        when ${ccda_file__procedures.code_system} = '1.3.6.1.4.1.12009.10.3.1' then 'LOINC'
        else 'Unknown'
      end
    ;;
  }

#################
### Bariatric ###
#################

  dimension: is_bariatric_cpt_list {
    hidden: yes
    type: yesno
    sql:
      ${ccda_file__procedures.code} in
        (
            '43644'
          , '43645'
          , '43659'
          , '43770'
          , '43771'
          , '43772'
          , '43773'
          , '43774'
          , '43775'
          , '43842'
          , '43843'
          , '43845'
          , '43846'
          , '43847'
          , '43848'
          , '43860'
          , '43865'
          , '43886'
          , '43887'
          , '43888'
          , '43999'
        )
    ;;
  }

  dimension: is_bariatric_cpt {
    hidden: yes
    type: yesno
    sql: ${code_system_string} = 'CPT4' and ${is_bariatric_cpt_list} ;;
  }

  dimension: is_bariatric_icd_list {
    hidden: yes
    type: yesno
    sql:
      ${ccda_file__procedures.code} in
        (
            '0D160Z4'
          , 'GZ60ZZZ' --- ASW note: cut this out later!! I only put this in to show that 1 value will be "yes"
          , '0D160Z9'
          , '0D160ZA'
          , '0D164ZA'
          , '0DB60Z3'
          , '0DB60ZZ'
          , '0DB63Z3'
          , '0DB64Z3'
          , '0DB64ZZ'
          , '0DB74ZZ'
          , '0DP60CZ'
          , '0DP64CZ'
          , '0DW64CZ'
          , 's2083'
          , '0D160ZB'
          , '0DB60ZB'
          , '0D190ZB'
          , '0DV64CZ'
          , '0D164ZB'
          , '0D194ZB'
          , '0DB80ZZ'
          , '0DV60DZ'
          , '0DV63DZ'
          , '0DV64DZ'
          , '0DV67DZ'
          , '0DV68DZ'
          , '0DP60DZ'
          , '0DP63DZ'
          , '0DP64DZ'
          , '0DP67DZ'
          , '0DP68DZ'
          , '0312T'
          , '0313T'
          , '0316T'
          , '0317T'
        )
    ;;
  }

  dimension: is_bariatric_icd {
    hidden: yes
    type: yesno
    sql: ${code_system_string} = 'ICD-10-PCS' and ${is_bariatric_icd_list} ;;
  }

  dimension: is_bariatric {
    view_label: "Analytics"
    type: yesno
    sql: ${is_bariatric_cpt} OR ${is_bariatric_icd} ;;
  }

  measure: count_bariatric_patient {
    view_label: "Analytics"
    type: count
    filters: [is_bariatric: "Yes"]
  }

}


# # If necessary, uncomment the line below to include explore_source.
# # include: "hie_ccda_bariatric.model.lkml"

# view: add_a_unique_name_1663941519 {
#   derived_table: {
#     explore_source: ccda_file {
#       column: code_system { field: ccda_file__procedures.code_system }
#       column: code { field: ccda_file__procedures.code }
#     }
#   }
#   dimension: code_system {
#     label: "CCDA File: Procedures Code System"
#     description: ""
#   }
#   dimension: code {
#     label: "CCDA File: Procedures Code"
#     description: ""
#   }
# }
