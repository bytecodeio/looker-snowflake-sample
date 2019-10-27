view: web_page {
  drill_fields: [detail*]
  derived_table: {
    sql:  SELECT o.*,
          dateadd(year, 16, ad.d_date) AS access_date,
          dateadd(year, 16, cd.d_date) AS creation_date

          FROM tpcds_sf10tcl.web_page o
          INNER JOIN (
              SELECT
                  MAX(wp_web_page_sk) AS max_sk,
                  wp_web_page_id
              FROM tpcds_sf10tcl.web_page
              GROUP BY wp_web_page_id ) oo
          ON o.wp_web_page_id = oo.wp_web_page_id
          AND o.wp_web_page_sk = oo.max_sk

        LEFT JOIN tpcds_sf10tcl.date_dim ad
          ON o.wp_access_date_sk = ad.d_date_sk
        LEFT JOIN tpcds_sf10tcl.date_dim cd
          ON o.wp_creation_date_sk = cd.d_date_sk  ;;
  }

  dimension: web_page_sk {
    group_label: "Keys/IDs"
    label: "Web Page SK"
    type: number
    primary_key: yes
    sql: ${TABLE}.WP_WEB_PAGE_SK ;;
  }

  dimension: web_page_id {
    group_label: "Keys/IDs"
    label: "Web Page ID"
    type: string
    sql: ${TABLE}.WP_WEB_PAGE_ID ;;
  }

  dimension_group: access {
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
    sql: ${TABLE}.access_date ;;
  }

  dimension: autogen_flag {
    label: "Is Autogen"
    type: yesno
    sql: ${TABLE}.WP_AUTOGEN_FLAG = 'Y' ;;
  }

  dimension: char_count {
    group_label: "Numerical Dimensions"
    label: "Character Count"
    type: number
    sql: ${TABLE}.WP_CHAR_COUNT ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}.creation_date ;;
  }

  dimension: customer_sk {
    group_label: "Keys/IDs"
    label: "Customer SK"
    type: number
    sql: ${TABLE}.WP_CUSTOMER_SK ;;
  }

  dimension: image_count {
    group_label: "Numerical Dimensions"
    label: "Image Count"
    type: number
    sql: ${TABLE}.WP_IMAGE_COUNT ;;
  }

  dimension: link_count {
    group_label: "Numerical Dimensions"
    label: "Link Count"
    type: number
    sql: ${TABLE}.WP_LINK_COUNT ;;
  }

  dimension: max_ad_count {
    group_label: "Numerical Dimensions"
    label: "Max Ad Count"
    type: number
    sql: ${TABLE}.WP_MAX_AD_COUNT ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}.WP_TYPE ;;
  }

  dimension: url {
    label: "URL"
    type: string
    sql: ${TABLE}.WP_URL ;;
  }

  measure: count {
    label: "Number of Web Pages"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: []
  }
}
