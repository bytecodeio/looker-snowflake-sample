view: item {
  label: "Item"
  sql_table_name: TPCDS_SF10TCL.ITEM ;;
  drill_fields: [detail*]

  dimension: item_id {
    group_label: "Keys/IDs"
    label: "Item ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.I_ITEM_ID ;;
  }

  dimension: brand {
    label: "Brand"
    type: string
    sql: ${TABLE}.I_BRAND ;;
  }

  dimension: brand_id {
    group_label: "Keys/IDs"
    label: "Brand ID"
    type: number
    sql: ${TABLE}.I_BRAND_ID ;;
  }

  dimension: category {
    label: "Category"
    type: string
    sql: ${TABLE}.I_CATEGORY ;;
  }

  dimension: category_id {
    group_label: "Keys/IDs"
    label: "Category ID"
    type: number
    sql: ${TABLE}.I_CATEGORY_ID ;;
  }

  dimension: class {
    label: "Class"
    type: string
    sql: ${TABLE}.I_CLASS ;;
  }

  dimension: class_id {
    group_label: "Keys/IDs"
    label: "Class ID"
    type: number
    sql: ${TABLE}.I_CLASS_ID ;;
  }

  dimension: color {
    label: "Color"
    type: string
    sql: ${TABLE}.I_COLOR ;;
  }

  dimension: container {
    label: "Container"
    type: string
    sql: ${TABLE}.I_CONTAINER ;;
  }

  dimension: current_price {
    group_label: "Numerical Fields"
    label: "Current Price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.I_CURRENT_PRICE ;;
  }

  dimension: formulation {
    label: "Formulation"
    type: string
    sql: ${TABLE}.I_FORMULATION ;;
  }

  dimension: item_desc {
    label: "Item Description"
    type: string
    sql: ${TABLE}.I_ITEM_DESC ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.I_ITEM_SK ;;
  }

  dimension: manager_id {
    group_label: "Keys/IDs"
    label: "Manager ID"
    type: number
    sql: ${TABLE}.I_MANAGER_ID ;;
  }

  dimension: manufact {
    label: "Manufacturer"
    type: string
    sql: ${TABLE}.I_MANUFACT ;;
  }

  dimension: manufact_id {
    group_label: "Keys/IDs"
    label: "Manufacturer ID"
    type: number
    sql: ${TABLE}.I_MANUFACT_ID ;;
  }

  dimension: product_name {
    label: "Product Name"
    type: string
    sql: ${TABLE}.I_PRODUCT_NAME ;;
  }

  dimension_group: record_end {
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
    sql: ${TABLE}.I_REC_END_DATE ;;
  }

  dimension_group: record_start {
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
    sql: ${TABLE}.I_REC_START_DATE ;;
  }

  dimension: size {
    label: "Size"
    type: string
    sql: ${TABLE}.I_SIZE ;;
  }

  dimension: units {
    label: "Units"
    type: string
    sql: ${TABLE}.I_UNITS ;;
  }

  dimension: wholesale_cost {
    group_label: "Numberical Dimensions"
    label: "Wholesale Cost"
    type: number
    sql: ${TABLE}.I_WHOLESALE_COST ;;
  }

  measure: count {
    label: "Number of Items"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      item_id,
      item_sk,
      product_name,
      item_desc,
      color,
      size,
      container,
      class,
      brand,
      category,
      manufact
    ]
  }
}
