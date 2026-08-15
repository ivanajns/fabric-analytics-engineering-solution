# Fabric Analytics Engineering Solution

An end-to-end analytics engineering project built with Microsoft Fabric, PySpark, Delta Lake, a star schema dimensional model, and a Power BI dashboard with a semantic model and quality visualizations.

The solution demonstrates how raw transactional data can be ingested, cleaned, standardized, modeled, and transformed into a reporting-ready star schema using a Medallion architecture in an all-in-one analytics platform. 

## Solution overview

The project processes 100,000 synthetic revenue transactions through three data layers:

- **Bronze:** Preserves the original source data and adds ingestion metadata.
- **Silver:** Cleans, standardizes, deduplicates, and validates the transactional data.
- **Gold:** Models the curated data into fact and dimension tables optimized for analytics.

The Gold tables are exported to GitHub as CSV files and loaded into Power BI using Import mode, creating a portable report that does not depend on continued access to the original Fabric environment.


## Business Impact

From a business perspective, the value is creating a trusted foundation for decision-making. Instead of leadership relying on multiple reports, manually reconciled numbers, or different interpretations of the same metric, the solution creates a consistent view of revenue and performance. This reduces time spent validating the numbers and increases confidence in the decisions being made from them.

More importantly, the architecture provides a foundation that can scale with the business. As reporting needs, customers, products, and data volumes grow, the organization has a repeatable approach for bringing data together, applying consistent business logic, and delivering reliable insights. The result is less time spent managing data and more time spent using it to drive business decisions.


## Repository structure

```text
fabric-analytics-engineering-solution/
├── README.md
├── data/
│   ├── raw/
│   │   └── revenue_transactions_3yr_100k.csv
│   └── gold/
│       ├── gold_fact_revenue.csv
│       ├── gold_dim_date.csv
│       ├── gold_dim_customer.csv
│       └── gold_dim_product.csv
├── notebooks/
│   ├── 01_bronze_ingestion.ipynb
│   ├── 02_silver_transformation.ipynb
│   └── 03_gold_dimensional_model.ipynb
├── tests/
│   └── data_quality_checks.sql
└── report/
    ├── revenue_analytics.pbix
    └── revenue_dashboard.png
