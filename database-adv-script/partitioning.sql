-- Partitioned version of booking
-- Step 1: Drop if already exists
DROP TABLE IF EXISTS bookings_partitioned;

-- Step 2: Create partitioned table
CREATE TABLE bookings_partitioned (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    INDEX (start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


-- Insert mock or real data into partitioned table
INSERT INTO bookings_partitioned
SELECT id, user_id, property_id, start_date, end_date, status
FROM bookings;

-- Query to fetch bookings for 2023 (only scans partition p2023)
EXPLAIN
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';