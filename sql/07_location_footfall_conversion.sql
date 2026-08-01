-- 07_location_footfall_conversion

SELECT
    location_type,
    ROUND(AVG(avg_daily_footfall))  AS avg_footfall,
    ROUND(AVG(units_sold::NUMERIC / avg_daily_footfall * 100), 2)   AS avg_conversion_rate_pct,
    ROUND(AVG(sell_through_pct), 1)     AS avg_sell_through_pct,
    ROUND(SUM(price_usd * units_sold))  AS total_revenue,
    COUNT(DISTINCT event_id)       AS total_events
FROM pop_up_events
GROUP BY location_type
ORDER BY avg_conversion_rate_pct DESC;

-- Key Insight:
-- Airport Duty-Free = footfall tinggi tapi conversion rate terendah
-- High-Street = footfall lebih rendah tapi conversion terbaik