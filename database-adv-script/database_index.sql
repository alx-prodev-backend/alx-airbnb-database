
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
