view: venue {
  view_label: "Venues"
  sql_table_name: HACKATHON.VENUE ;;
  drill_fields: [venue_id]

  dimension: venue_id {
    label: "Venue ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.VENUE_ID ;;
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

  dimension: city {
    label: "Venue City"
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: seats {
    label: "Venue Seats"
    type: number
    sql: ${TABLE}.SEATS ;;
  }

  dimension: state {
    label: "Venue State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.STATE ;;
  }

  dimension: venue_name {
    label: "Venue Name"
    type: string
    sql: ${TABLE}.VENUE_NAME ;;
  }

  measure: count {
    label: "Number of Venues"
    type: count
    drill_fields: [venue_id, venue_name, events.count]
  }
}
