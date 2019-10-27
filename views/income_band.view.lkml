view: income_band {
  sql_table_name: TPCDS_SF10TCL.INCOME_BAND ;;

  dimension: income_band_sk {
    group_label: "Keys/IDs"
    label: "Income Band SK"
    type: number
    sql: ${TABLE}.IB_INCOME_BAND_SK ;;
  }

  dimension: income_band {
    label: "Income Band"
    type: string
    sql: ${lower_bound} || ' to ' || ${upper_bound} ;;
  }

  dimension: lower_bound {
    label: "Income Band Lower"
    type: number
    value_format_name: usd
    sql: ${TABLE}.IB_LOWER_BOUND ;;
  }

  dimension: upper_bound {
    label: "Income Band Upper"
    type: number
    value_format_name: usd
    sql: ${TABLE}.IB_UPPER_BOUND ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      income_band_sk,
      income_band,
      lower_bound,
      upper_bound
    ]
  }
}
