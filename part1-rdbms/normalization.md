## Anomaly Analysis

- Insert anomaly:
In the given table, we cannot insert a new product unless it is part of an order. 
Example: 
Columns involved: product_id, product_name, category, unit_price 
If a new product like P999 – Smart Watch exists but has no orders, there is no way to store it. 
Actual Problem: Product data depends on order existence.

- Update anomaly:
Customer or product details are repeated across multiple rows. 
Example: 
Columns: customer_id, customer_name, customer_email, customer_city 
Same customer_id appears in multiple rows. 
If we update customer email in one row but not others → inconsistent data. 
Actual Problem: Redundant data → inconsistency risk.

- Delete anomaly: 
If we delete an order, we may lose important data. 
Example: 
If a product appears only once and that order is deleted: 
Columns: product_id, product_name, category 
Entire product info is lost. 
Actual Problem: Deleting order removes product/customer history.


## Normalization Justification
While keeping all your data in a single table seems simple at first, it quickly creates a maintenance nightmare. When customer, product, and sales details are repeated in every row, you aren’t just wasting storage—you’re risking your data’s accuracy.
The Problem is Redundancy and Anomalies
Single-table designs suffer from three main "anomalies" that can break your workflow: Update Issues, Insert Issues, Delete Issues as mentioned above.
This can be solved with Third Normal Form (3NF)
Normalization to 3NF organizes your data into logical, independent tables (such as Customers, Products, and Orders) connected by unique IDs. This ensures that every piece of information is stored in exactly one place.
Reliability: A single update reflects across the entire system instantly.
Efficiency: It reduces file size and improves search performance.
Scalability: It allows your database to grow without becoming a cluttered mess.
It transforms a fragile spreadsheet into a reliable, high-performance system that ensures your business information remains accurate and easy to manage.
