
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

-- Performance measurement before and after indexing

-- Example query: Check performance for filtering bookings
EXPLAIN SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';

-- JSON format for detailed analysis (for supported MySQL/MariaDB versions)
EXPLAIN FORMAT=JSON SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';



-- Query Used for Testing
SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';


-- EXPLAIN Output BEFORE Adding Indexes
-- Simulated output from a database before indexing
EXPLAIN QUERY PLAN
SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';
-- Output:
-- SCAN TABLE bookings
-- => Full table scan, no index used


-- EXPLAIN Output AFTER Adding Indexes
-- Simulated output after creating index on (user_id, status)
EXPLAIN QUERY PLAN
SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';
-- Output:
-- SEARCH TABLE bookings USING INDEX idx_bookings_user_status (user_id=? AND status=?)
-- => Index used, fewer rows scanned, improved performance
