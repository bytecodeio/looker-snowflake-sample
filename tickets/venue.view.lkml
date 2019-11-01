view: venue {
  view_label: "Venues"
  sql_table_name: TEST_DB.TICKET.VENUE ;;
  drill_fields: [detail*]

  dimension: venue_id {
    label: "Venue ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.VENUEID ;;
  }

  dimension: city {
    label: "Venue City"
    type: string
    sql: ${TABLE}.VENUECITY ;;
  }

  dimension: seats {
    label: "Venue Seats"
    type: number
    sql: ${TABLE}.VENUESEATS ;;
  }

  dimension: state {
    label: "Venue State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.VENUESTATE ;;
  }

  dimension: venue_name {
    label: "Venue Name"
    type: string
    sql: ${TABLE}.VENUENAME ;;
  }

  measure: count {
    label: "Number of Venues"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      venue_id,
      venue_name,
      city,
      state,
      events.count
    ]
  }
}
