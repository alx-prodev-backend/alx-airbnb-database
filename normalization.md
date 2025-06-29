# Database Normalization – Example: Online Course Platform

## First Normal Form (1NF)
- All fields contain atomic values.
- Removed repeating groups from the "courses" table.

## Second Normal Form (2NF)
- Moved course category into a separate table to avoid partial dependency.
- Ensured that all non-key attributes fully depend on the primary key.

## Third Normal Form (3NF)
- Removed instructor_name from the course table since it depends on instructor_id (not the primary key).
- Ensured no non-key attribute depends on another non-key attribute.

## Summary
- The design is now normalized to 3NF.
- The schema is efficient, free of redundancy, and easier to maintain.
