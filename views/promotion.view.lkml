view: promotion {
  drill_fields: [detail*]
  derived_table: {
    sql:
          SELECT o.*,
          dateadd(year, 16, ed.d_date) AS end_date,
          dateadd(year, 16, sd.d_date) AS start_date
          FROM tpcds_sf10tcl.promotion o
          LEFT JOIN tpcds_sf10tcl.date_dim ed
            ON o.p_end_date_sk = ed.d_date_sk
          LEFT JOIN tpcds_sf10tcl.date_dim sd
            ON o.p_start_date_sk = sd.d_date_sk ;;
  }

  dimension: promo_sk {
    group_label: "Keys/IDs"
    label: "Promo SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.P_PROMO_SK ;;
  }

  dimension: promo_id {
    group_label: "Keys/IDs"
    label: "Promo ID"
    type: string
    sql: ${TABLE}.P_PROMO_ID ;;
  }

  dimension: channel_catalog {
    label: "Is Channel Catatlog"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_CATALOG = 'Y' ;;
  }

  dimension: channel_demo {
    label: "Is Channel Demo"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_DEMO = 'Y' ;;
  }

  dimension: channel_details {
    label: "Is Channel Detail"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_DETAILS = 'Y' ;;
  }

  dimension: channel_dmail {
    label: "Is Channel Direct Mail"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_DMAIL = 'Y' ;;
  }

  dimension: channel_email {
    label: "Is Channel Email"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_EMAIL = 'Y' ;;
  }

  dimension: channel_event {
    label: "Is Channel Event"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_EVENT = 'Y' ;;
  }

  dimension: channel_press {
    label: "Is Channel Press"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_PRESS = 'Y' ;;
  }

  dimension: channel_radio {
    label: "Is Channel Radio"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_RADIO ;;
  }

  dimension: channel_tv {
    label: "Is Channel TV"
    type: yesno
    sql: ${TABLE}.P_CHANNEL_TV ;;
  }

  dimension: cost {
    group_label: "Numerical Dimensions"
    label: "Promo Cost"
    type: number
    sql: ${TABLE}.P_COST ;;
  }

  dimension: discount_active {
    label: "Is Discount Active"
    type: yesno
    sql: ${TABLE}.P_DISCOUNT_ACTIVE = 'Y' ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.P_ITEM_SK ;;
  }

  dimension: promo_name {
    label: "Promo Name"
    type: string
    sql: ${TABLE}.P_PROMO_NAME ;;
  }

  dimension: purpose {
    label: "Promo Purpose"
    type: string
    sql: ${TABLE}.P_PURPOSE ;;
  }

  dimension: response_target {
    group_label: "Numerical Dimensions"
    label: "Response Target"
    type: number
    sql: ${TABLE}.P_RESPONSE_TARGET ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    label: "Number of Promotions"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      promo_id,
      promo_name,
      discount_active,
      channel_catalog,
      channel_demo,
      channel_details,
      channel_dmail,
      channel_email,
      channel_event,
      channel_press,
      channel_radio,
      channel_tv
    ]
  }
}
