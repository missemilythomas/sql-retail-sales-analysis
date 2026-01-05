-- Impact of discounts on revenue and profit
SELECT
  discount,
  SUM(sales) AS revenue,
  SUM(profit) AS profit
FROM sales
GROUP BY discount
ORDER BY discount;

