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
***🧠 Explanation: This returns only bookings that are linked to a valid user (i.e.,
 users who made a booking). If a booking is not linked to a user, it won't appear.
***

# ✅ 2. LEFT JOIN – Get all properties and their reviews, including those without reviews

SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN
    reviews ON properties.id = reviews.property_id;

'
🧠 Explanation: This will return all properties, even if they don't have a review. If a property has no review, the review_id, rating, and comment columns will be NULL.
'

# ✅ 3. FULL OUTER JOIN – Get all users and all bookings (even unlinked)

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

'
🧠 Explanation: This shows:

All users (even those who haven't booked anything).

All bookings (even those not linked to any user).

NULL values will appear in the unmatched side.

⚠️ Note: Some databases like MySQL don't support FULL OUTER JOIN directly. You can simulate it with UNION:
'

#