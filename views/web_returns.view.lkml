view: web_returns {
    drill_fields: [detail*]
  derived_table: {
    sql:  SELECT o.*,
          dateadd(year, 16, r.d_date) AS returned_date
          FROM tpcds_sf10tcl.web_returns o
          LEFT JOIN tpcds_sf10tcl.date_dim r
            ON o.wr_returned_date_sk = r.d_date_sk ;;
  }

  dimension: web_returns_pk {
    group_label: "Keys/IDs"
    label: "Web Returns PK"
    type: string
    primary_key: yes
    sql: ${order_number} || '-' || ${item_sk} ;;
    hidden: yes
  }

  dimension: order_number {
    group_label: "Keys/IDs"
    label: "Order Number"
    type: number
    sql: ${TABLE}.WR_ORDER_NUMBER ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.WR_ITEM_SK ;;
  }

  dimension: account_credit {
    group_label: "Numerical Dimensions"
    label: "Account Credit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_ACCOUNT_CREDIT ;;
  }

  dimension: fee {
    group_label: "Numerical Dimensions"
    label: "Fee"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_FEE ;;
  }

  dimension: net_loss {
    group_label: "Numerical Dimensions"
    label: "Net Loss"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_NET_LOSS ;;
  }

  dimension: reason_sk {
    group_label: "Keys/IDs"
    label: "Reason SK"
    type: number
    sql: ${TABLE}.WR_REASON_SK ;;
  }

  dimension: refunded_addr_sk {
    group_label: "Keys/IDs"
    label: "Refunded Address SK"
    type: number
    sql: ${TABLE}.WR_REFUNDED_ADDR_SK ;;
  }

  dimension: refunded_cash {
    group_label: "Numerical Dimensions"
    label: "Refunded Cash"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_REFUNDED_CASH ;;
  }

  dimension: refunded_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Refunded Customer Demographics SK"
    type: number
    sql: ${TABLE}.WR_REFUNDED_CDEMO_SK ;;
  }

  dimension: refunded_customer_sk {
    group_label: "Keys/IDs"
    label: "Refunded Customer SK"
    type: number
    sql: ${TABLE}.WR_REFUNDED_CUSTOMER_SK ;;
  }

  dimension: refunded_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Refunded Household Demographics SK"
    type: number
    sql: ${TABLE}.WR_REFUNDED_HDEMO_SK ;;
  }

  dimension: return_amt {
    group_label: "Numerical Dimensions"
    label: "Return Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_RETURN_AMT ;;
  }

  dimension: return_amt_inc_tax {
    group_label: "Numerical Dimensions"
    label: "Return Amount Incl Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_RETURN_AMT_INC_TAX ;;
  }

  dimension: return_quantity {
    group_label: "Numerical Dimensions"
    label: "Return Quantity"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_RETURN_QUANTITY ;;
  }

  dimension: return_ship_cost {
    group_label: "Numerical Dimensions"
    label: "Return Ship Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_RETURN_SHIP_COST ;;
  }

  dimension: return_tax {
    group_label: "Numerical Dimensions"
    label: "Return Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_RETURN_TAX ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_date ;;
  }

  dimension: returning_addr_sk {
    group_label: "Keys/IDs"
    label: "Returning Address SK"
    type: number
    sql: ${TABLE}.WR_RETURNING_ADDR_SK ;;
  }

  dimension: returning_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Returning Customer Demographics SK"
    type: number
    sql: ${TABLE}.WR_RETURNING_CDEMO_SK ;;
  }

  dimension: returning_customer_sk {
    group_label: "Keys/IDs"
    label: "Returning Customer SK"
    type: number
    sql: ${TABLE}.WR_RETURNING_CUSTOMER_SK ;;
  }

  dimension: returning_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Returning Household Demographics SK"
    type: number
    sql: ${TABLE}.WR_RETURNING_HDEMO_SK ;;
  }

  dimension: reversed_charge {
    group_label: "Numerical Dimensions"
    label: "Reversed Charge"
    type: number
    value_format_name: usd
    sql: ${TABLE}.WR_REVERSED_CHARGE ;;
  }

  dimension: web_page_sk {
    group_label: "Keys/IDs"
    label: "Web Page SK"
    type: number
    sql: ${TABLE}.WR_WEB_PAGE_SK ;;
  }

  measure: count {
    label: "Number of Web Returns"
    type: count
    drill_fields: []
  }

  set: detail {
    fields: []
  }
}
