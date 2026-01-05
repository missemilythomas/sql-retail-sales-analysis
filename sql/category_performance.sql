-- Revenue and profit by product category
SELECT
  category,
  SUM(sales) AS revenue,
  SUM(profit) AS profit
FROM sales
GROUP BY category
ORDER BY revenue DESC;

