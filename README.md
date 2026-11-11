# Case-Study Where Is the Profit Leaking? 

Case Study: Where Is the Profit Leaking?

Subtitle: Discount and profitability analysis for a US office-supply retailer

Business problem A national retailer is growing sales, but profit isn't keeping up. Leadership wants to know which products, regions and discount levels are losing money, and what to change.

Data Superstore Sales dataset on Kaggle: 9,994 order lines and 21 columns covering a fictional US retailer over 4 years.

##Questions
1. Which categories and sub-categories make money, and which lose it?
2. At what discount level do orders stop being profitable?
3. Which regions and states drag down margin?
4. Are there loss-making products that still sell a lot (keep, reprice or cut)?

##Approach
1. Clean: load into BigQuery (column names with hyphens, like Sub-Category, must be wrapped in backticks in SQL), fix date types, check for duplicates.
2. Profit margin by group: margin = Profit ÷ Sales, by category, sub-category, region and segment.
3. Discount bands: bucket discounts (0%, 1–10%, 11–20%, 21–30%, over 30%) and compare average margin per band.
4. Loss leaders: list sub-categories and products with negative total profit, ranked by sales volume.
5. Dashboard: Tableau Public with a margin-by-sub-category bar, a discount-vs-margin chart and a state map colored by profit.

##Findings 
1. Overall margin: 12.5% ($286K profit on $2.30M sales)
2. Margin turns negative above 20% off: 29.5% at full price, 16.6% at 1–10%, 11.6% at 11–20%, −10.0% at 21–30%, −48.2% over 30%
3. Biggest loss-making sub-categories: ___ (−$___ total)
4. Weakest region or states: ___

##Key insight
full-price orders are 47% of sales but earn $321K, more than total profit. All discounted orders combined lose about $35K. The "Over 30%" band is 12% of order lines yet loses $125K, about 44% of total profit. If the 1,393 orders discounted over 20% had broken even, profit would be about $422K, roughly 47% higher (an upper bound, since some of those sales might not happen at a smaller discount).

##Recommendations
1. Cap discounts at 20%
Anything above 20% off should need manager approval. That’s where profit flips negative: −10% margin at 21–30% and −48% above 30%. Those orders lost $135K combined.

2. Move deep promos into the 11–20% range
Instead of killing promotions, shift them to discounts that still make money. Orders at 11–20% off still earn an 11.6% margin, and they’re already a big chunk of sales ($792K). So customers still get a deal, but each sale stays profitable.

Estimated impact: even if only a quarter of the $135K loss is recovered (some customers won’t buy at a smaller discount), that’s about $34K more profit, a 12% increase. That’s a conservative number you can defend.
