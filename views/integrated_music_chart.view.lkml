# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view

view: integrated_music_chart {
  sql_table_name: `wev-prod-artist-analysis.bronze_ingested.integrated_music_chart` ;;

  dimension: album {
    type: string
    description: "앨범의 이름"
    sql: ${TABLE}.album ;;
  }
  dimension: artist {
    type: string
    description: "아티스트 정보"
    sql: ${TABLE}.artist ;;
  }
  dimension: chart_name {
    type: string
    description: "차트의 이름 (예: 실시간 핫 100, 월간 차트)."
    sql: ${TABLE}.chart_name ;;
  }
  dimension: chart_period_type {
    type: string
    description: "차트 생성 주기(예: 일간, 주간, 월간)."
    sql: ${TABLE}.chart_period_type ;;
  }
  dimension: chart_source {
    type: string
    description: "차트의 출처로 멜론, 유튜브, 스포티파이, 빌보드 등이 있음"
    sql: ${TABLE}.chart_source ;;
  }
  dimension: chart_type {
    type: string
    description: "차트의 타입 (예: 앨범, 노래, 아티스트)."
    sql: ${TABLE}.chart_type ;;
  }
  dimension: country {
    type: string
    description: "차트의 기준이 되는 국가"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: details {
    hidden: yes
    sql: ${TABLE}.details ;;
  }
  dimension_group: end_datetime {
    type: time
    description: "데이터 기준 종료일자"
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.end_datetime ;;
  }
  dimension_group: ingestion_timestamp {
    type: time
    description: "데이터 입력 일시"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ingestion_timestamp ;;
  }
  dimension_group: processed_timestamp {
    type: time
    description: "데이터 처리 일시"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.processed_timestamp ;;
  }
  dimension: rank {
    type: number
    description: "차트에서의 노래, 앨범, 또는 아티스트의 순위"
    sql: ${TABLE}.rank ;;
  }
  dimension: song {
    type: string
    description: "노래의 이름"
    sql: ${TABLE}.song ;;
  }
  dimension_group: start_datetime {
    type: time
    description: "데이터 기준 시작일자"
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.start_datetime ;;
  }
  measure: count {
    type: count
    drill_fields: [chart_name]
  }
}

view: integrated_music_chart__details {

  dimension: integrated_music_chart__details {
    type: string
    description: "추가 정보"
    hidden: yes
    sql: integrated_music_chart__details ;;
  }
  dimension: key {
    type: string
    sql: KEY ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}
