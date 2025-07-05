"#✅ 1. Total Number of Bookings per User"
"#📄 Query:"

SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM
    users u
JOIN
    bookings b ON u.id = b.user_id
GROUP BY
    u.id, u.name
ORDER BY
    total_bookings DESC;


" Explanation:"
COUNT(b.id): counts bookings per user.

GROUP BY u.id, u.name: groups records by user.

ORDER BY: sorts users by the number of bookings.


"🪜 2. Rank Properties by Number of Bookings (Using RANK)
"📄 Query:"
sql
Copy
Edit
SELECT
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM
    properties p
LEFT JOIN
    bookings b ON p.id = b.property_id
GROUP BY
    p.id, p.name
ORDER BY
    booking_rank;


"🧠 Explanation:
"RANK() OVER (ORDER BY COUNT(b.id) DESC): assigns ranking based on total bookings.

"LEFT JOIN: includes properties with 0 bookings.
"
"GROUP BY: groups by property to count bookings per property.


