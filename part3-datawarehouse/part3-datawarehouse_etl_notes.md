## ETL Decisions

### Decision 1 — Standardizing mixed date formats
Problem: The raw file contained inconsistent date formats such as `29/08/2023`, `12-12-2023`, and `2023-02-05`. This would make grouping, filtering, and joining by date unreliable in the warehouse.
Resolution: All dates were parsed and converted into a single standard format: `YYYY-MM-DD`. A surrogate `date_key` in `YYYYMMDD` format was also created for the `dim_date` table to support efficient joins from the fact table.

### Decision 2 — Filling missing store city values
Problem: Some rows had NULL values in the `store_city` column, which would create incomplete records in the store dimension and affect location-based analysis.
Resolution: Missing `store_city` values were filled by using the known city consistently associated with the same `store_name` in other rows. For example, stores such as `Chennai Anna` were mapped to `Chennai` based on existing non-null records.

### Decision 3 — Standardizing product category values
Problem: The category column contained inconsistent casing and naming such as `electronics`, `Electronics`, `Grocery`, and `Groceries`. This would split the same business category into multiple groups during reporting.
Resolution: Category values were cleaned and standardized into consistent business-friendly labels: `Electronics`, `Clothing`, and `Groceries`. In particular, `electronics` was converted to `Electronics`, and both `Grocery` and `Groceries` were standardized to `Groceries`.