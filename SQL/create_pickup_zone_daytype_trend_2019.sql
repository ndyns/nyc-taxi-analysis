CREATE OR REPLACE TABLE `nyc-taxi-analysis-457205.nyc_taxi_analysis_dataset.pickup_zone_daytype_trend_2019` AS

WITH base AS (
  SELECT
    z.zone_id AS pickup_id,
    CASE 
      WHEN EXTRACT(DAYOFWEEK FROM t.pickup_datetime) IN (1, 7) THEN 'weekend'
      ELSE 'weekday'
    END AS daytype,
    COUNT(*) AS trip_count
  FROM
    `nyc-taxi-analysis-457205.nyc_taxi_phase3.cleaned_yellow_tripdata_2019` t
  JOIN
    `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom` z
  ON
    t.pickup_location_id = z.zone_id
  GROUP BY pickup_id, daytype
),

-- 
agg AS (
  SELECT
    pickup_id,
    MAX(CASE WHEN daytype = 'weekday' THEN trip_count / 260.0 END) AS avg_weekday,
    MAX(CASE WHEN daytype = 'weekend' THEN trip_count / 104.0 END) AS avg_weekend
  FROM base
  GROUP BY pickup_id
)

SELECT
  pickup_id,
  ROUND(avg_weekday, 1) AS avg_weekday_trips,
  ROUND(avg_weekend, 1) AS avg_weekend_trips,
  ROUND(avg_weekend - avg_weekday, 1) AS diff,  -- 変化量
  ROUND((avg_weekend - avg_weekday) / avg_weekday * 100, 1) AS percent_change,  -- 変化率（%）
  CASE
    WHEN avg_weekend >= avg_weekday * 1.2 THEN '週末増加'
    WHEN avg_weekday >= avg_weekend * 1.2 THEN '平日増加'
    ELSE '変化なし'
  END AS trend_category
FROM agg
ORDER BY percent_change DESC;