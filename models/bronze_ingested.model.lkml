connection: "bronze_ingested"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: bronze_ingested_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bronze_ingested_default_datagroup

explore: bronze_mint_melon_chart {
    join: bronze_mint_melon_chart__details {
      view_label: "Bronze Mint Melon Chart: Details"
      sql: LEFT JOIN UNNEST(${bronze_mint_melon_chart.details}) as bronze_mint_melon_chart__details ;;
      relationship: one_to_many
    }
}

explore: bronze_youtube_video_comment {}

explore: bronze_mint_melon_chart_proto {}

