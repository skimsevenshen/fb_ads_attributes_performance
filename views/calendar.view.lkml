view: calendar {
  sql_table_name: "SKIMS_DNA_REFERENCE"."CALENDAR"
    ;;


  dimension_group: calendar {
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
    sql: ${TABLE}."CALENDAR_DATE" ;;
  }

  dimension: calendar_dayofweek {
    type: string
    sql: case
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 1 then '1. Sunday'
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 2 then '2. Monday'
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 3 then '3. Tuesday'
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 4 then '4. Wednesday'
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 5 then '5. Thursday'
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 6 then '6. Friday'
            when ${TABLE}."CALENDAR_DAYOFWEEK" = 7 then '7. Saturday'
         end;;
    group_label: "Calendar Date"
    label: "Day of Week"

  }

  dimension: calendar_date_pk {
    sql: ${TABLE}."CALENDAR_DATE" ;;
    hidden: yes
    primary_key: yes
  }



  dimension: calendar_week_in_year {
    type: number
    sql: ${TABLE}."CALENDAR_WEEK_IN_YEAR" ;;
    group_label: "Calendar Date"
    label: "Week in Year"
  }

  dimension: calendar_year_month {
    type: string
    sql: ${TABLE}."CALENDAR_YEAR_MONTH" ;;
    group_label: "Calendar Date"
    label: "Calendar Year Month"
    hidden:  yes
  }

  dimension: retail_year_week {
    type: string
    sql: ${TABLE}."RETAIL_YEAR_WEEK" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Year Week"
    hidden:  yes
  }



  dimension: retail_dayofweek {
    type: string
    sql: case
            when ${TABLE}."RETAIL_DAYOFWEEK" = 1 then '1. Sunday'
            when ${TABLE}."RETAIL_DAYOFWEEK" = 2 then '2. Monday'
            when ${TABLE}."RETAIL_DAYOFWEEK" = 3 then '3. Tuesday'
            when ${TABLE}."RETAIL_DAYOFWEEK" = 4 then '4. Wednesday'
            when ${TABLE}."RETAIL_DAYOFWEEK" = 5 then '5. Thursday'
            when ${TABLE}."RETAIL_DAYOFWEEK" = 6 then '6. Friday'
            when ${TABLE}."RETAIL_DAYOFWEEK" = 7 then '7. Saturday'
         end ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Day of Week"
  }

  dimension: retail_month {
    type: number
    sql: ${TABLE}."RETAIL_MONTH" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Month"
  }

  dimension: retail_quarter {
    type: number
    sql: ${TABLE}."RETAIL_QUARTER" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Quarter"
  }

  dimension: retail_weekinmonth {
    type: number
    sql: ${TABLE}."RETAIL_WEEKINMONTH" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Week in Month"
  }

  dimension: retail_weekinyear {
    type: number
    sql: ${TABLE}."RETAIL_WEEKINYEAR" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Week in Year"
  }

  dimension: retail_year {
    type: number
    sql: ${TABLE}."RETAIL_YEAR" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Year"
  }

  dimension: retail_week_label {
    type: string
    sql: ${TABLE}."RETAIL_WEEK_LABEL" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Week Label"
  }

  dimension: retail_weekinyear_start_date {
    type: string
    sql: ${TABLE}."RETAIL_YEAR_WEEKINYEAR_START_DATE" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Week Start"
  }
  dimension: retail_weekinyear_end_date {
    type: string
    sql: ${TABLE}."RETAIL_YEAR_WEEKINYEAR_ENDDATE" ;;
    group_label: "NRF Retail Calendar"
    label: "Retail Week End Date"
  }

  dimension: planning_retail_dayofweek {
    type:  string
    sql: case
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 1 then '1. Sunday'
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 2 then '2. Monday'
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 3 then '3. Tuesday'
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 4 then '4. Wednesday'
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 5 then '5. Thursday'
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 6 then '6. Friday'
          when ${TABLE}."PLANNING_RETAIL_DAYOFWEEK" = 7 then '7. Saturday'
    end ;;
    group_label: "Planning Retail Calendar"
    label: "Planning Retail Day of Week"
  }

  dimension: planning_retail_weekinyear {
    type:  number
    sql:  ${TABLE}."PLANNING_RETAIL_WEEKINYEAR" ;;
    group_label: "Planning Retail Calendar"
    label: "Planning Retail Week in Year"
  }

  dimension: planning_retail_year {
    type:  number
    sql:  ${TABLE}."PLANNING_RETAIL_YEAR" ;;
    group_label: "Planning Retail Calendar"
    label: "Planning Retail Year"
  }

  dimension: planning_updated_po_season {
    type:  string
    sql:  ${TABLE}."PLANNING_UPDATED_PO_SEASON" ;;
    group_label: "Planning Retail Calendar"
    label: "Planning Updated POS Season Year"
  }

  dimension: planning_retail_week_label {
    type:  string
    sql:  ${TABLE}."PLANNING_RETAIL_WEEK_LABEL" ;;
    group_label: "Planning Retail Calendar"
    label: "Planning Retail Week Label"
  }

# Dimensions
  dimension: today {
    type: string
    label: "01 - Pivot by Today"
    description: "Pivot Dataset by Today: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_today ;;
  }
  dimension: yesterday {
    type: string
    label: "02 - Pivot by Yesterday"
    description: "Pivot Dataset by Yesterday: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_yesterday ;;
  }
  dimension: week {
    type: string
    label: "03 - Pivot by Week"
    description: "Pivot Dataset by Full Week: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_week ;;
  }
  dimension: week_todate {
    type: string
    label: "04 - Pivot by Week to Date"
    description: "Pivot Dataset by Week to Date: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_week_todate ;;
  }
  dimension: month {
    type: string
    label: "05 - Pivot by Month"
    description: "Pivot Dataset by Full Month: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_month ;;
  }
  dimension: month_todate {
    type: string
    label: "06 - Pivot by Month to Date"
    description: "Pivot Dataset by Month to Date: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_month_todate ;;
  }
  dimension: quarter {
    type: string
    label: "07 - Pivot by Quarter"
    description: "Pivot Dataset by Full Quarter: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_quarter ;;
  }
  dimension: quarter_todate {
    type: string
    label: "08 - Pivot by Quarter to Date"
    description: "Pivot Dataset by Quarter to Date: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_quarter_todate ;;
  }
  dimension: year {
    type: string
    label: "09 - Pivot by Year"
    description: "Pivot Dataset by Full Year: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_year ;;
  }
  dimension: year_todate {
    type: string
    label: "10 - Pivot by Year to Date"
    description: "Pivot Dataset by Year to Date: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_year_todate ;;
  }
  dimension: prior_week {
    type: string
    label: "11 - Pivot by Prior Weeks"
    description: "Pivot Dataset by Prior Weeks: 1 to 8 weeks. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Pivots"
    sql: ${TABLE}.comp_prior_week ;;
  }

# Dimensions

  dimension: planning_yesterday {
    type: string
    label: "02 - Planning Pivot by Yesterday"
    description: "Pivot Dataset by Yesterday using the Planning Calendar: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_planning_yesterday ;;
  }
  dimension: planning_week {
    type: string
    label: "03 - Planning Pivot by Week"
    description: "Pivot Dataset by Full Week using the Planning Calendar: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_planning_week ;;
  }
  dimension: planning_week_todate {
    type: string
    label: "04 - Planning Pivot by Week to Date"
    description: "Pivot Dataset by Week to Date using the Planning Calendar: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_planning_week_todate ;;
  }
  dimension: planning_month_todate {
    type: string
    label: "06 - Planning Pivot by Month to Date"
    description: "Pivot Dataset by Month to Date: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_month_todate ;;
  }
  dimension: planning_quarter {
    type: string
    label: "07 - Planning Pivot by Quarter"
    description: "Pivot Dataset by Full Quarter: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_quarter ;;
  }
  dimension: planning_quarter_todate {
    type: string
    label: "08 - Planning Pivot by Quarter to Date"
    description: "Pivot Dataset by Quarter to Date: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_quarter_todate ;;
  }
  dimension: planning_year {
    type: string
    label: "09 - Planning Pivot by Year"
    description: "Pivot Dataset by Full Year using the Planning Calendar: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_planning_year ;;
  }
  dimension: planning_year_todate {
    type: string
    label: "10 - Planning Pivot by Year to Date"
    description: "Pivot Dataset by Year to Date using the Planning Calendar: TY vs LY. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Planning Pivots"
    sql: ${TABLE}.comp_planning_year_todate ;;
  }

  dimension: future_week {
    type: string
    label: "01 - Future Week Pivot"
    description: "Pivot Dataset by Future Weeks. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Future Pivots"
    sql: ${TABLE}.future_week ;;
  }

  dimension: future_month {
    type: string
    label: "02 - Future Calendar Month Pivot"
    description: "Pivot Dataset by Future Calendar Months. To Use, Pivot This Field and Add a Filter for 'Dimension is Not Null'"
    group_label: "Future Pivots"
    sql: ${TABLE}.future_month ;;
  }

  dimension: drop_day_flag {
    type: yesno
    label: "Drop Day Flag"
    description: "Flag that indicates where there was a Drop on the given day"
    sql:  case when ${TABLE}."DROP_DAY_FLAG" = 1 then true else false end ;;
  }

  dimension: annotation_list {
    type: string
    label: "GA Annotation List"
    description: "Listing of all Google Analytics annotations for a given day"
    sql: ${TABLE}."ANNOTATION_LIST" ;;

  }

  dimension: drop_calendar_category {
    type:  string
    label: "Drop Calendar Category"
    description: "Listing of drop calendar category entries for a given day"
    sql: ${TABLE}."DROP_CALENDAR_CATEGORY" ;;


  }

  dimension: drop_calendar_category_description {
    type:  string
    label: "Drop Calendar Category Description"
    description: "Listing of drop calendar category description entries for a given day"
    sql: ${TABLE}."DROP_CALENDAR_CATEGORY_DESCRIPTION" ;;


  }


  measure: count {
    type: count
    label: "Days"
  }

  measure: number_of_drop_days {
    type: sum_distinct
    sql_distinct_key: ${calendar_date} ;;
    sql:  ${TABLE}."DROP_DAY_FLAG";;
    label: "# of Drop Days"

  }

  measure: number_of_days {
    type: count_distinct
    sql_distinct_key: ${calendar_date} ;;
    sql:  ${calendar_date};;
    label: "# of Days"

  }

  measure: percent_drop_days {
    type: number
    value_format_name: percent_0
    sql: ${number_of_drop_days}/${number_of_days} ;;
    label: "% of Drop Days"

  }


}
