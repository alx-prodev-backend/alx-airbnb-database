# 🔗 Mastering SQL Joins and Subqueries

This guide helps you understand and practice different types of **SQL JOINs** and **subqueries**, including both correlated and non-correlated types, with real queries and visual diagrams.

---

## 📘 What Are Joins?

Joins allow you to combine rows from two or more tables based on a related column between them. They are essential for working with relational databases.

---

## 1️⃣ INNER JOIN – Bookings with Users

### ✅ Goal

Retrieve all bookings **with the users who made them**.

### 🧐 Explanation

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
```

### 🔸 Visual

```
 USERS     ∩     BOOKINGS
```

Only overlapping (matched) records from both tables are returned.

---

## 2️⃣ LEFT JOIN – Properties with Reviews

### ✅ Goal

Retrieve all properties **with their reviews**, including properties with **no reviews**.

### 🧐 Explanation

Returns **all records from the left table** (`properties`) and matched records from the right (`reviews`). Non-matching right records are returned as `NULL`.

### 📄 Query

```sql
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id
ORDER BY 
    properties.id;
```

### 🔸 Visual

```
 PROPERTIES   ⬅️   REVIEWS
```

(All properties are returned, whether or not they have a review.)

---

## 3️⃣ FULL OUTER JOIN – All Users and All Bookings

### ✅ Goal

Retrieve **all users** and **all bookings**, including those with **no match** on the other side.

### 🧐 Explanation

Returns all records from both tables. Where no match exists, the result contains `NULL`s for the unmatched side.

> ⚠️ Not all databases (like MySQL) support `FULL OUTER JOIN`. You can simulate it using `UNION`.

### 📄 Query

```sql
-- Standard FULL OUTER JOIN
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;
```

#### MySQL-compatible version:

```sql
SELECT 
    users.id AS user
```
