create database supply_chain_db;
use  supply_chain_db;

SELECT 'dim_customers' AS table_name, COUNT(*) AS rows_ FROM dim_customers
UNION ALL
SELECT 'dim_products', COUNT(*) FROM dim_products
UNION ALL
SELECT 'dim_date', COUNT(*) FROM dim_date
UNION ALL
SELECT 'dim_targets_orders', COUNT(*) FROM dim_targets_orders
UNION ALL
SELECT 'fact_order_lines', COUNT(*) FROM fact_order_lines
UNION ALL
SELECT 'fact_orders_aggregate', COUNT(*) FROM fact_orders_aggregate;

SELECT 
  SUM(order_id IS NULL) AS missing_order_id,
  SUM(product_id IS NULL) AS missing_product_id,
  SUM(customer_id IS NULL) AS missing_customer_id,
  SUM(order_qty IS NULL) AS missing_order_qty,
  SUM(delivery_qty IS NULL) AS missing_delivered_qty,
  SUM(agreed_delivery_date IS NULL) AS missing_agreed_date,
  SUM(actual_delivery_date IS NULL) AS missing_actual_delivery_date
FROM fact_order_lines;

SELECT order_id, COUNT(*) 
FROM fact_orders_aggregate
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_id, product_id, COUNT(*) 
FROM fact_order_lines
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS unmatched_customers
FROM fact_order_lines fol
LEFT JOIN dim_customers dc USING(customer_id)
WHERE dc.customer_id IS NULL;

SELECT COUNT(*) AS unmatched_products
FROM fact_order_lines fol
LEFT JOIN dim_products dp USING(product_id)
WHERE dp.product_id IS NULL;

SELECT COUNT(*) AS unmatched_dates
FROM fact_order_lines fol
LEFT JOIN dim_date d ON fol.order_placement_date = d.date
WHERE d.date IS NULL;

SELECT 
  SUM(on_time) AS on_time_orders,
  SUM(in_full) AS full_delivery,
  SUM(otif) AS on_time_in_full,
  COUNT(*) AS total_orders
FROM fact_orders_aggregate;

SELECT city, COUNT(*) AS customers
FROM dim_customers
GROUP BY city
ORDER BY customers DESC;

SELECT dp.category, SUM(fol.order_qty) AS total_ordered
FROM fact_order_lines fol
JOIN dim_products dp USING(product_id)
GROUP BY dp.category
ORDER BY total_ordered DESC;

SELECT 
  CASE 
    WHEN actual_delivery_date <= agreed_delivery_date THEN 'On Time'
    ELSE 'Late'
  END AS delivery_status,
  COUNT(*) AS count
FROM fact_order_lines
GROUP BY delivery_status;


SELECT DISTINCT order_placement_date 
FROM fact_order_lines
LIMIT 10;

SELECT DISTINCT date 
FROM dim_date
LIMIT 10;

set sql_safe_updates = 0;

UPDATE fact_order_lines
SET order_placement_date = STR_TO_DATE(order_placement_date, '%W, %M %e, %Y');

ALTER TABLE dim_date
MODIFY date DATE;

ALTER TABLE dim_date 
ADD COLUMN date_fixed DATE;

UPDATE dim_date
SET date_fixed = STR_TO_DATE(date, '%d-%b-%y');

ALTER TABLE dim_date 
DROP COLUMN date;

ALTER TABLE dim_date
RENAME COLUMN date_fixed TO date;

SELECT date 
FROM dim_date
ORDER BY date ASC 
LIMIT 10;

SELECT COUNT(*) AS unmatched_after_fix
FROM fact_order_lines fol
LEFT JOIN dim_date d ON fol.order_placement_date = d.date
WHERE d.date IS NULL;





















SELECT 
    DATEDIFF(actual_delivery_date, agreed_delivery_date) AS delay_days
FROM fact_order_lines;

DESC fact_order_lines;

ALTER TABLE fact_order_lines 
ADD COLUMN agreed_delivery_date_new DATE,
ADD COLUMN actual_delivery_date_new DATE;

UPDATE fact_order_lines
SET 
    agreed_delivery_date_new = STR_TO_DATE(agreed_delivery_date, '%W, %M %e, %Y'),
    actual_delivery_date_new = STR_TO_DATE(actual_delivery_date, '%W, %M %e, %Y');
SELECT agreed_delivery_date, agreed_delivery_date_new, actual_delivery_date, actual_delivery_date_new
FROM fact_order_lines
LIMIT 20;

DESC fact_orders_aggregate;



DESC dim_customers;


SELECT 
    agreed_delivery_date,
    actual_delivery_date,
    STR_TO_DATE(agreed_delivery_date, '%W, %M %e, %Y') AS parsed_agreed,
    STR_TO_DATE(actual_delivery_date, '%W, %M %e, %Y') AS parsed_actual
FROM fact_order_lines
WHERE 
    STR_TO_DATE(agreed_delivery_date, '%W, %M %e, %Y') IS NULL
    OR STR_TO_DATE(actual_delivery_date, '%W, %M %e, %Y') IS NULL
LIMIT 50;

UPDATE fact_order_lines
SET 
    agreed_delivery_date = TRIM(agreed_delivery_date),
    actual_delivery_date = TRIM(actual_delivery_date);

UPDATE fact_order_lines
SET agreed_delivery_date = NULL
WHERE agreed_delivery_date IN ('', 'NULL', 'null', 'NaN');

UPDATE fact_order_lines
SET actual_delivery_date = NULL
WHERE actual_delivery_date IN ('', 'NULL', 'null', 'NaN');

UPDATE fact_order_lines
SET agreed_delivery_date = NULL
WHERE agreed_delivery_date IN ('', 'NULL', 'null', 'NaN');

DESCRIBE fact_order_lines;

select * from fact_order_lines;
SELECT *,
       DATEDIFF(actual_delivery_date_new, agreed_delivery_date_new) AS delay_days
FROM fact_order_lines
LIMIT 100;

ALTER TABLE fact_order_lines
ADD COLUMN delay_days INT;

UPDATE fact_order_lines
SET delay_days = DATEDIFF(actual_delivery_date_new, agreed_delivery_date_new);


select * from fact_order_lines;
-- ============================================
-- CREATE CONSOLIDATED VIEW FOR POWER BI
-- ============================================

CREATE OR REPLACE VIEW vw_supply_chain_full AS
SELECT 
    -- Fact table fields
    f.id,
    f.order_id,
    f.order_placement_date,
    f.customer_id,
    c.customer_name,
    f.product_id,
    p.product_name,
    f.order_qty,
    f.delivery_qty,
    f.In_Full,
    f.On_Time,
    f.On_Time_In_Full,
    f.upload_timestamp,
    
    -- Dates for calculations
    f.agreed_delivery_date_new AS agreed_delivery_date,
    f.actual_delivery_date_new AS actual_delivery_date,
    
    -- Delay calculations
    f.delay_days,
    CASE
        WHEN f.delay_days = 0 THEN 'On Time'
        WHEN f.delay_days > 0 THEN 'Late'
        ELSE 'Early'
    END AS order_status,
    
    -- Date dimension fields
    YEAR(d.date) AS order_year,
MONTH(d.date) AS order_month,
QUARTER(d.date) AS order_quarter,
DAYNAME(d.date) AS order_weekday,

    
    -- Product dimension fields
    p.category AS product_category,
  
    
    -- Customer dimension fields
    c.city AS customer_city,
    
    -- Targets table fields (planned quantities)
   t.ontime_target,

	t.infull_target,

	t.otif_target,
    
    -- Aggregate table metrics (optional)
    a.on_time AS agg_on_time,
    a.in_full AS agg_in_full,
    a.otif AS agg_otif

FROM fact_order_lines f

-- Join with customer dimension
LEFT JOIN dim_customers c 
       ON f.customer_id = CAST(c.customer_id AS UNSIGNED)

-- Join with product dimension
LEFT JOIN dim_products p 
       ON f.product_id = CAST(p.product_id AS UNSIGNED)

-- Join with date dimension for order placement
LEFT JOIN dim_date d 
       ON f.order_placement_date = d.date

-- Join with target orders table
LEFT JOIN dim_targets_orders t
       ON f.customer_id = CAST(t.customer_id AS UNSIGNED)


-- Join with aggregated fact table for KPIs
LEFT JOIN fact_orders_aggregate a 
       ON f.order_id = a.order_id;

select * from vw_supply_chain_full;

-- eda 
-- Total rows in the view
SELECT COUNT(*) AS total_orders FROM vw_supply_chain_full;

-- Missing values for key columns
SELECT
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(order_qty IS NULL) AS missing_order_qty,
    SUM(delivery_qty IS NULL) AS missing_delivery_qty,
    SUM(agreed_delivery_date IS NULL) AS missing_agreed_date,
    SUM(actual_delivery_date IS NULL) AS missing_actual_date
FROM vw_supply_chain_full;

-- Orders where delivery exceeds or is less than ordered quantity
SELECT order_id, order_qty, delivery_qty
FROM vw_supply_chain_full
WHERE delivery_qty > order_qty
   OR delivery_qty < 0
   OR order_qty < 0;

-- Summary statistics
SELECT
    MIN(delay_days) AS min_delay,
    MAX(delay_days) AS max_delay,
    AVG(delay_days) AS avg_delay,
    SUM(CASE WHEN delay_days = 0 THEN 1 ELSE 0 END) AS on_time_orders,
    SUM(CASE WHEN delay_days > 0 THEN 1 ELSE 0 END) AS late_orders,
    SUM(CASE WHEN delay_days < 0 THEN 1 ELSE 0 END) AS early_orders
FROM vw_supply_chain_full;

-- Optional: counts per delay_days
SELECT delay_days, COUNT(*) AS count_orders
FROM vw_supply_chain_full
GROUP BY delay_days
ORDER BY delay_days;


SELECT *
FROM vw_supply_chain_full
WHERE (delay_days = 0 AND order_status != 'On Time')
   OR (delay_days > 0 AND order_status != 'Late')
   OR (delay_days < 0 AND order_status != 'Early');
   
-- Orders per customer
SELECT customer_name, COUNT(*) AS num_orders
FROM vw_supply_chain_full
GROUP BY customer_name
ORDER BY num_orders DESC;

-- Orders per product category
SELECT product_category, COUNT(*) AS num_orders
FROM vw_supply_chain_full
GROUP BY product_category
ORDER BY num_orders DESC;

-- Orders per city
SELECT customer_city, COUNT(*) AS num_orders
FROM vw_supply_chain_full
GROUP BY customer_city
ORDER BY num_orders DESC;

-- Compare OTIF, On Time, In Full with targets
SELECT 
    customer_name,
    SUM(agg_on_time) AS total_on_time,
    SUM(ontime_target) AS target_on_time,
    SUM(agg_in_full) AS total_in_full,
    SUM(infull_target) AS target_in_full,
    SUM(agg_otif) AS total_otif,
    SUM(otif_target) AS target_otif
FROM vw_supply_chain_full
GROUP BY customer_name
ORDER BY customer_name;


