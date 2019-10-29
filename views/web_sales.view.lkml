view: web_sales {
  drill_fields: [detail*]
  derived_table: {
    sql:  SELECT o.*,
          dateadd(year, 16, sh.d_date) AS ship_date,
          dateadd(year, 16, so.d_date) AS sold_date

          FROM tpcds_sf10tcl.web_sales o
          LEFT JOIN tpcds_sf10tcl.date_dim sh
            ON o.ws_ship_date_sk = sh.d_date_sk
          LEFT JOIN tpcds_sf10tcl.date_dim so
            ON o.ws_sold_date_sk = so.d_date_sk ;;
  }

  dimension: web_sales_pk {
    group_label: "Keys/IDs"
    label: "Web Sales PK"
    type: string
    primary_key: yes
    sql: ${order_number} || '-' || ${item_sk} ;;
    hidden: yes
  }

  dimension: order_number {
    group_label: "Keys/IDs"
    label: "Order Number"
    type: number
    sql: ${TABLE}.WS_ORDER_NUMBER ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.WS_ITEM_SK ;;
  }


  dimension: bill_addr_sk {
    group_label: "Keys/IDs"
    label: "Bill Address SK"
    type: number
    sql: ${TABLE}.WS_BILL_ADDR_SK ;;
  }

  dimension: bill_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Bill Customer Demographics SK"
    type: number
    sql: ${TABLE}.WS_BILL_CDEMO_SK ;;
  }

  dimension: bill_customer_sk {
    group_label: "Keys/IDs"
    label: "Bill Customer SK"
    type: number
    sql: ${TABLE}.WS_BILL_CUSTOMER_SK ;;
  }

  dimension: bill_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Bill Household Demographics SK"
    type: number
    sql: ${TABLE}.WS_BILL_HDEMO_SK ;;
  }

  dimension: coupon_amt {
    group_label: "Numerical Dimensions"
    label: "Coupon Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_COUPON_AMT ;;
  }

  dimension: ext_discount_amt {
    group_label: "Numerical Dimensions"
    label: "Ext Discount Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_EXT_DISCOUNT_AMT ;;
  }

  dimension: ext_list_price {
    group_label: "Numerical Dimensions"
    label: "Ext List Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_EXT_LIST_PRICE ;;
  }

  dimension: ext_sales_price {
    group_label: "Numerical Dimensions"
    label: "Ext Sales Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_EXT_SALES_PRICE ;;
  }

  dimension: ext_ship_cost {
    group_label: "Numerical Dimensions"
    label: "Ext Ship Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_EXT_SHIP_COST ;;
  }

  dimension: ext_tax {
    group_label: "Numerical Dimensions"
    label: "Ext Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_EXT_TAX ;;
  }

  dimension: ext_wholesale_cost {
    group_label: "Numerical Dimensions"
    label: "Ext Wholesale Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_EXT_WHOLESALE_COST ;;
  }

  dimension: list_price {
    group_label: "Numerical Dimensions"
    label: "List Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_LIST_PRICE ;;
  }

  dimension: net_paid {
    group_label: "Numerical Dimensions"
    label: "Net Paid"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_NET_PAID ;;
  }

  dimension: net_paid_inc_ship {
    group_label: "Numerical Dimensions"
    label: "Net Paid Incl Ship"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_NET_PAID_INC_SHIP ;;
  }

  dimension: net_paid_inc_ship_tax {
    group_label: "Numerical Dimensions"
    label: "Net Paid Incl Ship & Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_NET_PAID_INC_SHIP_TAX ;;
  }

  dimension: net_paid_inc_tax {
    group_label: "Numerical Dimensions"
    label: "Net Paid Incl Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_NET_PAID_INC_TAX ;;
  }

  dimension: net_profit {
    group_label: "Numerical Dimensions"
    label: "Net Profit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_NET_PROFIT ;;
  }

  dimension: promo_sk {
    group_label: "Keys/IDs"
    label: "Promo SK"
    type: number
    sql: ${TABLE}.WS_PROMO_SK ;;
  }

  dimension: quantity {
    group_label: "Numerical Dimensions"
    label: "Quantity"
    type: number
    sql: ${TABLE}.WS_QUANTITY ;;
  }

  dimension: sales_price {
    group_label: "Numerical Dimensions"
    label: "Sales Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_SALES_PRICE ;;
  }

  dimension: ship_addr_sk {
    group_label: "Keys/IDs"
    label: "Ship Address SK"
    type: number
    sql: ${TABLE}.WS_SHIP_ADDR_SK ;;
  }

  dimension: ship_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Ship Customer Demographics SK"
    type: number
    sql: ${TABLE}.WS_SHIP_CDEMO_SK ;;
  }

  dimension: ship_customer_sk {
    group_label: "Keys/IDs"
    label: "Ship Customer SK"
    type: number
    sql: ${TABLE}.WS_SHIP_CUSTOMER_SK ;;
  }

  dimension_group: ship {
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
    sql: ${TABLE}.ship_date ;;
  }

  dimension: ship_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Ship Household Demographics SK"
    type: number
    sql: ${TABLE}.WS_SHIP_HDEMO_SK ;;
  }

  dimension: ship_mode_sk {
    group_label: "Keys/IDs"
    label: "Ship Mode SK"
    type: number
    sql: ${TABLE}.WS_SHIP_MODE_SK ;;
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

  dimension: warehouse_sk {
    group_label: "Keys/IDs"
    label: "Warehouse SK"
    type: number
    sql: ${TABLE}.WS_WAREHOUSE_SK ;;
  }

  dimension: web_page_sk {
    group_label: "Keys/IDs"
    label: "Web Page SK"
    type: number
    sql: ${TABLE}.WS_WEB_PAGE_SK ;;
  }

  dimension: web_site_sk {
    group_label: "Keys/IDs"
    label: "Website SK"
    type: number
    sql: ${TABLE}.WS_WEB_SITE_SK ;;
  }

  dimension: wholesale_cost {
    group_label: "Numerical Dimensions"
    label: "Wholesale Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WS_WHOLESALE_COST ;;
  }

  measure: count {
    label: "Number of Web Sales"
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

  measure: total_paid_ship_tax {
    type: sum
    sql: ${net_paid_inc_ship_tax} ;;
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
