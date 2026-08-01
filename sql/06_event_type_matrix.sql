-- 06_event_type_matrix


SELECT
    event_type,
    COUNT(DISTINCT event_id)    AS total_events,
    ROUND(AVG(lease_length_days))   AS avg_duration_days,
    ROUND(AVG(sell_through_pct), 1) AS avg_sell_through_pct,
    ROUND(AVG(price_usd * units_sold))  AS avg_revenue,
    ROUND(AVG(price_usd * units_sold / lease_length_days), 2)   AS avg_revenue_per_day,
    ROUND(AVG(units_sold::NUMERIC / avg_daily_footfall * 100), 2)   AS avg_conversion_rate_pct
FROM pop_up_events
WHERE event_status = 'Completed'
GROUP BY event_type
ORDER BY avg_revenue_per_day DESC;

-- Key Insight:
-- Flash Events unggul di revenue/day & sell-through