# 📦 Database Schema - AirBnB Clone

This folder contains the SQL schema definition for the AirBnB Clone project. The schema includes all tables, relationships, constraints, and indexes required to support the core functionalities of a property booking system.

---

## 📌 Objective

Define and implement a normalized relational database in SQL to support users, property listings, bookings, payments, messaging, and reviews within an AirBnB-like application.

---

## 🗃️ Tables Defined

| Table       | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| `Users`     | Stores information about guests, hosts, and admins.                        |
| `Properties`| Contains listing details for properties owned by hosts.                    |
| `Bookings`  | Tracks property reservations made by users.                                |
| `Payments`  | Manages payment records for confirmed bookings.                            |
| `Reviews`   | Stores user feedback and ratings on properties.                            |
| `Messages`  | Handles direct messages exchanged between users.                           |

---

## 🔐 Constraints & Keys

- **Primary Keys**: All main tables include UUID-based primary keys.
- **Foreign Keys**:
  - `host_id` in `Properties` → `Users`
  - `user_id` in `Bookings`, `Reviews` → `Users`
  - `property_id` in `Bookings`, `Reviews` → `Properties`
  - `booking_id` in `Payments` → `Bookings`
  - `sender_id` and `recipient_id` in `Messages` → `Users`
- **Unique Constraints**: Emails in the `Users` table.
- **Check Constraints**: On roles, booking statuses, ratings, and payment methods.
- **Not Null Constraints**: Applied to all essential attributes.

---

## ⚙️ Indexes

Optimized for query performance:
- `email` in `Users`
- `property_id` in `Properties`, `Bookings`, and `Reviews`
- `booking_id` in `Bookings` and `Payments`
- `sender_id`, `recipient_id` in `Messages`

---

## ✅ Normalization

The database is normalized to **Third Normal Form (3NF)**:
- Each table has atomic attributes.
- Non-key attributes fully depend on the primary key.
- No transitive dependencies.

---

## 📂 File Location

All schema definitions are located in:

