Case Study 1: Where Is the Profit Leaking?

Subtitle: Discount and profitability analysis for a US office-supply retailer

Business problem
A national retailer is growing sales, but profit isn't keeping up. Leadership wants to know which products, regions and discount levels are losing money, and what to change.

Data
Superstore Sales dataset on Kaggle: 9,994 order lines and 21 columns covering a fictional US retailer over 4 years.

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


