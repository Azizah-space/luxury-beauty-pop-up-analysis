-- Cek jumlah total baris
SELECT COUNT(*) AS total_rows FROM pop_up_events;

-- Cek null values dan unknown city
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE end_date IS NULL) AS null_end_date,
    COUNT(*) FILTER (WHERE city = 'Unknown') AS unknown_city
FROM pop_up_events;


-- Cek encoding issue pada nama kota
SELECT DISTINCT city
FROM pop_up_events
ORDER BY city;