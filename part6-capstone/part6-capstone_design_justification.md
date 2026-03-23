I would use a hybrid architecture with multiple storage systems, because each hospital goal has a different access pattern and reliability requirement. For historical treatment data and core patient records, I would use a relational OLTP database such as PostgreSQL. This is the system of record for patient demographics, visits, diagnoses, medications, procedures, and billing because healthcare data requires strong consistency, transactions, and auditability. For real-time ICU device streams, I would use a streaming layer such as Kafka or MQTT paired with a time-series database. This is better suited for high-frequency vitals, alert thresholds, and trend analysis than a traditional relational database. For doctors’ plain-English patient-history search, I would store doctor notes and discharge summaries in a document store after chunking them, generate embeddings, and index them in a vector database. That allows semantic retrieval of clinically relevant passages even when the doctor’s wording differs from the original note. For monthly management reporting, I would load cleaned operational data into a data warehouse or lakehouse with curated fact and dimension tables to support bed occupancy, cost reporting, and department-level dashboards. Finally, I would use object storage as a data lake for raw files, device logs, scans, and archival data.



OLTP VS OLAP BOUNDARY

The transactional system ends at the operational applications and databases that support day-to-day care delivery. These include EHR workflows, lab orders, billing updates, and current patient-state transactions. In this zone, inserts and updates must be immediate, correct, and auditable. The analytical system begins once data is extracted from the operational systems into ETL or ELT pipelines for cleaning, standardization, de-identification where necessary, and aggregation. After that point, the data moves into the warehouse or lakehouse, feature store, and vector-search pipeline. In other words, OLTP supports care operations; OLAP supports reporting, model training, and question-answer retrieval.



TRADE-OFFS

A major trade-off in this design is complexity. Using separate systems for OLTP, streaming, warehouse analytics, and vector search improves fit-for-purpose performance, but it also increases operational overhead, data movement, and governance burden. I would mitigate this by defining a clear source-of-truth policy, building standardized pipelines with schema validation and monitoring, and enforcing strong metadata, access control, and lineage across all layers. That keeps the architecture powerful without becoming unmanageable.

