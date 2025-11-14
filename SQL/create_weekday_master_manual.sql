CREATE OR REPLACE TABLE `nyc-taxi-analysis-457205.nyc_taxi_analysis_dataset.weekday_master` AS
SELECT * FROM UNNEST([
  STRUCT(0 AS weekday_id, "日曜日" AS weekday_label),
  STRUCT(1, "月曜日"),
  STRUCT(2, "火曜日"),
  STRUCT(3, "水曜日"),
  STRUCT(4, "木曜日"),
  STRUCT(5, "金曜日"),
  STRUCT(6, "土曜日")
])
