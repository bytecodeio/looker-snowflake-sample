view: catalog_returns {
  drill_fields: [detail*]
  derived_table: {
    sql:  SELECT o.*,
          dateadd(year, 16, r.d_date) AS returned_date
          FROM tpcds_sf10tcl.catalog_returns o
          LEFT JOIN tpcds_sf10tcl.date_dim r
            ON o.cr_returned_date_sk = r.d_date_sk ;;
  }

  dimension: catalog_returns_pk {
    group_label: "Keys/IDs"
    label: "Catalog Returns PK"
    type: string
    primary_key: yes
    sql: ${order_number} || '-' || ${item_sk} ;;
    hidden: yes
  }

  dimension: order_number {
    group_label: "Keys/IDs"
    label: "Order Number"
    type: number
    sql: ${TABLE}.CR_ORDER_NUMBER ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.CR_ITEM_SK ;;
  }

  dimension: call_center_sk {
    group_label: "Keys/IDs"
    label: "Call Center SK"
    type: number
    sql: ${TABLE}.CR_CALL_CENTER_SK ;;
  }

  dimension: catalog_page_sk {
    group_label: "Keys/IDs"
    label: "Catalog Page SK"
    type: number
    sql: ${TABLE}.CR_CATALOG_PAGE_SK ;;
  }

  dimension: fee {
    group_label: "Numerical Dimensions"
    label: "Fee"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_FEE ;;
  }

  dimension: net_loss {
    group_label: "Numerical Dimensions"
    label: "Net Loss"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_NET_LOSS ;;
  }

  dimension: reason_sk {
    group_label: "Keys/IDs"
    label: "Return SK"
    type: number
    sql: ${TABLE}.CR_REASON_SK ;;
  }

  dimension: refunded_addr_sk {
    group_label: "Keys/IDs"
    label: "Refunded Address SK"
    type: number
    sql: ${TABLE}.CR_REFUNDED_ADDR_SK ;;
  }

  dimension: refunded_cash {
    group_label: "Numerical Dimensions"
    label: "Refunded Cash"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_REFUNDED_CASH ;;
  }

  dimension: refunded_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Refunded Customer Demographics SK"
    type: number
    sql: ${TABLE}.CR_REFUNDED_CDEMO_SK ;;
  }

  dimension: refunded_customer_sk {
    group_label: "Keys/IDs"
    label: "Refunded Customer SK"
    type: number
    sql: ${TABLE}.CR_REFUNDED_CUSTOMER_SK ;;
  }

  dimension: refunded_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Refunded Household Demographics SK"
    type: number
    sql: ${TABLE}.CR_REFUNDED_HDEMO_SK ;;
  }

  dimension: return_amount {
    group_label: "Numerical Dimensions"
    label: "Return Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_RETURN_AMOUNT ;;
  }

  dimension: return_amt_inc_tax {
    group_label: "Numerical Dimensions"
    label: "Return Amount incl. Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_RETURN_AMT_INC_TAX ;;
  }

  dimension: return_quantity {
    group_label: "Numerical Dimensions"
    label: "Return Quantity"
    type: number
    sql: ${TABLE}.CR_RETURN_QUANTITY ;;
  }

  dimension: return_ship_cost {
    group_label: "Numerical Dimensions"
    label: "Return Ship Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_RETURN_SHIP_COST ;;
  }

  dimension: return_tax {
    group_label: "Numerical Dimensions"
    label: "Return Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_RETURN_TAX ;;
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
    sql: ${TABLE}.CR_RETURNING_ADDR_SK ;;
  }

  dimension: returning_cdemo_sk {
    group_label: "Keys/IDs"
    label: "Returning Customer Demographics SK"
    type: number
    sql: ${TABLE}.CR_RETURNING_CDEMO_SK ;;
  }

  dimension: returning_customer_sk {
    group_label: "Keys/IDs"
    label: "Returning Customer SK"
    type: number
    sql: ${TABLE}.CR_RETURNING_CUSTOMER_SK ;;
  }

  dimension: returning_hdemo_sk {
    group_label: "Keys/IDs"
    label: "Returning Household Demographics SK"
    type: number
    sql: ${TABLE}.CR_RETURNING_HDEMO_SK ;;
  }

  dimension: reversed_charge {
    group_label: "Numerical Dimensions"
    label: "Reversed Charge"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_REVERSED_CHARGE ;;
  }

  dimension: ship_mode_sk {
    group_label: "Keys/IDs"
    label: "Ship Mode SK"
    type: number
    sql: ${TABLE}.CR_SHIP_MODE_SK ;;
  }

  dimension: store_credit {
    group_label: "Numerical Dimensions"
    label: "Store Credit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.CR_STORE_CREDIT ;;
  }

  dimension: warehouse_sk {
    group_label: "Keys/IDs"
    label: "Warehouse SK"
    type: number
    sql: ${TABLE}.CR_WAREHOUSE_SK ;;
  }

  measure: count {
    label: "Number of Catalog Returns"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      warehouse.warehouse_id,
      warehouse.warehouse_name,
    ]
  }
}
