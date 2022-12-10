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

view: ccda_file {
  sql_table_name: `hca-sandbox-aaron-argolis.hie.sample_ccda_qa_patient`
    ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${title} || '|' || ${date_time} ;;
  }

  dimension: allergies {
    hidden: yes
    sql: ${TABLE}.allergies ;;
  }

  dimension: author__address__city {
    type: string
    sql: ${TABLE}.author.address.city ;;
    group_label: "Author Address"
    group_item_label: "City"
  }

  dimension: author__address__country {
    type: string
    sql: ${TABLE}.author.address.country ;;
    group_label: "Author Address"
    group_item_label: "Country"
  }

  dimension: author__address__state {
    type: string
    sql: ${TABLE}.author.address.state ;;
    group_label: "Author Address"
    group_item_label: "State"
  }

  dimension: author__address__street {
    hidden: yes
    sql: ${TABLE}.author.address.street ;;
    group_label: "Author Address"
    group_item_label: "Street"
  }

  dimension: author__address__zip {
    type: number
    sql: ${TABLE}.author.address.zip ;;
    group_label: "Author Address"
    group_item_label: "Zip"
  }

  dimension: author__name__family {
    type: string
    sql: ${TABLE}.author.name.family ;;
    group_label: "Author Name"
    group_item_label: "Family"
  }

  dimension: author__name__given {
    hidden: yes
    sql: ${TABLE}.author.name.given ;;
    group_label: "Author Name"
    group_item_label: "Given"
  }

  dimension: author__name__prefix {
    type: string
    sql: ${TABLE}.author.name.prefix ;;
    group_label: "Author Name"
    group_item_label: "Prefix"
  }

  dimension: author__phone__work {
    type: string
    sql: ${TABLE}.author.phone.work ;;
    group_label: "Author Phone"
    group_item_label: "Work"
  }

  dimension_group: date {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: demographics__address__city {
    type: string
    sql: ${TABLE}.demographics.address.city ;;
    group_label: "Demographics Address"
    group_item_label: "City"
  }

  dimension: demographics__address__country {
    type: string
    sql: ${TABLE}.demographics.address.country ;;
    group_label: "Demographics Address"
    group_item_label: "Country"
  }

  dimension: demographics__address__state {
    type: string
    sql: ${TABLE}.demographics.address.state ;;
    group_label: "Demographics Address"
    group_item_label: "State"
  }

  dimension: demographics__address__street {
    hidden: yes
    sql: ${TABLE}.demographics.address.street ;;
    group_label: "Demographics Address"
    group_item_label: "Street"
  }

  dimension: demographics__address__zip {
    type: number
    sql: ${TABLE}.demographics.address.zip ;;
    group_label: "Demographics Address"
    group_item_label: "Zip"
  }

  dimension: demographics__birthplace__country {
    type: string
    sql: ${TABLE}.demographics.birthplace.country ;;
    group_label: "Demographics Birthplace"
    group_item_label: "Country"
  }

  dimension: demographics__birthplace__state {
    type: string
    sql: ${TABLE}.demographics.birthplace.state ;;
    group_label: "Demographics Birthplace"
    group_item_label: "State"
  }

  dimension: demographics__birthplace__zip {
    type: string
    sql: ${TABLE}.demographics.birthplace.zip ;;
    group_label: "Demographics Birthplace"
    group_item_label: "Zip"
  }

  dimension_group: demographics__dob {
    type: time
    description: "%m/%d/%E4Y"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.demographics.dob ;;
  }

  dimension: demographics__email {
    type: string
    sql: ${TABLE}.demographics.email ;;
    group_label: "Demographics"
    group_item_label: "Email"
  }

  dimension: demographics__ethnicity {
    type: string
    sql: ${TABLE}.demographics.ethnicity ;;
    group_label: "Demographics"
    group_item_label: "Ethnicity"
  }

  dimension: demographics__gender {
    type: string
    sql: ${TABLE}.demographics.gender ;;
    group_label: "Demographics"
    group_item_label: "Gender"
  }

  dimension: demographics__guardian__address__city {
    type: string
    sql: ${TABLE}.demographics.guardian.address.city ;;
    group_label: "Demographics Guardian Address"
    group_item_label: "City"
  }

  dimension: demographics__guardian__address__country {
    type: string
    sql: ${TABLE}.demographics.guardian.address.country ;;
    group_label: "Demographics Guardian Address"
    group_item_label: "Country"
  }

  dimension: demographics__guardian__address__state {
    type: string
    sql: ${TABLE}.demographics.guardian.address.state ;;
    group_label: "Demographics Guardian Address"
    group_item_label: "State"
  }

  dimension: demographics__guardian__address__street {
    hidden: yes
    sql: ${TABLE}.demographics.guardian.address.street ;;
    group_label: "Demographics Guardian Address"
    group_item_label: "Street"
  }

  dimension: demographics__guardian__address__zip {
    type: string
    sql: ${TABLE}.demographics.guardian.address.zip ;;
    group_label: "Demographics Guardian Address"
    group_item_label: "Zip"
  }

  dimension: demographics__guardian__name__family {
    type: string
    sql: ${TABLE}.demographics.guardian.name.family ;;
    group_label: "Demographics Guardian Name"
    group_item_label: "Family"
  }

  dimension: demographics__guardian__name__given {
    hidden: yes
    sql: ${TABLE}.demographics.guardian.name.given ;;
    group_label: "Demographics Guardian Name"
    group_item_label: "Given"
  }

  dimension: demographics__guardian__phone__home {
    type: string
    sql: ${TABLE}.demographics.guardian.phone.home ;;
    group_label: "Demographics Guardian Phone"
    group_item_label: "Home"
  }

  dimension: demographics__guardian__relationship {
    type: string
    sql: ${TABLE}.demographics.guardian.relationship ;;
    group_label: "Demographics Guardian"
    group_item_label: "Relationship"
  }

  dimension: demographics__guardian__relationship_code {
    type: string
    sql: ${TABLE}.demographics.guardian.relationship_code ;;
    group_label: "Demographics Guardian"
    group_item_label: "Relationship Code"
  }

  dimension: demographics__language {
    type: string
    sql: ${TABLE}.demographics.language ;;
    group_label: "Demographics"
    group_item_label: "Language"
  }

  dimension: demographics__marital_status {
    type: string
    sql: ${TABLE}.demographics.marital_status ;;
    group_label: "Demographics"
    group_item_label: "Marital Status"
  }

  dimension: demographics__name__family {
    type: string
    sql: ${TABLE}.demographics.name.family ;;
    group_label: "Demographics Name"
    group_item_label: "Family"
  }

  dimension: demographics__name__given {
    hidden: yes
    sql: ${TABLE}.demographics.name.given ;;
    group_label: "Demographics Name"
    group_item_label: "Given"
  }

  dimension: demographics__name__prefix {
    type: string
    sql: ${TABLE}.demographics.name.prefix ;;
    group_label: "Demographics Name"
    group_item_label: "Prefix"
  }

  dimension: demographics__phone__home {
    type: string
    sql: ${TABLE}.demographics.phone.home ;;
    group_label: "Demographics Phone"
    group_item_label: "Home"
  }

  dimension: demographics__phone__mobile {
    type: string
    sql: ${TABLE}.demographics.phone.mobile ;;
    group_label: "Demographics Phone"
    group_item_label: "Mobile"
  }

  dimension: demographics__phone__work {
    type: string
    sql: ${TABLE}.demographics.phone.work ;;
    group_label: "Demographics Phone"
    group_item_label: "Work"
  }

  dimension: demographics__provider__address__city {
    type: string
    sql: ${TABLE}.demographics.provider.address.city ;;
    group_label: "Demographics Provider Address"
    group_item_label: "City"
  }

  dimension: demographics__provider__address__country {
    type: string
    sql: ${TABLE}.demographics.provider.address.country ;;
    group_label: "Demographics Provider Address"
    group_item_label: "Country"
  }

  dimension: demographics__provider__address__state {
    type: string
    sql: ${TABLE}.demographics.provider.address.state ;;
    group_label: "Demographics Provider Address"
    group_item_label: "State"
  }

  dimension: demographics__provider__address__street {
    hidden: yes
    sql: ${TABLE}.demographics.provider.address.street ;;
    group_label: "Demographics Provider Address"
    group_item_label: "Street"
  }

  dimension: demographics__provider__address__zip {
    type: string
    sql: ${TABLE}.demographics.provider.address.zip ;;
    group_label: "Demographics Provider Address"
    group_item_label: "Zip"
  }

  dimension: demographics__provider__organization {
    type: string
    sql: ${TABLE}.demographics.provider.organization ;;
    group_label: "Demographics Provider"
    group_item_label: "Organization"
  }

  dimension: demographics__provider__phone {
    type: string
    sql: ${TABLE}.demographics.provider.phone ;;
    group_label: "Demographics Provider"
    group_item_label: "Phone"
  }

  dimension: demographics__race {
    type: string
    sql: ${TABLE}.demographics.race ;;
    group_label: "Demographics"
    group_item_label: "Race"
  }

  dimension: demographics__religion {
    type: string
    sql: ${TABLE}.demographics.religion ;;
    group_label: "Demographics"
    group_item_label: "Religion"
  }

  dimension: documentation_of {
    hidden: yes
    sql: ${TABLE}.documentation_of ;;
  }

  dimension: encounters {
    hidden: yes
    sql: ${TABLE}.encounters ;;
  }

  dimension: immunizations {
    hidden: yes
    sql: ${TABLE}.immunizations ;;
  }

  dimension: location__address__city {
    type: string
    sql: ${TABLE}.location.address.city ;;
    group_label: "Location Address"
    group_item_label: "City"
  }

  dimension: location__address__country {
    type: string
    sql: ${TABLE}.location.address.country ;;
    group_label: "Location Address"
    group_item_label: "Country"
  }

  dimension: location__address__state {
    type: string
    sql: ${TABLE}.location.address.state ;;
    group_label: "Location Address"
    group_item_label: "State"
  }

  dimension: location__address__street {
    hidden: yes
    sql: ${TABLE}.location.address.street ;;
    group_label: "Location Address"
    group_item_label: "Street"
  }

  dimension: location__address__zip {
    type: string
    sql: ${TABLE}.location.address.zip ;;
    group_label: "Location Address"
    group_item_label: "Zip"
  }

  dimension: location__encounter_date {
    type: string
    sql: ${TABLE}.location.encounter_date ;;
    group_label: "Location"
    group_item_label: "Encounter Date"
  }

  dimension: location__name {
    type: string
    sql: ${TABLE}.location.name ;;
    group_label: "Location"
    group_item_label: "Name"
  }

  dimension: medications {
    hidden: yes
    sql: ${TABLE}.medications ;;
  }

  dimension: problems {
    hidden: yes
    sql: ${TABLE}.problems ;;
  }

  dimension: procedures {
    hidden: yes
    sql: ${TABLE}.procedures ;;
  }

  dimension: results {
    hidden: yes
    sql: ${TABLE}.results ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [location__name]
  }
}

view: ccda_file__results {
  dimension: code {
    type: string
    sql: code ;;
  }

  dimension: code_system {
    type: string
    sql: code_system ;;
  }

  dimension: code_system_name {
    type: string
    sql: code_system_name ;;
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: tests {
    hidden: yes
    sql: tests ;;
  }

  dimension: ccda_file__results {
    type: string
    hidden: yes
    sql: ccda_file__results ;;
  }
}

view: ccda_file__problems {
  dimension: age {
    type: string
    sql: age ;;
  }

  dimension: code {
    type: number
    sql: code ;;
  }

  dimension: code_system {
    type: string
    sql: code_system ;;
  }

  dimension: code_system_name {
    type: string
    sql: code_system_name ;;
  }

  dimension: comment {
    type: string
    sql: comment ;;
  }

  dimension: date_range__end {
    type: string
    sql: ${TABLE}.date_range.`end` ;;
    group_label: "Date Range"
    group_item_label: "End"
  }

  dimension: date_range__start {
    type: string
    sql: ${TABLE}.date_range.start ;;
    group_label: "Date Range"
    group_item_label: "Start"
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: status {
    type: string
    sql: status ;;
  }

  dimension: translation__code {
    type: number
    sql: ${TABLE}.translation.code ;;
    group_label: "Translation"
    group_item_label: "Code"
  }

  dimension: translation__code_system {
    type: string
    sql: ${TABLE}.translation.code_system ;;
    group_label: "Translation"
    group_item_label: "Code System"
  }

  dimension: translation__code_system_name {
    type: string
    sql: ${TABLE}.translation.code_system_name ;;
    group_label: "Translation"
    group_item_label: "Code System Name"
  }

  dimension: translation__name {
    type: string
    sql: ${TABLE}.translation.name ;;
    group_label: "Translation"
    group_item_label: "Name"
  }

  dimension: ccda_file__problems {
    type: string
    hidden: yes
    sql: ccda_file__problems ;;
  }
}

view: ccda_file__allergies {
  dimension: allergen__code {
    type: string
    sql: ${TABLE}.allergen.code ;;
    group_label: "Allergen"
    group_item_label: "Code"
  }

  dimension: allergen__code_system {
    type: string
    sql: ${TABLE}.allergen.code_system ;;
    group_label: "Allergen"
    group_item_label: "Code System"
  }

  dimension: allergen__code_system_name {
    type: string
    sql: ${TABLE}.allergen.code_system_name ;;
    group_label: "Allergen"
    group_item_label: "Code System Name"
  }

  dimension: allergen__name {
    type: string
    sql: ${TABLE}.allergen.name ;;
    group_label: "Allergen"
    group_item_label: "Name"
  }

  dimension: code {
    type: string
    sql: code ;;
  }

  dimension: code_system {
    type: string
    sql: code_system ;;
  }

  dimension: code_system_name {
    type: string
    sql: code_system_name ;;
  }

  dimension: date_range__end {
    type: string
    sql: ${TABLE}.date_range.`end` ;;
    group_label: "Date Range"
    group_item_label: "End"
  }

  dimension: date_range__start {
    type: string
    sql: ${TABLE}.date_range.start ;;
    group_label: "Date Range"
    group_item_label: "Start"
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: reaction__code {
    type: number
    sql: ${TABLE}.reaction.code ;;
    group_label: "Reaction"
    group_item_label: "Code"
  }

  dimension: reaction__code_system {
    type: string
    sql: ${TABLE}.reaction.code_system ;;
    group_label: "Reaction"
    group_item_label: "Code System"
  }

  dimension: reaction__name {
    type: string
    sql: ${TABLE}.reaction.name ;;
    group_label: "Reaction"
    group_item_label: "Name"
  }

  dimension: reaction_type__code {
    type: number
    sql: ${TABLE}.reaction_type.code ;;
    group_label: "Reaction Type"
    group_item_label: "Code"
  }

  dimension: reaction_type__code_system {
    type: string
    sql: ${TABLE}.reaction_type.code_system ;;
    group_label: "Reaction Type"
    group_item_label: "Code System"
  }

  dimension: reaction_type__code_system_name {
    type: string
    sql: ${TABLE}.reaction_type.code_system_name ;;
    group_label: "Reaction Type"
    group_item_label: "Code System Name"
  }

  dimension: reaction_type__name {
    type: string
    sql: ${TABLE}.reaction_type.name ;;
    group_label: "Reaction Type"
    group_item_label: "Name"
  }

  dimension: severity {
    type: string
    sql: severity ;;
  }

  dimension: status {
    type: string
    sql: status ;;
  }

  dimension: ccda_file__allergies {
    type: string
    hidden: yes
    sql: ccda_file__allergies ;;
  }
}

view: ccda_file__encounters {
  dimension: code {
    type: string
    sql: code ;;
  }

  dimension: code_system {
    type: string
    sql: code_system ;;
  }

  dimension: code_system_name {
    type: string
    sql: code_system_name ;;
  }

  dimension: code_system_version {
    type: string
    sql: code_system_version ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: findings {
    hidden: yes
    sql: findings ;;
  }

  dimension: location__city {
    type: string
    sql: ${TABLE}.location.city ;;
    group_label: "Location"
    group_item_label: "City"
  }

  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }

  dimension: location__organization {
    type: string
    sql: ${TABLE}.location.organization ;;
    group_label: "Location"
    group_item_label: "Organization"
  }

  dimension: location__state {
    type: string
    sql: ${TABLE}.location.state ;;
    group_label: "Location"
    group_item_label: "State"
  }

  dimension: location__street {
    hidden: yes
    sql: ${TABLE}.location.street ;;
    group_label: "Location"
    group_item_label: "Street"
  }

  dimension: location__zip {
    type: string
    sql: ${TABLE}.location.zip ;;
    group_label: "Location"
    group_item_label: "Zip"
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: performer__code {
    type: string
    sql: ${TABLE}.performer.code ;;
    group_label: "Performer"
    group_item_label: "Code"
  }

  dimension: performer__code_system {
    type: string
    sql: ${TABLE}.performer.code_system ;;
    group_label: "Performer"
    group_item_label: "Code System"
  }

  dimension: performer__code_system_name {
    type: string
    sql: ${TABLE}.performer.code_system_name ;;
    group_label: "Performer"
    group_item_label: "Code System Name"
  }

  dimension: performer__name {
    type: string
    sql: ${TABLE}.performer.name ;;
    group_label: "Performer"
    group_item_label: "Name"
  }

  dimension: translation__code {
    type: number
    sql: ${TABLE}.translation.code ;;
    group_label: "Translation"
    group_item_label: "Code"
  }

  dimension: translation__code_system {
    type: string
    sql: ${TABLE}.translation.code_system ;;
    group_label: "Translation"
    group_item_label: "Code System"
  }

  dimension: translation__code_system_name {
    type: string
    sql: ${TABLE}.translation.code_system_name ;;
    group_label: "Translation"
    group_item_label: "Code System Name"
  }

  dimension: translation__name {
    type: string
    sql: ${TABLE}.translation.name ;;
    group_label: "Translation"
    group_item_label: "Name"
  }

  dimension: ccda_file__encounters {
    type: string
    hidden: yes
    sql: ccda_file__encounters ;;
  }
}

view: ccda_file__procedures {
  dimension: code {
    type: string
    sql: code ;;
  }

  dimension: code_system {
    type: string
    sql: code_system ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: device__code {
    type: string
    sql: ${TABLE}.device.code ;;
    group_label: "Device"
    group_item_label: "Code"
  }

  dimension: device__code_system {
    type: string
    sql: ${TABLE}.device.code_system ;;
    group_label: "Device"
    group_item_label: "Code System"
  }

  dimension: device__name {
    type: string
    sql: ${TABLE}.device.name ;;
    group_label: "Device"
    group_item_label: "Name"
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: performer__city {
    type: string
    sql: ${TABLE}.performer.city ;;
    group_label: "Performer"
    group_item_label: "City"
  }

  dimension: performer__country {
    type: string
    sql: ${TABLE}.performer.country ;;
    group_label: "Performer"
    group_item_label: "Country"
  }

  dimension: performer__organization {
    type: string
    sql: ${TABLE}.performer.organization ;;
    group_label: "Performer"
    group_item_label: "Organization"
  }

  dimension: performer__phone {
    type: string
    sql: ${TABLE}.performer.phone ;;
    group_label: "Performer"
    group_item_label: "Phone"
  }

  dimension: performer__state {
    type: string
    sql: ${TABLE}.performer.state ;;
    group_label: "Performer"
    group_item_label: "State"
  }

  dimension: performer__street {
    hidden: yes
    sql: ${TABLE}.performer.street ;;
    group_label: "Performer"
    group_item_label: "Street"
  }

  dimension: performer__zip {
    type: string
    sql: ${TABLE}.performer.zip ;;
    group_label: "Performer"
    group_item_label: "Zip"
  }

  dimension: specimen__code {
    type: string
    sql: ${TABLE}.specimen.code ;;
    group_label: "Specimen"
    group_item_label: "Code"
  }

  dimension: specimen__code_system {
    type: string
    sql: ${TABLE}.specimen.code_system ;;
    group_label: "Specimen"
    group_item_label: "Code System"
  }

  dimension: specimen__name {
    type: string
    sql: ${TABLE}.specimen.name ;;
    group_label: "Specimen"
    group_item_label: "Name"
  }

  dimension: ccda_file__procedures {
    type: string
    hidden: yes
    sql: ccda_file__procedures ;;
  }
}

view: ccda_file__medications {
  dimension: administration__code {
    type: string
    sql: ${TABLE}.administration.code ;;
    group_label: "Administration"
    group_item_label: "Code"
  }

  dimension: administration__code_system {
    type: string
    sql: ${TABLE}.administration.code_system ;;
    group_label: "Administration"
    group_item_label: "Code System"
  }

  dimension: administration__code_system_name {
    type: string
    sql: ${TABLE}.administration.code_system_name ;;
    group_label: "Administration"
    group_item_label: "Code System Name"
  }

  dimension: administration__name {
    type: string
    sql: ${TABLE}.administration.name ;;
    group_label: "Administration"
    group_item_label: "Name"
  }

  dimension_group: date_range__end {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_range.`end` ;;
  }

  dimension: date_range__start {
    type: string
    sql: ${TABLE}.date_range.start ;;
    group_label: "Date Range"
    group_item_label: "Start"
  }

  dimension: dose_quantity__unit {
    type: string
    sql: ${TABLE}.dose_quantity.unit ;;
    group_label: "Dose Quantity"
    group_item_label: "Unit"
  }

  dimension: dose_quantity__value {
    type: number
    sql: ${TABLE}.dose_quantity.value ;;
    group_label: "Dose Quantity"
    group_item_label: "Value"
  }

  dimension: precondition__code {
    type: string
    sql: ${TABLE}.precondition.code ;;
    group_label: "Precondition"
    group_item_label: "Code"
  }

  dimension: precondition__code_system {
    type: string
    sql: ${TABLE}.precondition.code_system ;;
    group_label: "Precondition"
    group_item_label: "Code System"
  }

  dimension: precondition__name {
    type: string
    sql: ${TABLE}.precondition.name ;;
    group_label: "Precondition"
    group_item_label: "Name"
  }

  dimension: prescriber__organization {
    type: string
    sql: ${TABLE}.prescriber.organization ;;
    group_label: "Prescriber"
    group_item_label: "Organization"
  }

  dimension: prescriber__person {
    type: string
    sql: ${TABLE}.prescriber.person ;;
    group_label: "Prescriber"
    group_item_label: "Person"
  }

  dimension: product__code {
    type: number
    sql: ${TABLE}.product.code ;;
    group_label: "Product"
    group_item_label: "Code"
  }

  dimension: product__code_system {
    type: string
    sql: ${TABLE}.product.code_system ;;
    group_label: "Product"
    group_item_label: "Code System"
  }

  dimension: product__name {
    type: string
    sql: ${TABLE}.product.name ;;
    group_label: "Product"
    group_item_label: "Name"
  }

  dimension: product__text {
    type: string
    sql: ${TABLE}.product.text ;;
    group_label: "Product"
    group_item_label: "Text"
  }

  dimension: product__translation__code {
    type: number
    sql: ${TABLE}.product.translation.code ;;
    group_label: "Product Translation"
    group_item_label: "Code"
  }

  dimension: product__translation__code_system {
    type: string
    sql: ${TABLE}.product.translation.code_system ;;
    group_label: "Product Translation"
    group_item_label: "Code System"
  }

  dimension: product__translation__code_system_name {
    type: string
    sql: ${TABLE}.product.translation.code_system_name ;;
    group_label: "Product Translation"
    group_item_label: "Code System Name"
  }

  dimension: product__translation__name {
    type: string
    sql: ${TABLE}.product.translation.name ;;
    group_label: "Product Translation"
    group_item_label: "Name"
  }

  dimension: rate_quantity__unit {
    type: string
    sql: ${TABLE}.rate_quantity.unit ;;
    group_label: "Rate Quantity"
    group_item_label: "Unit"
  }

  dimension: rate_quantity__value {
    type: string
    sql: ${TABLE}.rate_quantity.value ;;
    group_label: "Rate Quantity"
    group_item_label: "Value"
  }

  dimension: reason__code {
    type: string
    sql: ${TABLE}.reason.code ;;
    group_label: "Reason"
    group_item_label: "Code"
  }

  dimension: reason__code_system {
    type: string
    sql: ${TABLE}.reason.code_system ;;
    group_label: "Reason"
    group_item_label: "Code System"
  }

  dimension: reason__name {
    type: string
    sql: ${TABLE}.reason.name ;;
    group_label: "Reason"
    group_item_label: "Name"
  }

  dimension: route__code {
    type: string
    sql: ${TABLE}.route.code ;;
    group_label: "Route"
    group_item_label: "Code"
  }

  dimension: route__code_system {
    type: string
    sql: ${TABLE}.route.code_system ;;
    group_label: "Route"
    group_item_label: "Code System"
  }

  dimension: route__code_system_name {
    type: string
    sql: ${TABLE}.route.code_system_name ;;
    group_label: "Route"
    group_item_label: "Code System Name"
  }

  dimension: route__name {
    type: string
    sql: ${TABLE}.route.name ;;
    group_label: "Route"
    group_item_label: "Name"
  }

  dimension: schedule__period_unit {
    type: string
    sql: ${TABLE}.schedule.period_unit ;;
    group_label: "Schedule"
    group_item_label: "Period Unit"
  }

  dimension: schedule__period_value {
    type: number
    sql: ${TABLE}.schedule.period_value ;;
    group_label: "Schedule"
    group_item_label: "Period Value"
  }

  dimension: schedule__type {
    type: string
    sql: ${TABLE}.schedule.type ;;
    group_label: "Schedule"
    group_item_label: "Type"
  }

  dimension: text {
    type: string
    sql: text ;;
  }

  dimension: vehicle__code {
    type: string
    sql: ${TABLE}.vehicle.code ;;
    group_label: "Vehicle"
    group_item_label: "Code"
  }

  dimension: vehicle__code_system {
    type: string
    sql: ${TABLE}.vehicle.code_system ;;
    group_label: "Vehicle"
    group_item_label: "Code System"
  }

  dimension: vehicle__code_system_name {
    type: string
    sql: ${TABLE}.vehicle.code_system_name ;;
    group_label: "Vehicle"
    group_item_label: "Code System Name"
  }

  dimension: vehicle__name {
    type: string
    sql: ${TABLE}.vehicle.name ;;
    group_label: "Vehicle"
    group_item_label: "Name"
  }

  dimension: ccda_file__medications {
    type: string
    hidden: yes
    sql: ccda_file__medications ;;
  }
}

view: ccda_file__immunizations {
  dimension_group: date {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: dose_quantity__unit {
    type: string
    sql: ${TABLE}.dose_quantity.unit ;;
    group_label: "Dose Quantity"
    group_item_label: "Unit"
  }

  dimension: dose_quantity__value {
    type: number
    sql: ${TABLE}.dose_quantity.value ;;
    group_label: "Dose Quantity"
    group_item_label: "Value"
  }

  dimension: education_type__code {
    type: string
    sql: ${TABLE}.education_type.code ;;
    group_label: "Education Type"
    group_item_label: "Code"
  }

  dimension: education_type__code_system {
    type: string
    sql: ${TABLE}.education_type.code_system ;;
    group_label: "Education Type"
    group_item_label: "Code System"
  }

  dimension: education_type__name {
    type: string
    sql: ${TABLE}.education_type.name ;;
    group_label: "Education Type"
    group_item_label: "Name"
  }

  dimension: instructions {
    type: string
    sql: instructions ;;
  }

  dimension: product__code {
    type: number
    sql: ${TABLE}.product.code ;;
    group_label: "Product"
    group_item_label: "Code"
  }

  dimension: product__code_system {
    type: string
    sql: ${TABLE}.product.code_system ;;
    group_label: "Product"
    group_item_label: "Code System"
  }

  dimension: product__code_system_name {
    type: string
    sql: ${TABLE}.product.code_system_name ;;
    group_label: "Product"
    group_item_label: "Code System Name"
  }

  dimension: product__lot_number {
    type: number
    sql: ${TABLE}.product.lot_number ;;
    group_label: "Product"
    group_item_label: "Lot Number"
  }

  dimension: product__manufacturer_name {
    type: string
    sql: ${TABLE}.product.manufacturer_name ;;
    group_label: "Product"
    group_item_label: "Manufacturer Name"
  }

  dimension: product__name {
    type: string
    sql: ${TABLE}.product.name ;;
    group_label: "Product"
    group_item_label: "Name"
  }

  dimension: product__translation__code {
    type: string
    sql: ${TABLE}.product.translation.code ;;
    group_label: "Product Translation"
    group_item_label: "Code"
  }

  dimension: product__translation__code_system {
    type: string
    sql: ${TABLE}.product.translation.code_system ;;
    group_label: "Product Translation"
    group_item_label: "Code System"
  }

  dimension: product__translation__code_system_name {
    type: string
    sql: ${TABLE}.product.translation.code_system_name ;;
    group_label: "Product Translation"
    group_item_label: "Code System Name"
  }

  dimension: product__translation__name {
    type: string
    sql: ${TABLE}.product.translation.name ;;
    group_label: "Product Translation"
    group_item_label: "Name"
  }

  dimension: route__code {
    type: string
    sql: ${TABLE}.route.code ;;
    group_label: "Route"
    group_item_label: "Code"
  }

  dimension: route__code_system {
    type: string
    sql: ${TABLE}.route.code_system ;;
    group_label: "Route"
    group_item_label: "Code System"
  }

  dimension: route__code_system_name {
    type: string
    sql: ${TABLE}.route.code_system_name ;;
    group_label: "Route"
    group_item_label: "Code System Name"
  }

  dimension: route__name {
    type: string
    sql: ${TABLE}.route.name ;;
    group_label: "Route"
    group_item_label: "Name"
  }

  dimension: ccda_file__immunizations {
    type: string
    hidden: yes
    sql: ccda_file__immunizations ;;
  }
}

view: ccda_file__documentation_of {
  dimension: address__city {
    type: string
    sql: ${TABLE}.address.city ;;
    group_label: "Address"
    group_item_label: "City"
  }

  dimension: address__country {
    type: string
    sql: ${TABLE}.address.country ;;
    group_label: "Address"
    group_item_label: "Country"
  }

  dimension: address__state {
    type: string
    sql: ${TABLE}.address.state ;;
    group_label: "Address"
    group_item_label: "State"
  }

  dimension: address__street {
    hidden: yes
    sql: ${TABLE}.address.street ;;
    group_label: "Address"
    group_item_label: "Street"
  }

  dimension: address__zip {
    type: string
    sql: ${TABLE}.address.zip ;;
    group_label: "Address"
    group_item_label: "Zip"
  }

  dimension: name__family {
    type: string
    sql: ${TABLE}.name.family ;;
    group_label: "Name"
    group_item_label: "Family"
  }

  dimension: name__given {
    hidden: yes
    sql: ${TABLE}.name.given ;;
    group_label: "Name"
    group_item_label: "Given"
  }

  dimension: name__prefix {
    type: string
    sql: ${TABLE}.name.prefix ;;
    group_label: "Name"
    group_item_label: "Prefix"
  }

  dimension: phone__work {
    type: string
    sql: ${TABLE}.phone.work ;;
    group_label: "Phone"
    group_item_label: "Work"
  }

  dimension: ccda_file__documentation_of {
    type: string
    hidden: yes
    sql: ccda_file__documentation_of ;;
  }
}

view: ccda_file__author__name__given {
  dimension: ccda_file__author__name__given {
    type: string
    sql: ccda_file__author__name__given ;;
  }
}

view: ccda_file__results__tests {
  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: code_system {
    type: string
    sql: ${TABLE}.code_system ;;
  }

  dimension: code_system_name {
    type: string
    sql: ${TABLE}.code_system_name ;;
  }

  dimension_group: date {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reference_range__high_unit {
    type: string
    sql: ${TABLE}.reference_range.high_unit ;;
    group_label: "Reference Range"
    group_item_label: "High Unit"
  }

  dimension: reference_range__high_value {
    type: number
    sql: ${TABLE}.reference_range.high_value ;;
    group_label: "Reference Range"
    group_item_label: "High Value"
  }

  dimension: reference_range__low_unit {
    type: string
    sql: ${TABLE}.reference_range.low_unit ;;
    group_label: "Reference Range"
    group_item_label: "Low Unit"
  }

  dimension: reference_range__low_value {
    type: number
    sql: ${TABLE}.reference_range.low_value ;;
    group_label: "Reference Range"
    group_item_label: "Low Value"
  }

  dimension: reference_range__text {
    type: string
    sql: ${TABLE}.reference_range.text ;;
    group_label: "Reference Range"
    group_item_label: "Text"
  }

  dimension: translation__code {
    type: string
    sql: ${TABLE}.translation.code ;;
    group_label: "Translation"
    group_item_label: "Code"
  }

  dimension: translation__code_system {
    type: string
    sql: ${TABLE}.translation.code_system ;;
    group_label: "Translation"
    group_item_label: "Code System"
  }

  dimension: translation__code_system_name {
    type: string
    sql: ${TABLE}.translation.code_system_name ;;
    group_label: "Translation"
    group_item_label: "Code System Name"
  }

  dimension: translation__name {
    type: string
    sql: ${TABLE}.translation.name ;;
    group_label: "Translation"
    group_item_label: "Name"
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: ccda_file__author__address__street {
  dimension: ccda_file__author__address__street {
    type: string
    sql: ccda_file__author__address__street ;;
  }
}

view: ccda_file__location__address__street {
  dimension: ccda_file__location__address__street {
    type: string
    sql: ccda_file__location__address__street ;;
  }
}

view: ccda_file__demographics__name__given {
  dimension: ccda_file__demographics__name__given {
    type: string
    sql: ccda_file__demographics__name__given ;;
  }
}

view: ccda_file__encounters__findings {
  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: code_system {
    type: string
    sql: ${TABLE}.code_system ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ccda_file__encounters__location__street {
  dimension: ccda_file__encounters__location__street {
    type: string
    sql: ccda_file__encounters__location__street ;;
  }
}

view: ccda_file__documentation_of__name__given {
  dimension: ccda_file__documentation_of__name__given {
    type: string
    sql: ccda_file__documentation_of__name__given ;;
  }
}

view: ccda_file__procedures__performer__street {
  dimension: ccda_file__procedures__performer__street {
    type: string
    sql: ccda_file__procedures__performer__street ;;
  }
}

view: ccda_file__demographics__address__street {
  dimension: ccda_file__demographics__address__street {
    type: string
    sql: ccda_file__demographics__address__street ;;
  }
}

view: ccda_file__documentation_of__address__street {
  dimension: ccda_file__documentation_of__address__street {
    type: string
    sql: ccda_file__documentation_of__address__street ;;
  }
}

view: ccda_file__demographics__guardian__name__given {
  dimension: ccda_file__demographics__guardian__name__given {
    type: string
    sql: ccda_file__demographics__guardian__name__given ;;
  }
}

view: ccda_file__demographics__provider__address__street {
  dimension: ccda_file__demographics__provider__address__street {
    type: string
    sql: ccda_file__demographics__provider__address__street ;;
  }
}

view: ccda_file__demographics__guardian__address__street {
  dimension: ccda_file__demographics__guardian__address__street {
    type: string
    sql: ccda_file__demographics__guardian__address__street ;;
  }
}
