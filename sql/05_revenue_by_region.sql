-- 05_revenue_by_region

SELECT
    region,
    COUNT(DISTINCT event_id)    AS total_events,
    ROUND(SUM(price_usd * units_sold))  AS total_revenue,
    ROUND(AVG(sell_through_pct), 1)     AS avg_sell_through_pct,
    ROUND(AVG(avg_daily_footfall))      AS avg_footfall,
    ROUND(AVG(units_sold::NUMERIC / avg_daily_footfall * 100), 2)    AS avg_conversion_rate_pct
FROM pop_up_events
WHERE event_status = 'Completed'
GROUP BY region
ORDER BY total_revenue DESC;

-- Key Insight:
-- Middle East memiliki avg_sell_through tertinggi tapi total_revenue rendah