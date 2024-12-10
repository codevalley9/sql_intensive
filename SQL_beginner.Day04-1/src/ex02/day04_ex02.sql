CREATE VIEW v_generated_dates
AS
SELECT dates::date
  FROM generate_series('2022-01-01', '2022-01-31', INTERVAL '1 day') AS dates
 ORDER BY dates::date;

-- SELECT * FROM v_generated_dates