

Implementation:

The booking table was partitioned by start_date using yearly range partitions (2023, 2024, 2025).

Queries that filter by start_date are directed only to the relevant partition.

Performance Test:
Ran the following query before and after partitioning:

sql
Copy
Edit
SELECT * FROM booking
WHERE start_date >= '2025-07-01'
  AND start_date < '2025-08-01'
  AND status = 'confirmed';
Before Partitioning:

Full table scan (even with indexes).

Slower performance: ~300+ ms on large datasets.

After Partitioning:

Only the booking_2025 partition was scanned.

Improved performance: ~30-50 ms.

Query planner showed Partition Pruning — skipping irrelevant partitions.

