-- INNER JOIN: Bookings with users (ordered by booking date)
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
ORDER BY b.start_date DESC;

-- LEFT JOIN: Properties with reviews (ordered by property name)
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.name ASC;

-- FULL OUTER JOIN (simulated with UNION in MySQL): Users and bookings (ordered by user name)
SELECT u.*, b.*
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.*, b.*
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id
WHERE u.id IS NULL
ORDER BY u.name ASC;