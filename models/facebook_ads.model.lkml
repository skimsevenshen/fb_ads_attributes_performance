connection: "skims_snowflake"

# include all the views
include: "/views/**/*.view"

datagroup: facebook_ads_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: facebook_ads_default_datagroup

explore: facebook_ads__ad_attributes_performance {
  from:  facebook_ads__ad_attributes_performance_daily
  label: "Facebook Ads ad attributes and Performance"
  sql_always_where: ${date_day_date} < current_date  ;;

  join:  calendar {
    view_label: "Calendar"
    type: inner
    relationship: many_to_one
    sql_on: ${facebook_ads__ad_attributes_performance.date_day_date} = ${calendar.calendar_date} ;;
  }
}

week_start_day: sunday
