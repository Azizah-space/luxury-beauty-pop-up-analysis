-- 03_data_cleaning

-- Fix encoding errors on city names
UPDATE pop_up_events SET city = 'Bogotá'    WHERE city = 'BogotÃ¡';
UPDATE pop_up_events SET city = 'São Paulo'  WHERE city = 'SÃ£o Paulo';

-- Verifikasi encoding fix (harusnya 0)
SELECT
    COUNT(*) FILTER (WHERE city = 'BogotÃ¡') AS encoding_bogota,
    COUNT(*) FILTER (WHERE city = 'SÃ£o Paulo') AS encoding_sao_paulo
FROM pop_up_events;

-- Tambah kolom event_status untuk flag Completed / Ongoing / Upcoming
ALTER TABLE pop_up_events ADD COLUMN event_status VARCHAR(20);

UPDATE pop_up_events
SET event_status = CASE
    WHEN end_date IS NULL        THEN 'Ongoing/TBC'
    WHEN end_date < CURRENT_DATE THEN 'Completed'
    ELSE 'Upcoming'
END;

-- Verifikasi distribusi status
SELECT event_status, COUNT(*) AS total
FROM pop_up_events
GROUP BY event_status;