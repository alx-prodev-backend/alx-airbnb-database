# ✅ 1. INNER JOIN – Get all bookings and the users who made them
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
