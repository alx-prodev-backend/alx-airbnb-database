# 🔗 Mastering SQL Joins

This guide helps you understand and practice the different types of SQL JOINs by writing real queries and visualizing their effects using Venn diagrams and table structures.

---

## 📘 What Are Joins?

Joins allow you to combine rows from two or more tables based on a related column between them. They are essential in relational database queries.

---

## 1️⃣ INNER JOIN – Bookings with Users

### ✅ Goal
Retrieve all bookings **with the users who made them**.

### 🧠 Explanation
Returns only records that have a match in **both** tables.

### 📄 Query
```sql
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;
