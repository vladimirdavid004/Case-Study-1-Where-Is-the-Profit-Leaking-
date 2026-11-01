Case Study 1: Where Is the Profit Leaking?
Subtitle: Discount and profitability analysis for a US office-supply retailer
Business problem
A national retailer is growing sales, but profit isn't keeping up. Leadership wants to know which products, regions and discount levels are losing money, and what to change.
Data
Superstore Sales dataset on Kaggle: 9,994 order lines and 21 columns covering a fictional US retailer over 4 years.
Field group	Columns
Order	Order ID, Order Date, Ship Date, Ship Mode
Customer	Customer ID, Segment (Consumer, Corporate, Home Office)
Location	City, State, Region
Product	Category, Sub-Category, Product Name
Money	Sales, Quantity, Discount, Profit
Questions
1.	Which categories and sub-categories make money, and which lose it?
2.	At what discount level do orders stop being profitable?
3.	Which regions and states drag down margin?
4.	Are there loss-making products that still sell a lot (keep, reprice or cut)?
Approach
1.	Clean: load into BigQuery (column names with spaces become underscores, like Sub_Category), fix date types, check for duplicates.
2.	Profit margin by group: margin = Profit ÷ Sales, by category, sub-category, region and segment.
3.	Discount bands: bucket discounts (0%, 1–10%, 11–20%, 21–30%, over 30%) and compare average margin per band.
4.	Loss leaders: list sub-categories and products with negative total profit, ranked by sales volume.
5.	Dashboard: Tableau Public with a margin-by-sub-category bar, a discount-vs-margin chart and a state map colored by profit.
Starter SQL
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
  ROUND(SUM(Sales), 0) AS sales,
  ROUND(SUM(Profit), 0) AS profit,
  ROUND(100 * SUM(Profit) / SUM(Sales), 1) AS margin_pct
FROM superstore.orders
GROUP BY discount_band
ORDER BY discount_band;

-- Loss-making sub-categories
SELECT
  Category, Sub_Category,
  ROUND(SUM(Sales), 0) AS sales,
  ROUND(SUM(Profit), 0) AS profit,
  ROUND(100 * SUM(Profit) / SUM(Sales), 1) AS margin_pct
FROM superstore.orders
GROUP BY Category, Sub_Category
HAVING SUM(Profit) < 0
ORDER BY profit;
Findings (fill in after you run it)
•	Overall margin: ___%
•	Discount level where margin turns negative: ___
•	Biggest loss-making sub-categories: ___ (−$___ total)
•	Weakest region or states: ___
Recommendations (fill in)
Write 2 or 3 actions tied to the numbers, for example a discount cap, repricing a product line, or reviewing a region's promo strategy. Estimate the profit impact of each one.
Why this one fits you
This is the analysis a district manager wishes they had: the same promo, margin and store-performance calls you made on the floor, now backed by data. It makes a strong interview story.
<img width="468" height="646" alt="image" src="https://github.com/user-attachments/assets/3303b92a-0897-4f03-a2d3-8f4f25899785" />
