view: reason {
  sql_table_name: TPCDS_SF10TCL.REASON ;;
  drill_fields: [detail*]

  dimension: reason_id {
    group_label: "Keys/IDs"
    label: "Reason ID"
    primary_key: yes
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

  dimension: reason_sk {
    group_label: "Keys/IDs"
    label: "Reason SK"
    type: number
    sql: ${TABLE}.R_REASON_SK ;;
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
