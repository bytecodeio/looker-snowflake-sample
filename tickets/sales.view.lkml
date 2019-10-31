view: sales {
  view_label: "Sales"
  sql_table_name: TEST_DB.TICKET.SALES ;;
  drill_fields: [detail*]

  dimension: sales_id {
    group_label: "Keys/IDs"
    label: "Sales ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.SALESID ;;
  }

  dimension: buyer_id {
    group_label: "Keys/IDs"
    label: "Buyer User ID"
    type: number
    sql: ${TABLE}.BUYERID ;;
  }

  dimension: commission {
    group_label: "Numerical Dimensions"
    label: "Commission"
    type: number
    sql: ${TABLE}.COMMISSION ;;
  }

  dimension: date_id {
    group_label: "Keys/IDs"
    label: "Date ID"
    type: number
    sql: ${TABLE}.DATEID ;;
  }

  dimension: event_id {
    group_label: "Keys/IDs"
    label: "Event ID"
    type: number
    # hidden: yes
    sql: ${TABLE}.EVENTID ;;
  }

  dimension: list_id {
    group_label: "Keys/IDs"
    label: "Listing ID"
    type: number
    sql: ${TABLE}.LISTID ;;
  }

  dimension: price_paid {
    group_label: "Numerical Dimensions"
    label: "Price Paid"
    type: number
    value_format_name: usd
    sql: ${TABLE}.PRICEPAID ;;
  }

  dimension: qty_sold {
    group_label: "Numerical Dimensions"
    label: "Quantity Sold"
    type: number
    sql: ${TABLE}.QTYSOLD ;;
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
    sql: DATEADD(YEAR, 11, ${TABLE}.SALETIME) ;;
  }

  dimension: seller_id {
    group_label: "Keys/IDs"
    label: "Selling User ID"
    type: number
    sql: ${TABLE}.SELLERID ;;
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
