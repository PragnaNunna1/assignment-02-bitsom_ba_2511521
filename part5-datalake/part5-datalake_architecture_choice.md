## Architecture Recommendation

I would recommend a Data Lakehouse for the food delivery startup.

A traditional Data Warehouse is excellent for structured analytics, but this startup collects highly diverse data types: GPS location logs, customer text reviews, payment transactions, and restaurant menu images. A warehouse alone is too rigid for handling raw semi-structured and unstructured data efficiently. A pure Data Lake can store all these formats easily, but it often lacks strong governance, reliable schema management, and high-performance SQL analytics for business reporting.

A Data Lakehouse is the best fit because it combines the flexibility of a Data Lake with the analytical strengths of a Data Warehouse.

First, it can store multiple data formats in one architecture, including structured transaction records, semi-structured logs, text data, and image files. This is important because the startup’s data is not limited to tables.

Second, it supports both analytics and AI/ML workloads. For example, the company may want SQL dashboards for delivery performance, sentiment analysis on customer reviews, route optimization using GPS logs, and computer vision on restaurant menu images. A lakehouse supports all of these better than a warehouse alone.

Third, it offers better scalability and cost efficiency for a fast-growing startup. Raw data can be stored cheaply while still being queryable for downstream reporting and modeling.

Therefore, a Data Lakehouse provides the right balance of flexibility, performance, and future readiness for a modern food delivery platform.