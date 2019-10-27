view: dbgen_version {
  sql_table_name: TPCDS_SF10TCL.DBGEN_VERSION ;;

  dimension: cmdline_args {
    type: string
    sql: ${TABLE}.DV_CMDLINE_ARGS ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}.DV_CREATE_DATE ;;
  }

  dimension: create_time {
    type: string
    sql: ${TABLE}.DV_CREATE_TIME ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.DV_VERSION ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
