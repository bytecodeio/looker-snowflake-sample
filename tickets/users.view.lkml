view: users {
  view_label: "Users"
  sql_table_name: HACKATHON.USERS ;;
  drill_fields: [user_id]

  dimension: user_id {
    label: "User ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.USER_ID ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_BATCHED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
    hidden: yes
  }

  dimension: broadway {
    label: "Likes Broadway"
    type: yesno
    sql: ${TABLE}.BROADWAY ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: classical {
    label: "Likes Classical"
    type: yesno
    sql: ${TABLE}.CLASSICAL ;;
  }

  dimension: concerts {
    label: "Likes Concerts"
    type: yesno
    sql: ${TABLE}.CONCERTS ;;
  }

  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.FIRST_NAMS ;;
  }

  dimension: full_name {
    label: "Full Name"
    type: string
    sql: ${first_name} || ' ' || ${last_name} ;;
  }

  dimension: last_first_name {
    label: "Last, First Name"
    type: string
    sql: ${last_name} || ', ' || ${first_name} ;;
  }

  dimension: jazz {
    label: "Likes Jazz"
    type: yesno
    sql: ${TABLE}.JAZZ ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: musicals {
    label: "Likes Musicals"
    type: yesno
    sql: ${TABLE}.MUSICALS ;;
  }

  dimension: opera {
    label: "Likes Opera"
    type: yesno
    sql: ${TABLE}.OPERA ;;
  }

  dimension: phone {
    label: "Phone"
    type: string
    sql: ${TABLE}.PHONE ;;
  }

  dimension: rock {
    label: "Likes Rock"
    type: yesno
    sql: ${TABLE}.ROCK ;;
  }

  dimension: sports {
    label: "Likes Sports"
    type: yesno
    sql: ${TABLE}.SPORTS ;;
  }

  dimension: state {
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.STATE ;;
  }

  dimension: theater {
    label: "Likes Theater"
    type: yesno
    sql: ${TABLE}.THEATER ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.USERNAME ;;
  }

  dimension: vegas {
    label: "Likes Vegas"
    type: yesno
    sql: ${TABLE}.VEGAS ;;
  }

  measure: count {
    label: "Number of Users"
    type: count
    drill_fields: [user_id, first_name, last_name, state]
  }
}
