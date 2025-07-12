-- Objective: Identify and create indexes to improve query performance
-- This script includes:
-- 1. CREATE INDEX commands for high-usage columns
-- 2. EXPLAIN QUERY PLAN statements to measure performance before and after indexing

-- ===================================
-- Step 1: CREATE INDEX commands
-- ===================================

-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status); -- Composite index

-- Properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- ===================================
-- Step 2: Measure Query Performance
-- ===================================

-- BEFORE INDEXING (for documentation purposes only)
-- EXPLAIN QUERY PLAN
-- SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';
-- Output (simulated): SCAN TABLE bookings

-- AFTER INDEXING
EXPLAIN QUERY PLAN
SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';
-- Expected Output: SEARCH TABLE bookings USING INDEX idx_bookings_user_status (user_id=? AND status=?)

-- You can use EXPLAIN QUERY PLAN similarly for other indexed columns:
-- Example:
EXPLAIN QUERY PLAN
SELECT * FROM properties WHERE location = 'Cairo';
-- Expected Output: SEARCH TABLE properties USING INDEX idx_properties_location (location=?)
