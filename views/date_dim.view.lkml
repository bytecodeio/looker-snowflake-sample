view: date_dim {
  sql_table_name: TPCDS_SF10TCL.DATE_DIM ;;

  dimension: date_id {
    group_label: "Keys/IDs"
    label: "Date ID"
    type: string
    primary_key: yes
    sql: ${TABLE}.D_DATE_ID ;;
  }

  dimension: date_sk {
    group_label: "Keys/IDs"
    label: "Date SK"
    type: number
    sql: ${TABLE}.D_DATE_SK ;;
  }

  dimension: current_day {
    group_label: "Current"
    label: "Is Current Day"
    type: string
    sql: ${TABLE}.D_CURRENT_DAY = 'Y' ;;
  }

  dimension: current_month {
    group_label: "Current"
    label: "Is Current Month"
    type: string
    sql: ${TABLE}.D_CURRENT_MONTH = 'Y' ;;
  }

  dimension: current_quarter {
    group_label: "Current"
    label: "Is Current Quarter"
    type: string
    sql: ${TABLE}.D_CURRENT_QUARTER = 'Y' ;;
  }

  dimension: current_week {
    group_label: "Current"
    label: "Is Current Week"
    type: string
    sql: ${TABLE}.D_CURRENT_WEEK = 'Y' ;;
  }

  dimension: current_year {
    label: "Is Current Year"
    type: string
    sql: ${TABLE}.D_CURRENT_YEAR = 'Y' ;;
  }

  dimension_group: calendar {
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
    sql: ${TABLE}.D_DATE ;;
  }

  dimension: day_name {
    label: "Day Name"
    type: string
    sql: ${TABLE}.D_DAY_NAME ;;
  }

  dimension: day {
    label: "Day of Month"
    type: number
    sql: ${TABLE}.D_DOM ;;
  }

  dimension: dow {
    label: "Day of Week"
    type: number
    sql: ${TABLE}.D_DOW ;;
  }

  dimension: first_dom {
    label: "First Day of Month"
    type: number
    sql: ${TABLE}.D_FIRST_DOM ;;
  }

  dimension: following_holiday {
    label: "Is Following Holiday"
    type: yesno
    sql: ${TABLE}.D_FOLLOWING_HOLIDAY = 'Y' ;;
  }

  dimension: fy_quarter_seq {
    group_label: "Fiscal"
    label: "FY Quarter Sequence"
    type: number
    sql: ${TABLE}.D_FY_QUARTER_SEQ ;;
  }

  dimension: fy_week_seq {
    group_label: "Fiscal"
    label: "FY Week Sequence"
    type: number
    sql: ${TABLE}.D_FY_WEEK_SEQ ;;
  }

  dimension: fy_year {
    group_label: "Fiscal"
    label: "FY Year"
    type: number
    sql: ${TABLE}.D_FY_YEAR ;;
  }

  dimension: holiday {
    label: "Is Holiday"
    type: yesno
    sql: ${TABLE}.D_HOLIDAY = 'Y' ;;
  }

  dimension: last_dom {
    label: "Last Day of Month"
    type: number
    sql: ${TABLE}.D_LAST_DOM ;;
  }

  dimension: month_seq {
    label: "Month Sequence"
    type: number
    sql: ${TABLE}.D_MONTH_SEQ ;;
  }

  dimension: month {
    label: "Month of Year"
    type: number
    sql: ${TABLE}.D_MOY ;;
  }

  dimension: qoy {
    label: "Quarter of Year"
    type: number
    sql: ${TABLE}.D_QOY ;;
  }

  dimension: quarter_name {
    label: "Quarter Name"
    type: string
    sql: ${TABLE}.D_QUARTER_NAME ;;
  }

  dimension: quarter_seq {
    label: "Quarter Sequence"
    type: number
    sql: ${TABLE}.D_QUARTER_SEQ ;;
  }

  dimension: same_day_lq {
    label: "Sale Day Last Qtr"
    type: number
    sql: ${TABLE}.D_SAME_DAY_LQ ;;
  }

  dimension: same_day_ly {
    label: "Same Day Last Year"
    type: number
    sql: ${TABLE}.D_SAME_DAY_LY ;;
  }

  dimension: week_seq {
    label: "Week Sequence"
    type: number
    sql: ${TABLE}.D_WEEK_SEQ ;;
  }

  dimension: weekend {
    label: "Is Weekend"
    type: yesno
    sql: ${TABLE}.D_WEEKEND = 'Y' ;;
  }

  dimension: year {
    label: "Year"
    type: number
    sql: ${TABLE}.D_YEAR ;;
  }

  measure: count {
    type: count
    drill_fields: [
      calendar_date
    ]
  }
}
