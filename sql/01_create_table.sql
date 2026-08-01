CREATE TABLE pop_up_events (
    event_id            VARCHAR(50),
    brand               VARCHAR(100),
    region              VARCHAR(50),
    city                VARCHAR(100),
    location_type       VARCHAR(100),
    event_type          VARCHAR(100),
    start_date          DATE,
    end_date            DATE,
    lease_length_days   INT,
    sku                 VARCHAR(50),
    product_name        VARCHAR(200),
    price_usd           NUMERIC(10,2),
    avg_daily_footfall  INT,
    units_sold          INT,
    sell_through_pct    NUMERIC(5,2)
);