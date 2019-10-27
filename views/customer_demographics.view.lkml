view: customer_demographics {
  sql_table_name: TPCDS_SF10TCL.CUSTOMER_DEMOGRAPHICS ;;

  dimension: demo_sk {
    group_label: "Keys/IDs"
    label: "Demographics SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.CD_DEMO_SK ;;
  }

  dimension: credit_rating {
    label: "Credit Rating"
    type: string
    sql: ${TABLE}.CD_CREDIT_RATING ;;
  }

  dimension: dep_college_count {
    group_label: "Numerical Dimensions"
    label: "Dependents College Count"
    type: number
    sql: ${TABLE}.CD_DEP_COLLEGE_COUNT ;;
  }

  dimension: dep_count {
    group_label: "Numerical Dimensions"
    label: "Dependents Count"
    type: number
    sql: ${TABLE}.CD_DEP_COUNT ;;
  }

  dimension: dep_employed_count {
    group_label: "Numerical Dimensions"
    label: "Dependents Employed Count"
    type: number
    sql: ${TABLE}.CD_DEP_EMPLOYED_COUNT ;;
  }

  dimension: education_status {
    label: "Education Status"
    type: string
    sql: ${TABLE}.CD_EDUCATION_STATUS ;;
  }

  dimension: gender {
    label: "Gender"
    type: string
    sql: ${TABLE}.CD_GENDER ;;
  }

  dimension: marital_status {
    label: "Marital Status"
    type: string
    sql: ${TABLE}.CD_MARITAL_STATUS ;;
  }

  dimension: purchase_estimate {
    group_label: "Numerical Dimensions"
    label: "Purchase Estimate"
    type: number
    sql: ${TABLE}.CD_PURCHASE_ESTIMATE ;;
  }

  measure: count {
    label: "Number of Demographic Records"
    type: count
    drill_fields: []
  }
}
