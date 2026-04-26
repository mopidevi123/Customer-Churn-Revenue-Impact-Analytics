Customer Churn & Revenue Impact Analysis

A complete end-to-end data analytics project analyzing customer churn patterns, identifying high-risk segments, and quantifying revenue impact — with actionable retention strategies.

Problem Statement
Customer churn is one of the most costly problems for subscription-based businesses. This project answers three key business questions:
Who is churning? — Which customer segments have the highest churn rate?
Why are they churning? — What contract, tenure, or service factors drive churn?
What is it costing? — How much revenue is at risk due to churn?

Tools & Technologies
Tool	Purpose
Python (Pandas)	Data cleaning & transformation
PostgreSQL	Segmentation & churn analysis
Power BI	Interactive dashboard & KPI reporting


Project Workflow
Step 1 — Data Cleaning (Python / Pandas)
Loaded raw dataset with 7,000+ customer records
Handled missing values in 'TotalCharges' column
Standardized data types (converted 'TotalCharges' from string to float)
Removed duplicate records
Created binary churn flag (Yes = 1, No = 0)
Step 2 — SQL Analysis (PostgreSQL)
Segmented customers by contract type, tenure, and service usage
Used CTEs and aggregations to calculate churn rate per segment
Identified high-risk cohorts using `CASE` statements and `GROUP BY`
Calculated revenue at risk per segment
Key SQL snippet:

WITH churn_segments AS (
  SELECT
    contract,
    CASE
      WHEN tenure <= 12 THEN '0-1 Year'
      WHEN tenure <= 24 THEN '1-2 Years'
      ELSE '2+ Years'
    END AS tenure_groups,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate,
    ROUND(SUM(CASE WHEN churn_flag = 1 THEN monthly_charges ELSE 0 END), 2) AS revenue_at_risk
  FROM customer_churn
  GROUP BY contract, tenure_groups
)
SELECT * FROM churn_segments
ORDER BY churn_rate DESC;

Step 3 — Power BI Dashboard
Built interactive dashboard with slicers for contract type, tenure, and internet service
Designed KPI cards for key metrics
Created bar charts, donut charts, and trend lines for churn distribution

Key Findings
Metric	Value
Overall Churn Rate	26.5%
Total Revenue at Risk	~$1.67M
Highest Risk Segment	Month-to-Month, 0–1 Year tenure
Churn Rate in High-Risk Segment	~47%
Insights
Month-to-month contracts churn at nearly 3x the rate of annual contracts
Customers in their first year are the most likely to leave
Customers using Fiber Optic internet churn more than DSL users
Customers without tech support or online security show significantly higher churn

Business Recommendations
Incentivize annual contracts — Offer 1–2 month free upgrade to customers on month-to-month plans to lock in longer commitments
Early onboarding program — Target 0–6 month customers with proactive check-ins and support to reduce early churn
Bundle tech support — Customers without add-on services churn more; consider including basic tech support in base plans
> Estimated impact: These strategies could reduce churn by **10–15%**, recovering approximately **$167K–$250K** in annual revenue.

Dashboard Preview
> ![Dashboard Preview](dashboard/dashboard_preview.png)

Dataset
Source: Telco Customer Churn — Kaggle
Records: 7,043 customers
Features: 21 columns including demographics, services, contract type, and churn label

Author
Pravallika Mopidevi
 mopidevipravallika123@gmail.com
 GitHub
 SQL & Data Analytics | Power BI | Python

If you found this project useful, feel free to star the repository!
