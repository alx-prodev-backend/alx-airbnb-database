'✅ 1. Non-Correlated Subquery
➕ Find properties with average rating > 4.0
A non-correlated subquery runs independently of the outer query. Here’s how to use it to filter properties by average review rating.

🧠 Query: '

SELECT
    id,
    name
FROM
    properties
WHERE
    id IN (
        SELECT
            property_id
        FROM
            reviews
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );

'
🔍 Explanation:
The subquery groups reviews by property_id and filters those with an average rating greater than 4.

The outer query returns only those property details whose IDs are in the result of the subquery.


'