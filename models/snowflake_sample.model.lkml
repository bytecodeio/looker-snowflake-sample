connection: "snowflake_sample"

# include all the views
include: "/views/**/*.view"

datagroup: snowflake_sample_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_sample_default_datagroup

explore: call_center {}

explore: catalog_page {}


explore: customer {
  join: customer_address {
    type: left_outer
    relationship: many_to_one
    sql_on: ${customer.current_addr_sk} = ${customer_address.address_sk} ;;
  }
  join: current_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${customer.current_cdemo_sk} = ${current_cust_demo.demo_sk} ;;
  }
  join: current_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${customer.current_hdemo_sk} = ${current_hh_demo.demo_sk} ;;
  }
  join: current_income_band {
    from: income_band
    type: left_outer
    relationship: many_to_one
    sql_on: ${current_hh_demo.income_band_sk} = ${current_income_band.income_band_sk} ;;
  }
}


explore: catalog_returns {
  view_name: catalog_returns
  join: call_center {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.call_center_sk} = ${call_center.call_center_sk} ;;
  }
  join: catalog_page {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.catalog_page_sk} = ${catalog_page.catalog_page_sk} ;;
  }
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.item_sk} = ${item.item_sk} ;;
  }
  join: reason {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.reason_sk} = ${reason.reason_sk};;
  }
  join: refunded_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.refunded_addr_sk} = ${refunded_address.address_sk} ;;
  }
  join: refunded_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.refunded_customer_sk} = ${refunded_customer.customer_sk} ;;
  }
  join: refunded_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.refunded_cdemo_sk} = ${refunded_cust_demo.demo_sk} ;;
  }
  join: refunded_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.refunded_hdemo_sk} = ${refunded_hh_demo.demo_sk} ;;
  }
  join: returning_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.returning_addr_sk} = ${returning_address.address_sk} ;;
  }
  join: returning_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.returning_customer_sk} = ${returning_customer.customer_sk} ;;
  }
  join: returning_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.returning_cdemo_sk} = ${returning_cust_demo.demo_sk} ;;
  }
  join: returning_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.returning_hdemo_sk} = ${returning_hh_demo.demo_sk} ;;
  }
  join: ship_mode {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.ship_mode_sk} = ${ship_mode.ship_mode_sk} ;;
  }
  join: warehouse {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_returns.warehouse_sk} = ${warehouse.warehouse_sk} ;;
  }
}

explore: catalog_sales {
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.item_sk} = ${item.item_sk} ;;
  }
  join: bill_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.bill_addr_sk} = ${bill_address.address_sk} ;;
  }
  join: bill_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.bill_customer_sk} = ${bill_customer.customer_sk} ;;
  }
  join: bill_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.bill_cdemo_sk} = ${bill_cust_demo.demo_sk} ;;
  }
  join: bill_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.bill_hdemo_sk} = ${bill_hh_demo.demo_sk} ;;
  }
  join: call_center {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.call_center_sk} = ${call_center.call_center_sk} ;;
  }
  join: catalog_page {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.catalog_page_sk} = ${catalog_page.catalog_page_sk} ;;
  }
  join: promotion {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.promo_sk} = ${promotion.promo_sk};;
  }
  join: ship_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.ship_addr_sk} = ${ship_address.address_sk} ;;
  }
  join: ship_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.ship_customer_sk} = ${ship_customer.customer_sk} ;;
  }
  join: ship_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.ship_cdemo_sk} = ${ship_cust_demo.demo_sk} ;;
  }
  join: ship_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.ship_hdemo_sk} = ${ship_hh_demo.demo_sk} ;;
  }
  join: ship_mode {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.ship_mode_sk} = ${ship_mode.ship_mode_sk} ;;
  }
  join: warehouse {
    type: left_outer
    relationship: many_to_one
    sql_on: ${catalog_sales.warehouse_sk} = ${warehouse.warehouse_sk} ;;
  }
}


explore: customer_address {}

explore: customer_demographics {}

explore: date_dim {}

explore: household_demographics {}

explore: income_band {}

explore: inventory {
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory.item_sk} = ${item.item_sk} ;;
  }
  join: warehouse {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory.warehouse_sk} = ${warehouse.warehouse_sk} ;;
  }
}

explore: item {}

explore: promotion {
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${promotion.item_sk} = ${item.item_sk} ;;
  }
}

explore: reason {}

explore: ship_mode {}

explore: store {}

explore: store_returns {
  view_name: store_returns
  join: store {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.store_sk} = ${store.store_sk} ;;
  }
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.item_sk} = ${item.item_sk} ;;
  }
  join: reason {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.reason_sk} = ${reason.reason_sk};;
  }
  join: address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.addr_sk} = ${address.address_sk} ;;
  }
  join: customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.customer_sk} = ${customer.customer_sk} ;;
  }
  join: cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.cdemo_sk} = ${cust_demo.demo_sk} ;;
  }
  join: hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_returns.hdemo_sk} = ${hh_demo.demo_sk} ;;
  }
}

explore: store_sales {
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.item_sk} = ${item.item_sk} ;;
  }
  join: address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.addr_sk} = ${address.address_sk} ;;
  }
  join: customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.customer_sk} = ${customer.customer_sk} ;;
  }
  join: cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.cdemo_sk} = ${cust_demo.demo_sk} ;;
  }
  join: hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.hdemo_sk} = ${hh_demo.demo_sk} ;;
  }
  join: store {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.store_sk} = ${store.store_sk} ;;
  }
  join: promotion {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.promo_sk} = ${promotion.promo_sk};;
  }
}

explore: time_dim {}

explore: warehouse {}

explore: web_page {
  join: customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_page.customer_sk} = ${customer.customer_sk} ;;
  }
}

explore: web_returns {
  view_name: web_returns
  join: web_page {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.web_page_sk} = ${web_page.web_page_sk} ;;
  }
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.item_sk} = ${item.item_sk} ;;
  }
  join: reason {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.reason_sk} = ${reason.reason_sk};;
  }
  join: refunded_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.refunded_addr_sk} = ${refunded_address.address_sk} ;;
  }
  join: refunded_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.refunded_customer_sk} = ${refunded_customer.customer_sk} ;;
  }
  join: refunded_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.refunded_cdemo_sk} = ${refunded_cust_demo.demo_sk} ;;
  }
  join: refunded_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.refunded_hdemo_sk} = ${refunded_hh_demo.demo_sk} ;;
  }
  join: returning_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.returning_addr_sk} = ${returning_address.address_sk} ;;
  }
  join: returning_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.returning_customer_sk} = ${returning_customer.customer_sk} ;;
  }
  join: returning_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.returning_cdemo_sk} = ${returning_cust_demo.demo_sk} ;;
  }
  join: returning_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_returns.returning_hdemo_sk} = ${returning_hh_demo.demo_sk} ;;
  }
}

explore: web_sales {
  join: item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.item_sk} = ${item.item_sk} ;;
  }
  join: bill_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.bill_addr_sk} = ${bill_address.address_sk} ;;
  }
  join: bill_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.bill_customer_sk} = ${bill_customer.customer_sk} ;;
  }
  join: bill_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.bill_cdemo_sk} = ${bill_cust_demo.demo_sk} ;;
  }
  join: bill_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.bill_hdemo_sk} = ${bill_hh_demo.demo_sk} ;;
  }
  join: web_site {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.web_site_sk} = ${web_sales.web_site_sk} ;;
  }
  join: web_page {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.web_page_sk} = ${web_page.web_page_sk} ;;
  }
  join: promotion {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.promo_sk} = ${promotion.promo_sk};;
  }
  join: ship_address {
    from: customer_address
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ship_addr_sk} = ${ship_address.address_sk} ;;
  }
  join: ship_customer {
    from: customer
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ship_customer_sk} = ${ship_customer.customer_sk} ;;
  }
  join: ship_cust_demo {
    from: customer_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ship_cdemo_sk} = ${ship_cust_demo.demo_sk} ;;
  }
  join: ship_hh_demo {
    from: household_demographics
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ship_hdemo_sk} = ${ship_hh_demo.demo_sk} ;;
  }
  join: ship_mode {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.ship_mode_sk} = ${ship_mode.ship_mode_sk} ;;
  }
  join: warehouse {
    type: left_outer
    relationship: many_to_one
    sql_on: ${web_sales.warehouse_sk} = ${warehouse.warehouse_sk} ;;
  }
}

explore: web_site {}
