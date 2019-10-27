view: warehouse {
  sql_table_name: TPCDS_SF10TCL.WAREHOUSE ;;
  drill_fields: [detail*]

  dimension: warehouse_sk {
    group_label: "Keys/IDs"
    label: "Warehouse SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.W_WAREHOUSE_SK ;;
  }

  dimension: warehouse_id {
    group_label: "Keys/IDs"
    label: "Warehouse ID"
    type: string
    sql: ${TABLE}.W_WAREHOUSE_ID ;;
  }

  dimension: city {
    group_label: "Address"
    label: "City"
    type: string
    sql: ${TABLE}.W_CITY ;;
  }

  dimension: country {
    group_label: "Address"
    label: "Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.W_COUNTRY ;;
  }

  dimension: county {
    group_label: "Address"
    label: "County"
    type: string
    sql: ${TABLE}.W_COUNTY ;;
  }

  dimension: gmt_offset {
    label: "GMT Offset"
    type: number
    sql: ${TABLE}.W_GMT_OFFSET ;;
  }

  dimension: state {
    group_label: "Address"
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.W_STATE ;;
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
    sql: ${TABLE}.W_STREET_NAME ;;
    hidden: yes
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.W_STREET_NUMBER ;;
    hidden: yes
  }

  dimension: street_type {
    type: string
    sql: ${TABLE}.W_STREET_TYPE ;;
    hidden: yes
  }

  dimension: suite_number {
    type: string
    sql: ${TABLE}.W_SUITE_NUMBER ;;
    hidden: yes
  }

  dimension: warehouse_name {
    label: "Warehouse Name"
    type: string
    sql: ${TABLE}.W_WAREHOUSE_NAME ;;
  }

  dimension: warehouse_sq_ft {
    label: "Warehouse Sq Ft"
    type: number
    sql: ${TABLE}.W_WAREHOUSE_SQ_FT ;;
  }

  dimension: zip {
    group_label: "Address"
    label: "Zip"
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.W_ZIP ;;
  }

  measure: count {
    label: "Number of Warehouses"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      warehouse_id,
      warehouse_name,
      street_name,
      city,
      state,
      country
    ]
  }
}
