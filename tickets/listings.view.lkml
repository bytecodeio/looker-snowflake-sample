view: listings {
  sql_table_name: HACKATHON.LISTINGS ;;

  dimension: list_id {
    group_label: "Keys/IDs"
    label: "Listing ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.LIST_ID ;;
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

  dimension: date_id {
    group_label: "Keys/IDs"
    label: "Date ID"
    type: number
    sql: ${TABLE}.DATE_ID ;;
  }

  dimension: event_id {
    group_label: "Keys/IDs"
    label: "Event ID"
    type: number
    # hidden: yes
    sql: ${TABLE}.EVENT_ID ;;
  }

  dimension_group: list {
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
    sql: ${TABLE}.LIST_DATE ;;
  }

  dimension: num_tickets {
    group_label: "Numerical Dimensions"
    label: "Number of Tickets"
    type: number
    sql: ${TABLE}.NUM_TICKETS ;;
  }

  dimension: price_per_ticket {
    group_label: "Numerical Dimensions"
    label: "Price per Ticket"
    type: number
    value_format_name: usd
    sql: ${TABLE}.PRICE_PER_TICKET ;;
  }

  dimension: seller_id {
    group_label: "Keys/IDs"
    label: "Seller User ID"
    type: number
    sql: ${TABLE}.SELLER_ID ;;
  }

  dimension: price {
    group_label: "Numerical Dimensions"
    label: "Total Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.TOTAL_PRICE ;;
  }

  measure: count {
    label: "Number of Listings"
    type: count
    drill_fields: [detail*]
  }

  measure: count_dates {
    label: "Number of Dates w/ Listings"
    type: count_distinct
    sql: ${date_id} ;;
    drill_fields: [detail*]
  }

  measure: count_events {
    label: "Number of Events Listed"
    type: count_distinct
    sql: ${event_id} ;;
    drill_fields: [detail*]
  }

  measure: count_sellers {
    label: "Number of Sellers w/ Listings"
    type: count_distinct
    sql: ${seller_id} ;;
    drill_fields: [detail*]
  }

  measure: avg_tickets {
    label: "Average Tickets per Listing"
    type: average
    value_format_name: decimal_1
    sql: ${num_tickets} ;;
    drill_fields: [detail*]
  }

  measure: avg_price_per_ticket {
    label: "Average Price per Ticket"
    type: average
    value_format_name: usd
    sql: ${price_per_ticket} ;;
    drill_fields: [detail*]
  }

  measure: avg_total_price {
    label: "Average Total Listing Price"
    type: average
    value_format_name: usd
    sql: ${price} ;;
    drill_fields: [detail*]
  }

  measure: sum_price {
    label: "Total Listing Price"
    type: sum
    sql: ${price} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: sum_tickets {
    label: "Total Number of Tickets"
    type: sum
    sql: ${num_tickets} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      list_id,
      list_date,
      num_tickets,
      price_per_ticket,
      price,
      sellers.full_name,
      events.event_name,
      categories.cat_name,
      categories.cat_group,
      venue.venue_name
    ]
  }

}
