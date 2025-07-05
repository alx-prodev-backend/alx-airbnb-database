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

