-- Indexes for users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);  -- Composite index

-- Indexes for properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Performance testing with EXPLAIN QUERY PLAN (SQLite compatible)

-- BEFORE indexing (simulated):
-- EXPLAIN QUERY PLAN
-- SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';
-- Output: SCAN TABLE bookings

-- AFTER indexing:
EXPLAIN QUERY PLAN
SELECT * FROM bookings WHERE user_id = 101 AND status = 'confirmed';
-- Output: SEARCH TABLE bookings USING INDEX idx_bookings_user_status (user_id=? AND status=?)
