view: website {
  drill_fields: [detail*]
  derived_table: {
    sql: SELECT o.*,
          dateadd(year, 20, od.d_date) AS open_date,
          dateadd(year, 20, cd.d_date) AS close_date

          FROM tpcds_sf10tcl.web_site o
          INNER JOIN (
              SELECT
                  MAX(web_site_sk) AS max_sk,
                  web_site_id
              FROM tpcds_sf10tcl.web_site
              GROUP BY web_site_id ) oo
          ON o.web_site_id = oo.web_site_id
          AND o.web_site_sk = oo.max_sk

          LEFT JOIN tpcds_sf10tcl.date_dim od
            ON o.web_open_date_sk = od.d_date_sk
          LEFT JOIN tpcds_sf10tcl.date_dim cd
            ON o.web_close_date_sk = cd.d_date_sk  ;;
  }

  dimension: website_sk {
    group_label: "Keys/IDs"
    label: "Website SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.WEB_SITE_SK ;;
  }

  dimension: website_id {
    group_label: "Keys/IDs"
    label: "Website SK"
    type: string
    sql: ${TABLE}.WEB_SITE_ID ;;
  }

  dimension: city {
    group_label: "Address"
    label: "City"
    type: string
    sql: ${TABLE}.WEB_CITY ;;
  }

  dimension: class {
    label: "Class"
    type: string
    sql: ${TABLE}.WEB_CLASS ;;
  }

  dimension_group: close {
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
    sql: ${TABLE}.close_date ;;
  }

  dimension: company_id {
    group_label: "Keys/IDs"
    label: "Company ID"
    type: number
    sql: ${TABLE}.WEB_COMPANY_ID ;;
  }

  dimension: company_name {
    label: "Company Name"
    type: string
    sql: ${TABLE}.WEB_COMPANY_NAME ;;
  }

  dimension: country {
    group_label: "Address"
    label: "Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.WEB_COUNTRY ;;
  }

  dimension: county {
    group_label: "Address"
    label: "County"
    type: string
    sql: ${TABLE}.WEB_COUNTY ;;
  }

  dimension: gmt_offset {
    label: "GMT Offset"
    type: number
    sql: ${TABLE}.WEB_GMT_OFFSET ;;
  }

  dimension: manager {
    label: "Manager"
    type: string
    sql: ${TABLE}.WEB_MANAGER ;;
  }

  dimension: market_manager {
    label: "Market Maanger"
    type: string
    sql: ${TABLE}.WEB_MARKET_MANAGER ;;
  }

  dimension: mkt_class {
    label: "Market Class"
    type: string
    sql: ${TABLE}.WEB_MKT_CLASS ;;
  }

  dimension: mkt_desc {
    label: "Market Description"
    type: string
    sql: ${TABLE}.WEB_MKT_DESC ;;
  }

  dimension: mkt_id {
    group_label: "Keys/IDs"
    label: "Market ID"
    type: number
    sql: ${TABLE}.WEB_MKT_ID ;;
  }

  dimension: name {
    label: "Website Name"
    type: string
    sql: ${TABLE}.WEB_NAME ;;
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

  dimension: state {
    group_label: "Address"
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.WEB_STATE ;;
  }

  dimension: street_address {
    group_label: "Address"
    label: "Street Address"
    type: string
    sql: TRIM(${street_number} || ' ' || ${street_name} || ' ' || ${street_type}
      || ' ' || ${suite_number}) ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}.WEB_STREET_NAME ;;
    hidden: yes
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.WEB_STREET_NUMBER ;;
    hidden: yes
  }

  dimension: street_type {
    type: string
    sql: ${TABLE}.WEB_STREET_TYPE ;;
    hidden: yes
  }

  dimension: suite_number {
    type: string
    sql: ${TABLE}.WEB_SUITE_NUMBER ;;
    hidden: yes
  }

  dimension: tax_percentage {
    label: "Tax Percentage"
    type: number
    sql: ${TABLE}.WEB_TAX_PERCENTAGE ;;
  }

  dimension: zip {
    group_label: "Address"
    label: "Zip"
    type: string
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.WEB_ZIP ;;
  }

  measure: count {
    label: "Number of Websites"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      website_id,
      name,
      company_name,
      mkt_class,
      class,
      market_manager,
      manager,
      city,
      state,
      country
    ]
  }
}
