# google-playstore-analytics
End-to-End Google Play Store Analytics and Business Intelligence using Python, PostgreSQL and Power BI
# Google Play Store Analytics and Business Intelligence

## Project Overview
End-to-end analytics project analyzing 10,357 Google Play Store 
apps using Python, PostgreSQL and Power BI to uncover actionable 
app market strategy insights.

## Tools Used
- **Python** — Data cleaning and EDA
- **PostgreSQL** — 13 Business queries and analysis
- **Power BI** — Interactive 2-page BI dashboard

## Key Insights
- Free apps generate **169x more installs** than paid apps (15.3M vs 90K)
- **Events (4.40) and Education (4.38)** are highest rated 
  low-competition categories
- **80.93% of apps** target Everyone segment
- Communication and Game dominate 50%+ of total market installs
- No correlation between rating and installs — category utility 
  matters more than ratings alone

## Project Workflow
Raw Data (10,841 records)
→ Python Cleaning (10,357 clean records)
→ PostgreSQL Analysis (13 business queries)
→ Power BI Dashboard (2 interactive pages)

## Dashboard Features
- KPI Cards — Total Apps, Average Rating, Free Apps %, Categories
- Interactive drillthrough from Page 1 to Page 2
- Synced slicers across both pages
- Page 1 — Market Overview
- Page 2 — Deep Dive Correlation Analysis

## Dashboard Screenshots

### Page 1 — Market Overview
![Page 1](https://raw.githubusercontent.com/koteshwarkatkuri/google-playstore-analytics/main/Page01_Overview.png)

### Page 2 — Deep Dive Analysis
![Page 2](https://raw.githubusercontent.com/koteshwarkatkuri/google-playstore-analytics/main/Page02_DeepDive.png)

## Business Recommendations
1. Build free apps targeting Everyone audience segment
2. Target Events or Education categories for high ratings 
   with low competition
3. Focus on Communication or Social for maximum install reach
4. Medical and Finance are only viable paid app categories

## How to Run
1. Clone repository
2. Run notebook/playstore_analysis.ipynb for data cleaning
3. Import data/playstore_cleaned.csv to PostgreSQL
4. Run sql/playstore_queries.sql for business analysis
5. Open powerbi/GooglePlayStore_Dashboard.pbix in Power BI Desktop

## Author
Koteshwar Katkuri
[LinkedIn] | [GitHub] | Mumbai, India
