-- 04_derived_metrics

SELECT
    event_id,
    brand,
    region,
    city,
    location_type,
    event_type,
    lease_length_days,
    avg_daily_footfall,
    units_sold,
    price_usd,
    sell_through_pct,

    -- Total Revenue
    ROUND(price_usd * units_sold, 2) AS revenue,

    -- Revenue per Day (efficiency — fairer than total revenue)
    ROUND((price_usd * units_sold) / lease_length_days, 2) AS revenue_per_day,

    -- Conversion Rate (% footfall yang berubah jadi pembelian)
    ROUND(units_sold::NUMERIC / avg_daily_footfall * 100, 2) AS conversion_rate_pct

FROM pop_up_events
WHERE event_status = 'Completed'
ORDER BY revenue_per_day DESC;