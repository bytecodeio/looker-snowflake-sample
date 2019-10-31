view: events {
  sql_table_name: HACKATHON.EVENTS ;;
  drill_fields: [event_id]

  dimension: event_id {
    group_label: "Keys/IDs"
    label: "Event ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.EVENT_ID ;;
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

  dimension: cat_id {
    group_label: "Keys/IDs"
    label: "Category ID"
    type: number
    sql: ${TABLE}.CAT_ID ;;
  }

  dimension: date_id {
    group_label: "Keys/IDs"
    label: "Date ID"
    type: number
    sql: ${TABLE}.DATE_ID ;;
  }

  dimension_group: event {
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
    sql: ${TABLE}.EVENT_DATE ;;
  }

  dimension: event_name {
    label: "Event Name"
    type: string
    sql: ${TABLE}.EVENT_NAME ;;
  }

  dimension: venue_id {
    group_label: "Keys/IDs"
    label: "Venue ID"
    type: number
    # hidden: yes
    sql: ${TABLE}.VENUE_ID ;;
  }

  measure: count {
    label: "Number of Events"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      event_id,
      event_name,
      venue.venue_id,
      venue.venue_name,
      listings.count,
      sales.count
    ]
  }
}
