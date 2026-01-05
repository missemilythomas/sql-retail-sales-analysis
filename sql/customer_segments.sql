-- Revenue and profit by customer segment
SELECT
  segment,
  SUM(sales) AS revenue,
  SUM(profit) AS profit
FROM sales
GROUP BY segment
ORDER BY revenue DESC;

