##Project Title

Customer Churn & Revenue Impact Analysis

#Objective

The objective of this project is to analyze customer churn behavior and identify key factors contributing to customer attrition. The project also focuses on estimating revenue loss due to churn and providing actionable business insights to improve customer retention.

#Dataset Overview

The dataset contains telecom customer information including:

Customer demographics (gender, senior citizen, etc.)
Service details (internet, phone, streaming services)
Contract type and billing information
Monthly and total charges
Churn status (Yes/No)

# Data Cleaning (Python – Pandas)

Performed the following steps:

Handled missing values (especially in TotalCharges)
Converted data types (string → numeric)
Removed inconsistencies and ensured data quality
# Feature Engineering
Created Tenure Groups (0–1 yr, 1–2 yr, etc.)
Derived Revenue metrics
Built combined segmentation (Contract + Tenure)

# SQL Analysis

Used Advanced SQL concepts such as:

Aggregations (SUM, COUNT, AVG)
GROUP BY
CTEs (Common Table Expressions)
Filtering and segmentation
Key analyses performed:
Churn rate calculation
Churn by contract type
Churn by payment method
Churn by tenure group
High-risk customer segmentation

# Dashboard (Power BI)

Created an interactive dashboard including:

KPI Cards (Churn Rate, Revenue Loss, Customers)
Churn distribution by:
Contract
Payment Method
Tenure
High-risk customer segments
Revenue impact analysis

# Key Insights
Month-to-month contracts have highest churn (~43%)
Customers with low tenure (< 1 year) are high-risk
Electronic check users show higher churn (~47%)
Customers with higher monthly charges are more likely to churn
Top high-risk segment: Month-to-month | 0–1 Yr

# Business Impact
Estimated revenue loss due to churn: ~1.67M
Identified high-risk customer segments for targeted retention

# Recommendations
Promote long-term contracts to reduce churn
Target new customers with retention strategies
Improve service for high-paying customers
Encourage automatic payment methods

# Tools & Technologies
Python (Pandas)
SQL (Advanced)
Power BI

# Project Files
data/ → dataset
notebooks/ → Python data cleaning
sql/ → SQL queries
dashboard/ → Power BI file (.pbix)
images/ → dashboard screenshots

#Dashboard Preview



# Conclusion

This project demonstrates how data analysis can be used to identify customer churn patterns, estimate revenue loss, and provide actionable insights to improve business performance.