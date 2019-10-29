view: store_sales {
  drill_fields: [detail*]
  derived_table: {
    sql:  SELECT o.*,
          dateadd(year, 16, s.d_date) AS sold_date
          FROM tpcds_sf10tcl.store_sales o
          LEFT JOIN tpcds_sf10tcl.date_dim s
            ON o.ss_sold_date_sk = s.d_date_sk ;;
  }

  dimension: store_sales_pk {
    group_label: "Keys/IDs"
    label: "Store Sales PK"
    type: string
    primary_key: yes
    sql: ${ticket_number} || '-' || ${item_sk} ;;
    hidden: yes
  }

  dimension: ticket_number {
    group_label: "Keys/IDs"
    label: "Ticket Number"
    type: number
    sql: ${TABLE}.SR_TICKET_NUMBER ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.SR_ITEM_SK ;;
  }

  dimension: addr_sk {
    group_label: "Keys/IDs"
    label: "Address SK"
    type: number
    sql: ${TABLE}.SS_ADDR_SK ;;
  }

  dimension: cdemo_sk {
    group_label: "Keys/IDs"
    label: "Customer Demographics SK"
    type: number
    sql: ${TABLE}.SS_CDEMO_SK ;;
  }

  dimension: coupon_amt {
    group_label: "Numerical Dimensions"
    label: "Coupon Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_COUPON_AMT ;;
  }

  dimension: customer_sk {
    group_label: "Keys/IDs"
    label: "Customer SK"
    type: number
    sql: ${TABLE}.SS_CUSTOMER_SK ;;
  }

  dimension: ext_discount_amt {
    group_label: "Numerical Dimensions"
    label: "Ext Discount Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_EXT_DISCOUNT_AMT ;;
  }

  dimension: ext_list_price {
    group_label: "Numerical Dimensions"
    label: "Ext List Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_EXT_LIST_PRICE ;;
  }

  dimension: ext_sales_price {
    group_label: "Numerical Dimensions"
    label: "Ext Sales Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_EXT_SALES_PRICE ;;
  }

  dimension: ext_tax {
    group_label: "Numerical Dimensions"
    label: "Ext Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_EXT_TAX ;;
  }

  dimension: ext_wholesale_cost {
    group_label: "Numerical Dimensions"
    label: "Ext Wholesale Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_EXT_WHOLESALE_COST ;;
  }

  dimension: hdemo_sk {
    group_label: "Keys/IDs"
    label: "Household Demographics SK"
    type: number
    sql: ${TABLE}.SS_HDEMO_SK ;;
  }

  dimension: list_price {
    group_label: "Numerical Dimensions"
    label: "List Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_LIST_PRICE ;;
  }

  dimension: net_paid {
    group_label: "Numerical Dimensions"
    label: "Net Paid"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_NET_PAID ;;
  }

  dimension: net_paid_inc_tax {
    group_label: "Numerical Dimensions"
    label: "Net Paid Incl Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_NET_PAID_INC_TAX ;;
  }

  dimension: net_profit {
    group_label: "Numerical Dimensions"
    label: "Net Profit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_NET_PROFIT ;;
  }

  dimension: promo_sk {
    group_label: "Keys/IDs"
    label: "Promo SK"
    type: number
    sql: ${TABLE}.SS_PROMO_SK ;;
  }

  dimension: quantity {
    group_label: "Numerical Dimensions"
    label: "Quantity"
    type: number
    sql: ${TABLE}.SS_QUANTITY ;;
  }

  dimension: sales_price {
    group_label: "Numerical Dimensions"
    label: "Sales Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_SALES_PRICE ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_date ;;
  }

  dimension: store_sk {
    group_label: "Keys/IDs"
    label: "Store SK"
    type: number
    sql: ${TABLE}.SS_STORE_SK ;;
  }

  dimension: wholesale_cost {
    group_label: "Numerical Dimensions"
    label: "Wholesale Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SS_WHOLESALE_COST ;;
  }

  measure: count {
    label: "Number of Store Sales"
    type: count
    drill_fields: [detail*]
  }

  measure: total_profit {
    type: sum
    sql: ${net_profit} ;;
  }

  measure: total_price {
    type: sum
    sql: ${sales_price} ;;
  }

  measure: total_paid {
    type: sum
    sql: ${net_paid} ;;
  }

  measure: average_profit {
    type: average
    sql: ${net_profit} ;;
  }

  measure: average_price {
    type: average
    sql: ${sales_price} ;;
  }

  measure: average_paid {
    type: average
    sql:  ${net_paid} ;;
  }

  set: detail {
    fields: []
  }
}
