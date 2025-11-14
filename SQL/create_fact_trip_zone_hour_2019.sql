CREATE OR REPLACE TABLE `nyc-taxi-analysis-457205.nyc_taxi_analysis_dataset.fact_trip_zone_hour_2019` AS
SELECT
  pickup_location_id AS pickup_zone_id,
  FLOOR(EXTRACT(HOUR FROM pickup_datetime) / 2) + 1 AS hour_block_id,
  MOD(EXTRACT(DAYOFWEEK FROM pickup_datetime) + 6, 7) AS weekday_id,
  COUNT(*) AS trip_count,
  SUM(fare_amount) AS total_fare_amount,
  SUM(tip_amount) AS total_tip_amount,
  SUM(trip_distance) AS total_trip_distance,
  SAFE_DIVIDE(SUM(tip_amount), SUM(fare_amount)) AS tip_rate
FROM
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`
WHERE
  EXTRACT(YEAR FROM pickup_datetime) = 2019
  AND pickup_location_id IS NOT NULL
  AND fare_amount > 0
GROUP BY
  pickup_zone_id,
  hour_block_id,
  weekday_id
ORDER BY
  pickup_zone_id,
  hour_block_id,
  weekday_id;
