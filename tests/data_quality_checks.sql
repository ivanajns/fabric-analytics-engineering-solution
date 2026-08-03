-- Data Quality Checks: fabric-revenue-analytics
-- Run against the Lakehouse SQL analytics endpoint (or as Spark SQL in a notebook).
-- Each check should return 0 rows / 0 count when the pipeline is healthy.

-- 1. Bronze: row count sanity check (should be 100,000)
SELECT COUNT(*) AS bronze_row_count
FROM bronze_revenue_transactions;

-- 2. Silver: no duplicate order_id should survive dedup
SELECT order_id, COUNT(*) AS cnt
FROM silver_revenue_transactions
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 3. Silver: region values should be fully standardized (no casing/abbreviation variants)
SELECT DISTINCT region
FROM silver_revenue_transactions
WHERE region NOT IN ('Northeast','Southeast','Midwest','West','Southwest','International');

-- 4. Silver: customer_name nulls should be backfilled wherever a matching customer_id exists elsewhere
SELECT COUNT(*) AS unresolved_null_names
FROM silver_revenue_transactions
WHERE customer_name IS NULL;

-- 5. Gold: referential integrity — every fact row must map to a valid dimension row
SELECT COUNT(*) AS orphaned_customers
FROM gold_fact_revenue f
LEFT JOIN gold_dim_customer c ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*) AS orphaned_products
FROM gold_fact_revenue f
LEFT JOIN gold_dim_product p ON f.product_key = p.product_key
WHERE p.product_key IS NULL;

SELECT COUNT(*) AS orphaned_dates
FROM gold_fact_revenue f
LEFT JOIN gold_dim_date d ON f.date_key = d.date_key
WHERE d.date_key IS NULL;

-- 6. Gold: no negative or zero revenue/quantity
SELECT COUNT(*) AS invalid_revenue_rows
FROM gold_fact_revenue
WHERE revenue <= 0 OR quantity <= 0;

-- 7. Gold: fact row count should match deduplicated Silver row count
SELECT
  (SELECT COUNT(*) FROM silver_revenue_transactions) AS silver_count,
  (SELECT COUNT(*) FROM gold_fact_revenue) AS gold_fact_count;
