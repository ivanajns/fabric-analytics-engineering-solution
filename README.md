# Fabric Analytics Engineering Solution

An end-to-end analytics engineering project built with Microsoft Fabric, PySpark, Delta Lake, dimensional modeling, GitHub, and Power BI.

The solution demonstrates how raw transactional data can be ingested, cleaned, standardized, modeled, and transformed into a reporting-ready star schema using a Medallion architecture.

## Solution overview

The project processes 100,000 synthetic revenue transactions through three data layers:

- **Bronze:** Preserves the original source data and adds ingestion metadata.
- **Silver:** Cleans, standardizes, deduplicates, and validates the transactional data.
- **Gold:** Models the curated data into fact and dimension tables optimized for analytics.

The Gold tables are exported to GitHub as CSV files and loaded into Power BI using Import mode, creating a portable report that does not depend on continued access to the original Fabric environment.

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
└── report/
    ├── revenue-analytics.pbix
    └── revenue-dashboard.png
