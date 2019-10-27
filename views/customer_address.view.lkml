view: customer_address {
  sql_table_name: TPCDS_SF10TCL.CUSTOMER_ADDRESS ;;

  dimension: address_id {
    group_label: "Keys/IDs"
    label: "Address ID"
    type: string
    sql: ${TABLE}.CA_ADDRESS_ID ;;
  }

  dimension: address_sk {
    group_label: "Keys/IDs"
    label: "Address SK"
    type: number
    sql: ${TABLE}.CA_ADDRESS_SK ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.CA_CITY ;;
  }

  dimension: country {
    label: "Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.CA_COUNTRY ;;
  }

  dimension: county {
    label: "County"
    type: string
    sql: ${TABLE}.CA_COUNTY ;;
  }

  dimension: gmt_offset {
    label: "GMT Offset"
    type: number
    sql: ${TABLE}.CA_GMT_OFFSET ;;
  }

  dimension: location_type {
    label: "Location Type"
    type: string
    sql: ${TABLE}.CA_LOCATION_TYPE ;;
  }

  dimension: state {
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.CA_STATE ;;
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
    sql: ${TABLE}.CA_STREET_NAME ;;
    hidden: yes
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.CA_STREET_NUMBER ;;
    hidden: yes
  }

  dimension: street_type {
    type: string
    sql: ${TABLE}.CA_STREET_TYPE ;;
    hidden: yes
  }

  dimension: suite_number {
    type: string
    sql: ${TABLE}.CA_SUITE_NUMBER ;;
    hidden: yes
  }

  dimension: zip {
    label: "Zip"
    type: string
    sql: ${TABLE}.CA_ZIP ;;
  }

  measure: count {
    label: "Number of Customer Addresses"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      address_id,
      street_address,
      city,
      state,
      zip,
      country
    ]
  }
}
