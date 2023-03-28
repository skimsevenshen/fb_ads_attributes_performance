view: facebook_ads__ad_attributes_performance_daily {
  sql_table_name: "SKIMS_DNA_FACEBOOK_ADS"."FACEBOOK_ADS__AD_ATTRIBUTES_PERFORMANCE_DAILY"    ;;
  drill_fields: [ad_id]

  dimension: ad_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."AD_ID" ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}."AD_NAME" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}."CLICKS" ;;
  }

  dimension_group: date_day {
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
    sql: ${TABLE}."DATE_DAY" ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}."IMPRESSIONS" ;;
  }

  dimension: inf_indicator {
    type: number
    sql: ${TABLE}."INF_INDICATOR" ;;
  }

  dimension: influencer {
    type: string
    sql: ${TABLE}."INFLUENCER" ;;
  }

  dimension: kk_indicator {
    type: number
    sql: ${TABLE}."KK_INDICATOR" ;;
  }

  measure: orders {
    type: sum
    sql: ${TABLE}."ORDERS" ;;
  }

  dimension: product_category {
    type: string
    sql: LOWER(REPLACE(${TABLE}."PRODUCT_CATEGORY", ' ', '')) ;;
  }

  measure: spend {
    type: sum
    sql: ${TABLE}."SPEND" ;;
    value_format:"$#,##0;($#,##0)"
    label: "Ad Spend"
  }

  dimension: textoverlay_indicator {
    type: number
    sql: ${TABLE}."TEXTOVERLAY_INDICATOR" ;;
  }

  dimension: thumbnail_url {
    type: string
    sql: ${TABLE}."THUMBNAIL_URL" ;;
  }

  dimension: thumbnail_image {
    type: string
    sql: ${TABLE}."THUMBNAIL_URL";;
    html: <img src="{{value}}" /> ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  measure: count {
    type: count
    label: "Ad count"
    description: "Count of ad_id."
    drill_fields: [ad_id]
  }

measure: conversion_rate{
  group_label: "KPIs"
  label: "Conversion Rate"
  description: "Conversion rate defined as orders divided by clicks."
  type: number
  sql: ${orders}* 1.0/ NULLIF(${clicks},0) ;;
  value_format_name: percent_2
  }

measure: click_through_rate {
    group_label: "KPIs"
    label: "Click Through Rate"
    description: "Click through rate defined as clicks divided by impressions."
    type: number
    sql: ${clicks}* 1.0/ NULLIF(${impressions},0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thousand_impressions {
    group_label: "KPIs"
    label: "Cost per Thousand Impressions"
    description: "Spend divided by thousand impressions."
    type: number
    sql: ${spend}* 1.0/ NULLIF(${impressions}*1000,0) ;;
    value_format:"$#,##0;($#,##0)"
  }
}
