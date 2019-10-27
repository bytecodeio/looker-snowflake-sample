view: store {
  sql_table_name: TPCDS_SF10TCL.STORE ;;
  drill_fields: [detail*]

  dimension: store_sk {
    group_label: "Keys/IDs"
    label: "Store SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.S_STORE_SK ;;
  }

  dimension: store_id {
    group_label: "Keys/IDs"
    label: "Store ID"
    type: string
    sql: ${TABLE}.S_STORE_ID ;;
  }

  dimension: city {
    group_label: "Address"
    label: "City"
    type: string
    sql: ${TABLE}.S_CITY ;;
  }

  dimension: closed_date_sk {
    group_label: "Keys/IDs"
    label: "Closed Date SK"
    type: number
    sql: ${TABLE}.S_CLOSED_DATE_SK ;;
  }

  dimension_group: closed {
    type: time
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
    sql: ${closed_date.calendar_raw} ;;
  }

  dimension: company_id {
    group_label: "Keys/IDs"
    label: "Company ID"
    type: number
    sql: ${TABLE}.S_COMPANY_ID ;;
  }

  dimension: company_name {
    group_label: "Keys/IDs"
    label: "Company Name"
    type: string
    sql: ${TABLE}.S_COMPANY_NAME ;;
  }

  dimension: country {
    group_label: "Address"
    label: "Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.S_COUNTRY ;;
  }

  dimension: county {
    group_label: "Address"
    label: "County"
    type: string
    sql: ${TABLE}.S_COUNTY ;;
  }

  dimension: division_id {
    group_label: "Keys/IDs"
    label: "Division ID"
    type: number
    sql: ${TABLE}.S_DIVISION_ID ;;
  }

  dimension: division_name {
    label: "Division Name"
    type: string
    sql: ${TABLE}.S_DIVISION_NAME ;;
  }

  dimension: floor_space {
    label: "Floor Space"
    type: number
    sql: ${TABLE}.S_FLOOR_SPACE ;;
  }

  dimension: geography_class {
    label: "Geography Class"
    type: string
    sql: ${TABLE}.S_GEOGRAPHY_CLASS ;;
  }

  dimension: gmt_offset {
    label: "GMT Offset"
    type: number
    sql: ${TABLE}.S_GMT_OFFSET ;;
  }

  dimension: hours {
    label: "Hours"
    type: string
    sql: ${TABLE}.S_HOURS ;;
  }

  dimension: manager {
    label: "Manager"
    type: string
    sql: ${TABLE}.S_MANAGER ;;
  }

  dimension: market_desc {
    label: "Market Description"
    type: string
    sql: ${TABLE}.S_MARKET_DESC ;;
  }

  dimension: market_id {
    group_label: "Keys/IDs"
    label: "Market ID"
    type: number
    sql: ${TABLE}.S_MARKET_ID ;;
  }

  dimension: market_manager {
    label: "Market Manager"
    type: string
    sql: ${TABLE}.S_MARKET_MANAGER ;;
  }

  dimension: number_employees {
    label: "Number of Employees"
    type: number
    sql: ${TABLE}.S_NUMBER_EMPLOYEES ;;
  }

  dimension_group: record_end {
    type: time
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
    sql: ${TABLE}.S_REC_END_DATE ;;
  }

  dimension_group: record_start {
    type: time
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
    sql: ${TABLE}.S_REC_START_DATE ;;
  }

  dimension: state {
    group_label: "Address"
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.S_STATE ;;
  }

  dimension: store_name {
    label: "Store Name"
    type: string
    sql: ${TABLE}.S_STORE_NAME ;;
  }

  dimension: street_address {
    group_label: "Address"
    label: "Stree Address"
    type: string
    sql: TRIM(${street_number} || ' ' || ${street_name} || ' ' || ${street_type}
      || ' ' || ${suite_number}) ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}.S_STREET_NAME ;;
    hidden: yes
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.S_STREET_NUMBER ;;
    hidden: yes
  }

  dimension: street_type {
    type: string
    sql: ${TABLE}.S_STREET_TYPE ;;
    hidden: yes
  }

  dimension: suite_number {
    type: string
    sql: ${TABLE}.S_SUITE_NUMBER ;;
    hidden: yes
  }

  dimension: tax_precentage {
    label: "Tax Percentage"
    type: number
    sql: ${TABLE}.S_TAX_PRECENTAGE ;;
  }

  dimension: zip {
    group_label: "Address"
    label: "Zip"
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.S_ZIP ;;
  }

  measure: count {
    label: "Number of Stores"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      store_id,
      store_name,
      company_name,
      division_name,
      market_desc,
      market_manager,
      city,
      state,
      country
    ]
  }
}
