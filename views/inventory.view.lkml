view: inventory {
  drill_fields: [detail*]
  derived_table: {
    sql: SELECT o.*,
          dateadd(year, 16, i.d_date) AS inventory_date
          FROM tpcds_sf10tcl.inventory o
          LEFT JOIN tpcds_sf10tcl.date_dim i
            ON o.inv_date_sk = i.d_date_sk  ;;
  }

  dimension: inventory_pk {
    group_label: "Keys/IDs"
    label: "Inventory PK"
    type: string
    primary_key: yes
    sql: ${warehouse_sk} || '-' || ${item_sk} || '-' || ${inventory_date}  ;;
    hidden: yes
  }

  dimension_group: inventory {
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
    sql: ${TABLE}.inventory_date ;;
  }

  dimension: item_sk {
    group_label: "Keys/IDs"
    label: "Item SK"
    type: number
    sql: ${TABLE}.INV_ITEM_SK ;;
  }

  dimension: quantity_on_hand {
    label: "Quantity O/H"
    type: number
    sql: ${TABLE}.INV_QUANTITY_ON_HAND ;;
  }

  dimension: warehouse_sk {
    group_label: "Keys/IDs"
    label: "Warehouse SK"
    type: number
    sql: ${TABLE}.INV_WAREHOUSE_SK ;;
  }

  measure: count {
    label: "Number of Inventory Records"
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
