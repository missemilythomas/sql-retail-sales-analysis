-- Inspect schema and inferred data types after CSV import
PRAGMA table_info(orders);

-- Row count and primary identifier sanity checks
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT [Order ID]) AS distinct_order_ids,
  COUNT(DISTINCT [Customer ID]) AS distinct_customers
FROM orders;

-- Check for NULLs in key analytical fields
SELECT
  SUM(CASE WHEN [Order Date] IS NULL THEN 1 ELSE 0 END) AS null_order_date,
  SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
  SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
  SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount,
  SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category
FROM orders;

-- Validate numeric ranges and unexpected values
SELECT
  SUM(CASE WHEN Sales < 0 THEN 1 ELSE 0 END) AS negative_sales_rows,
  SUM(CASE WHEN Quantity <= 0 THEN 1 ELSE 0 END) AS non_positive_quantity_rows,
  SUM(CASE WHEN Discount < 0 OR Discount > 1 THEN 1 ELSE 0 END) AS discount_out_of_range_rows
FROM orders;

-- Validate categorical fields for unexpected or inconsistent values
SELECT Category, COUNT(*) AS rows
FROM orders
GROUP BY Category
ORDER BY rows DESC;

SELECT Segment, COUNT(*) AS rows
FROM orders
GROUP BY Segment
ORDER BY rows DESC;

SELECT Region, COUNT(*) AS rows
FROM orders
GROUP BY Region
ORDER BY rows DESC;

-- Date consistency spot-check (useful before time-based grouping)
SELECT
  [Order Date],
  COUNT(*) AS rows
FROM orders
GROUP BY [Order Date]
ORDER BY [Order Date]
LIMIT 20;
