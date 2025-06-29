# 🧪 Sample Data Seeder - AirBnB Clone

This SQL script seeds the database with sample data for development and testing purposes.

---

## 📂 Files

- `seed.sql`: Contains SQL `INSERT` statements to populate all main tables.

---

## ✅ Data Coverage

The seed includes sample records for:

- Users (guests, hosts)
- Properties (linked to hosts)
- Bookings (linked to users and properties)
- Payments (linked to confirmed bookings)
- Reviews (linked to users and properties)
- Messages (between users)

---

## 🛠️ How to Run

Make sure your database schema is already created using `schema.sql`, then run:

```sql
SOURCE database-script-0x02/seed.sql;
