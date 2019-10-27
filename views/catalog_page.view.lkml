view: catalog_page {
  view_label: "Catalog Page"
  drill_fields: [detail*]
  derived_table: {
    sql:
        SELECT o.*,
        dateadd(year, 16, ed.d_date) AS end_date,
        dateadd(year, 16, sd.d_date) AS start_date
        FROM tpcds_sf10tcl.catalog_page o
        LEFT JOIN tpcds_sf10tcl.date_dim ed
          ON o.cp_end_date_sk = ed.d_date_sk
        LEFT JOIN tpcds_sf10tcl.date_dim sd
          ON o.cp_start_date_sk = sd.d_date_sk ;;
  }

  dimension: catalog_page_sk {
    group_label: "Keys/IDs"
    label: "Catalog Page SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.CP_CATALOG_PAGE_SK ;;
  }

  dimension: catalog_page_id {
    group_label: "Keys/IDs"
    label: "Catalog Page ID"
    type: string
    sql: ${TABLE}.CP_CATALOG_PAGE_ID ;;
  }

  dimension: catalog_number {
    label: "Catalog Number"
    type: number
    sql: ${TABLE}.CP_CATALOG_NUMBER ;;
  }

  dimension: catalog_page_number {
    label: "Catalog Page Number"
    type: number
    sql: ${TABLE}.CP_CATALOG_PAGE_NUMBER ;;
  }

  dimension: department {
    label: "Department"
    type: string
    sql: ${TABLE}.CP_DEPARTMENT ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: ${TABLE}.CP_DESCRIPTION ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}.CP_TYPE ;;
  }

  measure: count {
    label: "Number of Catalog Pages"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      catalog_page_id,
      catalog_number,
      catalog_page_number,
      type,
      department,
      description,
      start_date,
      end_date
    ]
  }
}
