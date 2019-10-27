view: time_dim {
  sql_table_name: TPCDS_SF10TCL.TIME_DIM ;;

  dimension: time_id {
    group_label: "Keys/IDs"
    label: "Time ID"
    type: string
    sql: ${TABLE}.T_TIME_ID ;;
  }

  dimension: time_sk {
    group_label: "Keys/IDs"
    label: "Time SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.T_TIME_SK ;;
  }

  dimension: am_pm {
    label: "AM / PM"
    type: string
    sql: ${TABLE}.T_AM_PM ;;
  }

  dimension: hour {
    label: "Hour"
    type: number
    sql: ${TABLE}.T_HOUR ;;
  }

  dimension: meal_time {
    label: "Meal Time"
    type: string
    sql: ${TABLE}.T_MEAL_TIME ;;
    hidden: yes
  }

  dimension: minute {
    label: "Minute"
    type: number
    sql: ${TABLE}.T_MINUTE ;;
    hidden: yes
  }

  dimension: second {
    label: "Second"
    type: number
    sql: ${TABLE}.T_SECOND ;;
    hidden: yes
  }

  dimension: shift {
    label: "Shift"
    type: string
    sql: ${TABLE}.T_SHIFT ;;
  }

  dimension: sub_shift {
    type: string
    sql: ${TABLE}.T_SUB_SHIFT ;;
  }

  dimension: time_int {
    label: "Time Integer"
    type: number
    sql: ${TABLE}.T_TIME ;;
  }

  dimension: time_str {
    label: "Time String"
    type: string
    sql: lpad(${hour}, 2) || ':' || lpad(${minute}, 2) || ':' ||
          lpad(${second}, 2)  ;;
  }

  measure: count {
    label: "Number of Seconds"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      time_id,
      time_str
    ]
  }
}
