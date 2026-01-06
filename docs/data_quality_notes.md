# Data Quality & Validation Notes

Before performing sales and profitability analysis, the dataset was reviewed to confirm suitability for KPI reporting and segmentation analysis.

Key checks performed:
- Verified table schema and inferred data types following CSV import
- Checked key analytical fields (Order Date, Sales, Profit, Discount, Quantity) for missing values
- Validated discount values fell within an expected range (0–1)
- Reviewed Category, Segment, and Region fields to identify unexpected or inconsistent values
- Performed date spot-checks to ensure reliable time-based aggregation

These validation steps helped ensure KPI calculations were accurate and reduced the risk of misleading conclusions.
