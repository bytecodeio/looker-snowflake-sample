view: ship_mode {
  sql_table_name: TPCDS_SF10TCL.SHIP_MODE ;;
  drill_fields: [detail*]

  dimension: ship_mode_sk {
    group_label: "Keys/IDs"
    label: "Ship Mode SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.SM_SHIP_MODE_SK ;;
  }

  dimension: ship_mode_id {
    group_label: "Keys/IDs"
    label: "Ship Mode ID"
    type: string
    sql: ${TABLE}.SM_SHIP_MODE_ID ;;
  }

  dimension: carrier {
    label: "Carrier"
    type: string
    sql: ${TABLE}.SM_CARRIER ;;
  }

  dimension: code {
    label: "Code"
    type: string
    sql: ${TABLE}.SM_CODE ;;
  }

  dimension: contract {
    label: "Contract"
    type: string
    sql: ${TABLE}.SM_CONTRACT ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}.SM_TYPE ;;
  }

  measure: count {
    label: "Number of Ship Modes"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      ship_mode_id,
      carrier,
      type,
      contract,
      code
    ]
  }
}
