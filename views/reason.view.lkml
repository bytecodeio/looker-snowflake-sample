view: reason {
  sql_table_name: TPCDS_SF10TCL.REASON ;;
  drill_fields: [detail*]

  dimension: reason_sk {
    group_label: "Keys/IDs"
    label: "Reason SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.R_REASON_SK ;;
  }

  dimension: reason_id {
    group_label: "Keys/IDs"
    label: "Reason ID"
    type: string
    sql: ${TABLE}.R_REASON_ID ;;
    hidden: yes
  }

  dimension: reason_desc {
    label: "Reason Description"
    type: string
    sql: ${TABLE}.R_REASON_DESC ;;
    hidden: yes
  }

  measure: count {
    label: "Number of Reasons"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      reason_id,
      reason_desc
    ]
  }
}
