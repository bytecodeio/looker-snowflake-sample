view: sales {
  view_label: "Sales"
  sql_table_name: HACKATHON.SALES ;;
  drill_fields: [sales_id]

  dimension: sales_id {
    group_label: "Keys/IDs"
    label: "Sales ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.SALES_ID ;;
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

  dimension: buyer_id {
    group_label: "Keys/IDs"
    label: "Buyer User ID"
    type: number
    sql: ${TABLE}.BUYER_ID ;;
  }

  dimension: commission__fl {
    group_label: "Numerical Dimensions"
    label: "Commission Float"
    type: number
    sql: ${TABLE}.COMMISSION__FL ;;
    hidden: yes
  }

  dimension: commission__it {
    group_label: "Numerical Dimensions"
    label: "Commission Integer"
    type: number
    sql: ${TABLE}.COMMISSION__IT ;;
    hidden: yes
  }

  dimension: commission {
    group_label: "Numerical Dimensions"
    label: "Commission"
    type: number
    value_format_name: usd
    sql: COALESCE(${commission__fl}, ${commission__it}) ;;
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

  dimension: list_id {
    group_label: "Keys/IDs"
    label: "Listing ID"
    type: number
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: price_paid {
    group_label: "Numerical Dimensions"
    label: "Price Paid"
    type: number
    value_format_name: usd
    sql: ${TABLE}.PRICE_PAID ;;
  }

  dimension: qty_sold {
    group_label: "Numerical Dimensions"
    label: "Quantity Sold"
    type: number
    sql: ${TABLE}.QTY_SOLD ;;
  }

  dimension_group: sales {
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
    sql: ${TABLE}.SALES_DATE ;;
  }

  dimension: seller_id {
    group_label: "Keys/IDs"
    label: "Selling User ID"
    type: number
    sql: ${TABLE}.SELLER_ID ;;
  }

  measure: count {
    label: "Number of Sales"
    type: count
    drill_fields: [detail*]
  }

  measure: count_buyers {
    label: "Number of Distinct Buyers"
    type: count_distinct
    sql: ${buyer_id} ;;
    drill_fields: [detail*]
  }

  measure: count_dates {
    label: "Number of Dates w/ Sales"
    type: count_distinct
    sql: ${date_id} ;;
    drill_fields: [detail*]
  }

  measure: count_events {
    label: "Number of Events Sold"
    type: count_distinct
    sql: ${event_id} ;;
    drill_fields: [detail*]
  }

  measure: count_listings {
    label: "Number of Listings Sold"
    type: count_distinct
    sql: ${list_id} ;;
    drill_fields: [detail*]
  }

  measure: count_sellers {
    label: "Number of Distinct Sellers"
    type: count_distinct
    sql: ${seller_id} ;;
    drill_fields: [detail*]
  }

  measure: avg_commission {
    label: "Average Commission"
    type: average
    value_format_name: usd
    sql: ${commission} ;;
    drill_fields: [detail*]
  }

  measure: avg_price_paid {
    label: "Average Price Paid"
    type: average
    value_format_name: usd
    sql: ${price_paid} ;;
    drill_fields: [detail*]
  }

  measure: avg_tickets_sold{
    label: "Average Tickets Sold"
    type: average
    value_format_name: decimal_1
    sql: ${qty_sold} ;;
    drill_fields: [detail*]
  }

  measure: total_commission {
    label: "Total Commission"
    type: sum
    value_format_name: usd
    sql: ${commission} ;;
    drill_fields: [detail*]
  }

  measure: total_price_paid {
    label: "Total Price Paid"
    type: sum
    value_format_name: usd
    sql: ${price_paid} ;;
    drill_fields: [detail*]
  }

  measure: total_tickets_sold{
    label: "Total Tickets Sold"
    type: sum
    value_format_name: decimal_0
    sql: ${qty_sold} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      sales_id,
      sales_date,
      qty_sold,
      price_paid,
      commission,
      sellers.full_name,
      buyers.full_name,
      events.event_name,
      categories.cat_name,
      categories.cat_group,
      venue.venue_name
    ]
  }
}
