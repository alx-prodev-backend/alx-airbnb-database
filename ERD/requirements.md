# ER Diagram – Airbnb Database Design

This document outlines the database schema for an Airbnb-style booking system, including key **entities**, **attributes**, **relationships**, and **constraints**. The ERD provides a high-level view of how the data is structured and how different components interact.

## 📌 Entities and Attributes

### 🧑‍💼 User
- `user_id`: UUID, Primary Key, Indexed
- `first_name`: VARCHAR, NOT NULL  
- `last_name`: VARCHAR, NOT NULL  
- `email`: VARCHAR, UNIQUE, NOT NULL  
- `password_hash`: VARCHAR, NOT NULL  
- `phone_number`: VARCHAR, NULL  
- `role`: ENUM (`guest`, `host`, `admin`), NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 🏠 Property
- `property_id`: UUID, Primary Key, Indexed  
- `host_id`: UUID, Foreign Key → User(`user_id`)  
- `name`: VARCHAR, NOT NULL  
- `description`: TEXT, NOT NULL  
- `location`: VARCHAR, NOT NULL  
- `pricepernight`: DECIMAL, NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 📅 Booking
- `booking_id`: UUID, Primary Key, Indexed  
- `property_id`: UUID, Foreign Key → Property(`property_id`)  
- `user_id`: UUID, Foreign Key → User(`user_id`)  
- `start_date`: DATE, NOT NULL  
- `end_date`: DATE, NOT NULL  
- `total_price`: DECIMAL, NOT NULL  
- `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💳 Payment
- `payment_id`: UUID, Primary Key, Indexed  
- `booking_id`: UUID, Foreign Key → Booking(`booking_id`)  
- `amount`: DECIMAL, NOT NULL  
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

---

### 🌟 Review
- `review_id`: UUID, Primary Key, Indexed  
- `property_id`: UUID, Foreign Key → Property(`property_id`)  
- `user_id`: UUID, Foreign Key → User(`user_id`)  
- `rating`: INTEGER, CHECK (1 ≤ rating ≤ 5), NOT NULL  
- `comment`: TEXT, NOT NULL  
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💬 Message
- `message_id`: UUID, Primary Key, Indexed  
- `sender_id`: UUID, Foreign Key → User(`user_id`)  
- `recipient_id`: UUID, Foreign Key → User(`user_id`)  
- `message_body`: TEXT, NOT NULL  
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 🔗 Relationships Overview
- A **User** can have multiple **Bookings**, **Properties**, **Reviews**, and **Messages** (sent/received).
- A **Property** belongs to a **Host (User)** and can have many **Bookings** and **Reviews**.
- A **Booking** is made by a **User** for a **Property**, and may have an associated **Payment**.
- **Payments** are always linked to a valid **Booking**.
- **Reviews** are submitted by **Users** on **Properties**.
- **Messages** are sent between **Users** (sender → recipient).

---

## 📏 Constraints Summary

### User
- Unique: `email`
- Required: `first_name`, `last_name`, `email`, `password_hash`, `role`

### Property
- FK: `host_id` → User(`user_id`)
- Required: `name`, `description`, `location`, `pricepernight`

### Booking
- FKs: `property_id` → Property, `user_id` → User
- `status` must be one of: `pending`, `confirmed`, `canceled`

### Payment
- FK: `booking_id` → Booking

### Review
- FKs: `property_id` → Property, `user_id` → User
- `rating` between 1 and 5

### Message
- FKs: `sender_id` and `recipient_id` → User

---

## 🔍 Indexing

- **Primary Keys** are indexed automatically.
- Additional indexes:
  - `email` (User)
  - `property_id` (Property, Booking)
  - `booking_id` (Booking, Payment)

---

## 📐 ER Diagram

You can find the visual ER diagram in this directory as:  
- `erd.drawio` – Editable format (open via diagrams.net)  
- `erd.png` – Rendered image version (preview-friendly)

---

## 🛠 Tools Suggested
- [Draw.io (diagrams.net)](https://app.diagrams.net)
- [Lucidchart](https://lucidchart.com)
- [dbdiagram.io](https://dbdiagram.io)

---

> This schema is optimized for relational integrity, data normalization, and scalability. It reflects a simplified structure for an Airbnb-style platform.

