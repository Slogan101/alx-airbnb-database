## Example Query:

SELECT *
FROM booking
WHERE start_date >= '2025-07-01'
  AND end_date <= '2025-07-15'
  AND status = 'confirmed';

Step 2: Analyze with EXPLAIN ANALYZE

EXPLAIN ANALYZE
SELECT *
FROM booking
WHERE start_date >= '2025-07-01'
  AND end_date <= '2025-07-15'
  AND status = 'confirmed';

📘 Sample Output (simplified):

Seq Scan on booking_2025  (cost=0.00..12500.00 rows=1000 width=64)
  Filter: (start_date >= '2025-07-01' AND end_date <= '2025-07-15' AND status = 'confirmed')
  Rows Removed by Filter: 250000
Execution Time: 205.182 ms

## Identified Bottlenecks:
Seq Scan = Sequential Scan, indicating no index was used.

Rows Removed by Filter shows lots of unneeded rows were scanned.

Execution Time is high for a relatively simple query.

## Step 3: Optimization — Add Multi-Column Index

-- Create a multicolumn index for common filters
CREATE INDEX idx_booking_dates_status
ON booking_2025(start_date, end_date, status);

EXPLAIN ANALYZE
SELECT *
FROM booking
WHERE start_date >= '2025-07-01'
  AND end_date <= '2025-07-15'
  AND status = 'confirmed';
Improved Output (example):

Index Scan using idx_booking_dates_status on booking_2025
  Index Cond: (start_date >= '2025-07-01' AND end_date <= '2025-07-15')
  Filter: (status = 'confirmed')
Execution Time: 22.143 ms

## Step 4: Report the Improvements
Performance Optimization Report

SELECT * FROM booking
WHERE start_date >= '2025-07-01'
  AND end_date <= '2025-07-15'
  AND status = 'confirmed';
Problem Identified:

Sequential scan over 250K+ rows.

Filters not using any index.

Slow response time: ~205 ms.

Optimization Applied:

Created index:

CREATE INDEX idx_booking_dates_status ON booking_2025(start_date, end_date, status);
Result:

PostgreSQL used Index Scan.

Execution time reduced to: ~22 ms.

More efficient row filtering.