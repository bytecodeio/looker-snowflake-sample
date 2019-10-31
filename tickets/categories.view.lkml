view: categories {
  view_label: "Categories"
  sql_table_name: TEST_DB.TICKET.CATEGORY ;;

  dimension: cat_id {
    label: "Category ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.CATID ;;
  }

  dimension: cat_desc {
    label: "Category Descriptions"
    type: string
    sql: ${TABLE}.CATDESC ;;
  }

  dimension: cat_group {
    label: "Category Group"
    type: string
    sql: ${TABLE}.CATGROUP ;;
  }

  dimension: cat_name {
    label: "Category Name"
    type: string
    sql: ${TABLE}.CATNAME ;;
  }

  measure: count {
    label: "Number of Categories"
    type: count
    drill_fields: [cat_id, cat_name, cat_group]
  }
}
