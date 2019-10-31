view: categories {
  view_label: "Categories"
  sql_table_name: HACKATHON.CATEGORIES ;;

  dimension: cat_id {
    label: "Category ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.CAT_ID ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_BATCHED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
    hidden: yes
  }

  dimension: cat_desc {
    label: "Category Descriptions"
    type: string
    sql: ${TABLE}.CAT_DESC ;;
  }

  dimension: cat_group {
    label: "Category Group"
    type: string
    sql: ${TABLE}.CAT_GROUP ;;
  }

  dimension: cat_name {
    label: "Category Name"
    type: string
    sql: ${TABLE}.CAT_NAME ;;
  }

  measure: count {
    label: "Number of Categories"
    type: count
    drill_fields: [cat_id, cat_name]
  }
}
