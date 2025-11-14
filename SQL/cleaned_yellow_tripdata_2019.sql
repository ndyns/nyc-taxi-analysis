-- 生データのクレンジングクエリ

CREATE OR REPLACE TABLE nyc-taxi-analysis-457205.nyc_taxi_phase3.cleaned_yellow_tripdata_2019 AS
SELECT
  *
FROM
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`
WHERE
-- NULLでない
  pickup_datetime IS NOT NULL
  AND dropoff_datetime IS NOT NULL
  AND trip_distance IS NOT NULL
  AND fare_amount IS NOT NULL
  AND total_amount IS NOT NULL
  AND passenger_count IS NOT NULL
  AND pickup_location_id IS NOT NULL
  AND dropoff_location_id IS NOT NULL

-- 論理的整合性のチェック。異常データの除去
-- 100マイル＝160km。
  AND dropoff_datetime > pickup_datetime
  AND trip_distance > 0
  AND fare_amount >= 0
  AND tip_amount >= 0
  AND total_amount >= 0
  AND passenger_count BETWEEN 1 AND 6
  AND trip_distance < 100
  AND fare_amount < 500
  AND tip_amount <= fare_amount