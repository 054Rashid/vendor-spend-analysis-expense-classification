# Vendor Spend Analysis & Expense Classification

**Python | Pandas | SQL | Excel | Data Quality | Spend Analytics**

End-to-end synthetic spend analytics project demonstrating vendor normalization, expense classification, QA exception handling, anomaly detection and business spend analysis.

## Scale
- 18,000 transactions
- 180 vendors
- Controlled defects: 1628
- QA exceptions: 19791
- Vendor mapping success: 100.00%
- Pre-correction classification accuracy: 96.43%

## Workflow
```text
Vendor Master + Spend Transactions
 -> Vendor Normalization
 -> Vendor Mapping
 -> Expected Category
 -> Classification QA
 -> Duplicate / Anomaly / Policy Checks
 -> Exception Queue
 -> Vendor / Category / Department / Monthly Analytics
 -> Dashboard
```

## Key outputs
Enriched transaction data, classification exception queue, KPI summary, vendor/category/department/monthly spend tables, Excel workbook, SQLite database, interactive HTML dashboard, SQL analysis and automated tests.

## Run
```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python src/run_analysis.py
pytest -q
```
Open `dashboard/index.html`.

## Portfolio note
All data is synthetic and created for portfolio/learning purposes. No real company, customer or financial data is included.
