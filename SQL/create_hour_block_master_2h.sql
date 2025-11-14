CREATE OR REPLACE TABLE `nyc-taxi-analysis-457205.nyc_taxi_analysis_dataset.hour_block_master` AS
SELECT * FROM UNNEST([
  STRUCT(1 AS hour_block_id, 0 AS hour_start, 1 AS hour_end, '00:00–01:59' AS hour_label),
  STRUCT(2, 2, 3, '02:00–03:59'),
  STRUCT(3, 4, 5, '04:00–05:59'),
  STRUCT(4, 6, 7, '06:00–07:59'),
  STRUCT(5, 8, 9, '08:00–09:59'),
  STRUCT(6, 10,11, '10:00–11:59'),
  STRUCT(7, 12,13, '12:00–13:59'),
  STRUCT(8, 14,15, '14:00–15:59'),
  STRUCT(9, 16,17, '16:00–17:59'),
  STRUCT(10,18,19, '18:00–19:59'),
  STRUCT(11,20,21, '20:00–21:59'),
  STRUCT(12,22,23, '22:00–23:59')
]);
