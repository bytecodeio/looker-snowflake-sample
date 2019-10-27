view: inventory {
  sql_table_name: TPCDS_SF10TCL.INVENTORY ;;
  drill_fields: [detail*]

  dimension: inventory_pk {
    group_label: "Keys/IDs"
    label: "Inventory PK"
    type: string
    sql: ${warehouse_sk} || '-' || ${item_sk} || '-' || ${date_sk}  ;;
    hidden: yes
  }

  dimension: date_sk {
    group_label: "Keys/IDs"
    label: "Inventory Date SK"
    type: number
    sql: ${TABLE}.INV_DATE_SK ;;
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
