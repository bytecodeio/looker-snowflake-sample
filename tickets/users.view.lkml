view: users {
  view_label: "Users"
  sql_table_name: TEST_DB.TICKET.USERS ;;
  drill_fields: [detail*]

  dimension: user_id {
    label: "User ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.USERID ;;
  }

  dimension: likes_broadway {
    label: "Likes Broadway"
    type: yesno
    sql: ${TABLE}.LIKEBROADWAY ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: likes_classical {
    label: "Likes Classical"
    type: yesno
    sql: ${TABLE}.LIKECLASSICAL ;;
  }

  dimension: likes_concerts {
    label: "Likes Concerts"
    type: yesno
    sql: ${TABLE}.LIKECONCERTS ;;
  }

  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.FIRSTNAME ;;
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

  dimension: likes_jazz {
    label: "Likes Jazz"
    type: yesno
    sql: ${TABLE}.LIKEJAZZ ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.LASTNAME ;;
  }

  dimension: likes_musicals {
    label: "Likes Musicals"
    type: yesno
    sql: ${TABLE}.LIKEMUSICALS ;;
  }

  dimension: likes_opera {
    label: "Likes Opera"
    type: yesno
    sql: ${TABLE}.LIKEOPERA ;;
  }

  dimension: phone {
    label: "Phone"
    type: string
    sql: ${TABLE}.PHONE ;;
  }

  dimension: likes_rock {
    label: "Likes Rock"
    type: yesno
    sql: ${TABLE}.LIKEROCK ;;
  }

  dimension: likes_sports {
    label: "Likes Sports"
    type: yesno
    sql: ${TABLE}.LIKESPORTS ;;
  }

  dimension: state {
    label: "State"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.STATE ;;
  }

  dimension: likes_theater {
    label: "Likes Theater"
    type: yesno
    sql: ${TABLE}.LIKETHEATER ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.USERNAME ;;
  }

  dimension: likes_vegas {
    label: "Likes Vegas"
    type: yesno
    sql: ${TABLE}.LIKEVEGAS ;;
  }

  measure: count {
    label: "Number of Users"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      user_id,
      first_name,
      last_name,
      state
    ]
  }
}
