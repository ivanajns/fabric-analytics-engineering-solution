# fabric-analytics-engineering-solution

End-to-End Fabric Analytics Engineering Solution

## Repository structure

notebooks/ holds data engineering and transformation notebooks. data/raw/ holds raw source data landed as-is (Bronze layer input). data/gold/ holds curated, modeled data ready for reporting (Gold layer output). report/ holds the Power BI report file and related assets.

## Pipeline overview

This project follows a Medallion-style analytics engineering pipeline. Raw data is first ingested from its origin systems. In the Bronze (land) stage, that raw data is landed as-is into data/raw/ with no transformation, preserving full fidelity for traceability. In the Silver (clean/dedupe) stage, the data is cleaned, deduplicated, and conformed into consistent, validated tables. In the Gold (star schema) stage, the cleaned data is modeled into a star schema of fact and dimension tables in data/gold/, optimized for reporting and analysis. Finally, Power BI connects to the Gold layer in Import mode from GitHub, pulling the modeled data into the report in report/ for fast, self-contained analysis and visualization.
