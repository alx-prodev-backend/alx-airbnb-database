"✅ 1. Initial Query (Complex Joins)"

"Step 1: Initial query to retrieve all booking-related data"

SELECT
    b.id AS booking_id,
    b.booking_date,
    b.status,

    u.id AS user_id,
    u.name AS user_name,
    u.email,

    p.id AS property_id,
    p.name AS property_name,
    p.location,

    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status

FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
JOIN
    payments pay ON b.id = pay.booking_id;




"3. Refactored Query for Better Performance"

"
"✅ Selecting only necessary fields"
"✅ Using LEFT JOIN for optional relationships (e.g., if payments might not exist)"
"✅ Assuming proper indexing (see tip below)"

-- Step 2: Refactored for performance
SELECT
    b.id AS booking_id,
    b.booking_date,

    u.name AS user_name,
    u.email,

    p.name AS property_name,

    pay.amount,
    pay.payment_date

FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id;




