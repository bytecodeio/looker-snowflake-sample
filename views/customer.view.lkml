view: customer {
  drill_fields: [detail*]
  derived_table: {
    sql:
        SELECT o.*,
        dateadd(year, 16, sa.d_date) AS first_sales_date,
        dateadd(year, 16, sh.d_date) AS first_ship_date,
        dateadd(year, 16, lr.d_date) AS last_review_date
        FROM tpcds_sf10tcl.customer o
        LEFT JOIN tpcds_sf10tcl.date_dim sa
          ON o.c_first_sales_date_sk = sa.d_date_sk
        LEFT JOIN tpcds_sf10tcl.date_dim sh
          ON o.c_first_shipto_date_sk = sh.d_date_sk
        LEFT JOIN tpcds_sf10tcl.date_dim lr
          ON o.c_last_review_date = lr.d_date_sk ;;
  }

  dimension: customer_sk {
    group_label: "Keys/IDs"
    label: "Customer SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.C_CUSTOMER_SK ;;
  }

  dimension: customer_id {
    group_label: "Keys/IDs"
    label: "Customer ID"
    type: string
    sql: ${TABLE}.C_CUSTOMER_ID ;;
  }

  dimension: birth_country {
    label: "Birth Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.C_BIRTH_COUNTRY ;;
  }

  dimension_group: birthday {
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
    sql:DATE_FROM_PARTS(${birth_year}, ${birth_month}, ${birth_day}) ;;
  }

  dimension: birth_day {
    type: number
    sql: ${TABLE}.C_BIRTH_DAY ;;
    hidden: yes
  }

  dimension: birth_month {
    type: number
    sql: ${TABLE}.C_BIRTH_MONTH ;;
    hidden: yes
  }

  dimension: birth_year {
    type: number
    sql: ${TABLE}.C_BIRTH_YEAR ;;
    hidden: yes
  }

  dimension: current_addr_sk {
    group_label: "Keys/IDs"
    label: "Current Address SK"
    type: number
    sql: ${TABLE}.C_CURRENT_ADDR_SK ;;
  }

  dimension: current_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Current Customer Demographics SK"
    type: number
    sql: ${TABLE}.C_CURRENT_CDEMO_SK ;;
  }

  dimension: current_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Current Household Demographics SK"
    type: number
    sql: ${TABLE}.C_CURRENT_HDEMO_SK ;;
  }

  dimension: email_address {
    label: "Email"
    type: string
    sql: ${TABLE}.C_EMAIL_ADDRESS ;;
  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.C_FIRST_NAME ;;
  }

  dimension: full_name {
    label: "Full Name"
    type: string
    sql: ${first_name} || ' ' || ${last_name} ;;
  }

  dimension_group: first_sales {
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
    sql: ${TABLE}.first_sales_date ;;
  }

  dimension_group: first_ship_to {
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
    sql: ${TABLE}.first_ship_date ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.C_LAST_NAME ;;
  }

  dimension: last__first_name {
    label: "Last, First Name"
    type: string
    sql: ${last_name} || ', ' || ${first_name} ;;
  }

  dimension_group: last_review {
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
    sql: ${TABLE}.last_review_date ;;
  }

  dimension: login {
    label: "Login"
    type: string
    sql: ${TABLE}.C_LOGIN ;;
    hidden: yes
  }

  dimension: preferred_cust_flag {
    label: "Is Preferred Customer"
    type: string
    sql: ${TABLE}.C_PREFERRED_CUST_FLAG = 'Y' ;;
  }

  dimension: salutation {
    label: "Salutation"
    type: string
    sql: ${TABLE}.C_SALUTATION ;;
  }

  measure: count {
    label: "Number of Customers"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      customer_id,
      full_name,
      salutation,
      email_address,
      first_sales_date
    ]
  }
}
