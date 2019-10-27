view: call_center {
  view_label: "Call Center"
  drill_fields: [detail*]
  derived_table: {
    sql:
          SELECT o.*,
          dateadd(year, 16, od.d_date) AS open_date,
          dateadd(year, 16, cd.d_date) AS closed_date

          FROM tpcds_sf10tcl.call_center o
          INNER JOIN (
              SELECT
                  MAX(cc_call_center_sk) AS max_sk,
                  cc_call_center_id
              FROM tpcds_sf10tcl.call_center
              GROUP BY cc_call_center_id ) oo
          ON o.cc_call_center_id = oo.cc_call_center_id
          AND o.cc_call_center_sk = oo.max_sk

          LEFT JOIN tpcds_sf10tcl.date_dim od
            ON o.cc_open_date_sk = od.d_date_sk
          LEFT JOIN tpcds_sf10tcl.date_dim cd
            ON o.cc_closed_date_sk = cd.d_date_sk ;;
  }

  dimension: call_center_sk {
    group_label: "Keys/IDs"
    label: "Call Center SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.CC_CALL_CENTER_SK ;;
  }

  dimension: call_center_id {
    group_label: "Keys/IDs"
    label: "Call Center ID"
    type: string
    sql: ${TABLE}.CC_CALL_CENTER_ID ;;
  }

  dimension: city {
    group_label: "Address"
    label: "City"
    type: string
    sql: ${TABLE}.CC_CITY ;;
  }

  dimension: class {
    label: "Class"
    type: string
    sql: ${TABLE}.CC_CLASS ;;
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
    sql: ${TABLE}.closed_date ;;
  }

  dimension: company {
    group_label: "Keys/IDs"
    label: "Company ID"
    type: number
    sql: ${TABLE}.CC_COMPANY ;;
  }

  dimension: company_name {
    label: "Company Name"
    type: string
    sql: ${TABLE}.CC_COMPANY_NAME ;;
  }

  dimension: country {
    group_label: "Address"
    label: "Country"
    type: string
    sql: ${TABLE}.CC_COUNTRY ;;
  }

  dimension: county {
    group_label: "Address"
    label: "County"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.CC_COUNTY ;;
  }

  dimension: division {
    group_label: "Keys/IDs"
    label: "Division ID"
    type: number
    sql: ${TABLE}.CC_DIVISION ;;
  }

  dimension: division_name {
    label: "Division Name"
    type: string
    sql: ${TABLE}.CC_DIVISION_NAME ;;
  }

  dimension: employees {
    label: "Employees"
    type: number
    sql: ${TABLE}.CC_EMPLOYEES ;;
  }

  dimension: gmt_offset {
    label: "GMT Offset"
    type: number
    sql: ${TABLE}.CC_GMT_OFFSET ;;
  }

  dimension: hours {
    label: "Hours"
    type: string
    sql: ${TABLE}.CC_HOURS ;;
  }

  dimension: manager {
    label: "Manager"
    type: string
    sql: ${TABLE}.CC_MANAGER ;;
  }

  dimension: market_manager {
    label: "Market Manager"
    type: string
    sql: ${TABLE}.CC_MARKET_MANAGER ;;
  }

  dimension: mkt_class {
    label: "Market Class"
    type: string
    sql: ${TABLE}.CC_MKT_CLASS ;;
  }

  dimension: mkt_desc {
    label: "Market Description"
    type: string
    sql: ${TABLE}.CC_MKT_DESC ;;
  }

  dimension: mkt_id {
    group_label: "Keys/IDs"
    label: "Market ID"
    type: number
    sql: ${TABLE}.CC_MKT_ID ;;
  }

  dimension: name {
    label: "Call Center Name"
    type: string
    sql: ${TABLE}.CC_NAME ;;
  }

  dimension_group: open {
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
    sql: ${TABLE}.open_date ;;
  }

  dimension: sq_ft {
    label: "Square Feet"
    type: number
    sql: ${TABLE}.CC_SQ_FT ;;
  }

  dimension: state {
    group_label: "Address"
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.CC_STATE ;;
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
    sql: ${TABLE}.CC_STREET_NAME ;;
    hidden: yes
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.CC_STREET_NUMBER ;;
    hidden: yes
  }

  dimension: street_type {
    type: string
    sql: ${TABLE}.CC_STREET_TYPE ;;
    hidden: yes
  }

  dimension: suite_number {
    type: string
    sql: ${TABLE}.CC_SUITE_NUMBER ;;
    hidden: yes
  }

  dimension: tax_percentage {
    label: "Tax Percentage"
    type: number
    value_format_name: percent_1
    sql: ${TABLE}.CC_TAX_PERCENTAGE ;;
  }

  dimension: zip {
    group_label: "Address"
    label: "Zip"
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.CC_ZIP ;;
  }

  measure: count {
    label: "Number of Call Centers"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      call_center_id,
      name,
      company_name,
      division_name,
      city,
      state,
      country
    ]
  }
}
