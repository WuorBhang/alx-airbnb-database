-- INNER JOIN: Bookings with users
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Properties with reviews
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN (simulated with UNION in MySQL): Users and bookings
SELECT u.*, b.*
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.*, b.*
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id
WHERE u.id IS NULL;