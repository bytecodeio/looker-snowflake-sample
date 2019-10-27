view: store_returns {
  drill_fields: [detail*]
  derived_table: {
    sql:  SELECT o.*,
          dateadd(year, 16, r.d_date) AS returned_date
          FROM tpcds_sf10tcl.store_returns o
          LEFT JOIN tpcds_sf10tcl.date_dim r
            ON o.sr_returned_date_sk = r.d_date_sk ;;
  }

  dimension: store_returns_pk {
    group_label: "Keys/IDs"
    label: "Store Returns PK"
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
    sql: ${TABLE}.SR_ADDR_SK ;;
  }

  dimension: cdemo_sk {
    group_label: "Keys/IDs"
    label: "Customer Demographics SK"
    type: number
    sql: ${TABLE}.SR_CDEMO_SK ;;
  }

  dimension: customer_sk {
    group_label: "Keys/IDs"
    label: "Customer SK"
    type: number
    sql: ${TABLE}.SR_CUSTOMER_SK ;;
  }

  dimension: fee {
    group_label: "Numerical Dimensions"
    label: "Fee"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_FEE ;;
  }

  dimension: hdemo_sk {
    group_label: "Keys/IDs"
    label: "Household Demographics SK"
    type: number
    sql: ${TABLE}.SR_HDEMO_SK ;;
  }

  dimension: net_loss {
    group_label: "Numerical Dimensions"
    label: "Net Loss"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_NET_LOSS ;;
  }

  dimension: reason_sk {
    group_label: "Keys/IDs"
    label: "Reason SK"
    type: number
    sql: ${TABLE}.SR_REASON_SK ;;
  }

  dimension: refunded_cash {
    group_label: "Numerical Dimensions"
    label: "Refunded Cash"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_REFUNDED_CASH ;;
  }

  dimension: return_amt {
    group_label: "Numerical Dimensions"
    label: "Return Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_RETURN_AMT ;;
  }

  dimension: return_amt_inc_tax {
    group_label: "Numerical Dimensions"
    label: "Return Amount Incl Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_RETURN_AMT_INC_TAX ;;
  }

  dimension: return_quantity {
    group_label: "Numerical Dimensions"
    label: "Return Quantity"
    type: number
    sql: ${TABLE}.SR_RETURN_QUANTITY ;;
  }

  dimension: return_ship_cost {
    group_label: "Numerical Dimensions"
    label: "Return Ship Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_RETURN_SHIP_COST ;;
  }

  dimension: return_tax {
    group_label: "Numerical Dimensions"
    label: "Return Tax"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_RETURN_TAX ;;
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

  dimension: reversed_charge {
    group_label: "Numerical Dimensions"
    label: "Reversed Charge"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_REVERSED_CHARGE ;;
  }

  dimension: store_credit {
    group_label: "Numerical Dimensions"
    label: "Store Credit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.SR_STORE_CREDIT ;;
  }

  dimension: store_sk {
    group_label: "Keys/IDs"
    label: "Store SK"
    type: number
    sql: ${TABLE}.SR_STORE_SK ;;
  }

  measure: count {
    label: "Number of Store Returns"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: []
  }
}
