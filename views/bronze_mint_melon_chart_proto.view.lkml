view: bronze_mint_melon_chart_proto {
  sql_table_name: `bronze_ingested.bronze_mint_melon_chart_proto` ;;

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }
  dimension_group: ingestion_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ingestion_timestamp ;;
  }
  measure: count {
    type: count
  }
}
