# 📄 Database Index Optimization Report

## ✅ Objective
To identify high-usage columns in the `users`, `bookings`, and `properties` tables and create indexes to improve query performance.

---

## 🔍 Step 1: Identify High-Usage Columns

| Table      | Column(s)                          | Reason for Usage                            |
|------------|------------------------------------|---------------------------------------------|
| `users`    | `email`, `created_at`              | Filtering by email (e.g., login), sorting   |
| `bookings` | `user_id`, `property_id`, `status` | JOINs, filtering confirmed bookings         |
| `properties` | `location`, `price`, `host_id`   | Searching/filtering by location or price    |

---

## 🛠️ Step 2: Index Creation

**SQL Script – `database_index.sql`**

```sql
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
