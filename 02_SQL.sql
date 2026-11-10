-- Margin by discount band
SELECT
  CASE
    WHEN Discount = 0 THEN '0%'
    WHEN Discount <= 0.10 THEN '1-10%'
    WHEN Discount <= 0.20 THEN '11-20%'
    WHEN Discount <= 0.30 THEN '21-30%'
    ELSE 'Over 30%'
  END AS discount_band,
  COUNT(*) AS order_lines,
  ROUND(SUM(Sales), 0) AS total_sales,
  ROUND(SUM(Profit), 0) AS total_profit,
  ROUND(100 * SUM(Profit) / SUM(Sales), 1) AS margin_pct,
  ROUND(100 * SUM(Sales) / SUM(SUM(Sales)) OVER (), 1) AS pct_of_sales,
  ROUND(100 * SUM(Profit) / SUM(SUM(Profit)) OVER (), 1) AS pct_of_profit
FROM `sample_superstone.superstone`
GROUP BY discount_band
ORDER BY discount_band;

-- Loss-making sub-categories
SELECT
  Category, `Sub-Category`,
  ROUND(SUM(Sales), 0) AS sales,
  ROUND(SUM(Profit), 0) AS profit,
  ROUND(100 * SUM(Profit) / SUM(Sales), 1) AS margin_pct
FROM superstore.orders
GROUP BY Category, `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY profit;
