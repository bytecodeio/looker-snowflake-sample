view: household_demographics {
  sql_table_name: TPCDS_SF10TCL.HOUSEHOLD_DEMOGRAPHICS ;;
  drill_fields: [detail*]

  dimension: demo_sk {
    group_label: "Keys/IDs"
    label: "Demo SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.HD_DEMO_SK ;;
  }

  dimension: buy_potential {
    label: "Buy Potential"
    type: string
    sql: ${TABLE}.HD_BUY_POTENTIAL ;;
  }

  dimension: dep_count {
    group_label: "Numerical Dimensions"
    label: "Dependents Count"
    type: number
    sql: ${TABLE}.HD_DEP_COUNT ;;
  }

  dimension: income_band_sk {
    group_label: "Keys/IDs"
    label: "Income Band SK"
    type: number
    sql: ${TABLE}.HD_INCOME_BAND_SK ;;
  }

  dimension: vehicle_count {
    group_label: "Numerical Dimensions"
    label: "Vehicle Count"
    type: number
    sql: ${TABLE}.HD_VEHICLE_COUNT ;;
  }

  measure: count {
    label: "Number of Demographic Records"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      demo_sk,
      buy_potential,
      dep_count,
      vehicle_count
    ]
  }
}
