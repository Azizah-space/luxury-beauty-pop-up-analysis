-- 08_underperforming_events

-- Flag events with low sell-through for investigation
--Critical    : sell_through_pct < 40%
--Below Avg   : sell_through_pct 40% - 60%
--Needs Review: sell_through_pct 60% - 70%

SELECT
    event_id,
    brand,
    city,
    region,
    event_type,
    location_type,
    lease_length_days,
    sell_through_pct,
    ROUND(price_usd * units_sold) AS revenue,
    event_status,
    CASE
        WHEN sell_through_pct < 40 THEN 'Critical'
        WHEN sell_through_pct < 60 THEN 'Below Average'
        ELSE 'Needs Review'
    END AS performance_flag
FROM pop_up_events
WHERE sell_through_pct < 70
ORDER BY sell_through_pct ASC;

-- berapa event per flag category?
SELECT
    CASE
        WHEN sell_through_pct < 40 THEN 'Critical'
        WHEN sell_through_pct < 60 THEN 'Below Average'
        ELSE 'Needs Review'
    END AS performance_flag,
    COUNT(*) AS total_events
FROM pop_up_events
WHERE sell_through_pct < 70
GROUP BY performance_flag
ORDER BY total_events DESC;