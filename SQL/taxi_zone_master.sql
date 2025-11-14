SELECT
  CAST(zone_id AS INT64) AS zone_id,
  zone_name,
  borough,
  ST_Y(ST_CENTROID(zone_geom)) AS latitude,
  ST_X(ST_CENTROID(zone_geom)) AS longitude
FROM (
  SELECT *,
    ROW_NUMBER() OVER(PARTITION BY CAST(zone_id AS INT64) ORDER BY zone_name) AS row_num
  FROM `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom`
)
WHERE row_num = 1