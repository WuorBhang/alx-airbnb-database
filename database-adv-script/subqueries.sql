-- Non-correlated subquery: Properties with avg rating > 4.0
SELECT p.*
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- Correlated subquery: Users with >3 bookings
SELECT u.*
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;