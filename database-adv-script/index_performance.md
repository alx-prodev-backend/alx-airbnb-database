# Index Performance Report

## Objective
Improve query performance by identifying high-usage columns and creating indexes on them.

## Tables Analyzed
- `users`
- `bookings`
- `properties`

## Indexes Created

```sql
-- users
CREATE INDEX idx_users_email ON users(email);

-- bookings
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);

-- properties
CREATE INDEX idx_properties_location_id ON properties(location_id);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_availability ON properties(available_from);
