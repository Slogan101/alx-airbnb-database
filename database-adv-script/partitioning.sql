-- partitioning.sql

-- 1. Drop the existing booking table (if needed)
DROP TABLE IF EXISTS booking CASCADE;

-- 2. Create the parent table with PARTITION BY
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);

-- 3. Create child partitions for each year
CREATE TABLE booking_2023 PARTITION OF booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Recreate foreign keys if needed
ALTER TABLE booking
    ADD CONSTRAINT fk_booking_user
    FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE booking
    ADD CONSTRAINT fk_booking_property
    FOREIGN KEY (property_id) REFERENCES property(property_id);

-- 5. Indexes (per partition or parent depending on access pattern)
CREATE INDEX idx_booking_2025_property_id ON booking_2025(property_id);
CREATE INDEX idx_booking_2025_user_id ON booking_2025(user_id);
CREATE INDEX idx_booking_2025_status ON booking_2025(status);




EXPLAIN ANALYZE
SELECT *
FROM booking
WHERE start_date >= '2025-07-01'
  AND start_date < '2025-08-01'
  AND status = 'confirmed';
