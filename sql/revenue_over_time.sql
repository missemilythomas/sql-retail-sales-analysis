-- Monthly revenue trend (Order Date stored as DD-MM-YYYY)
SELECT
  substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS month,
  SUM(sales) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

