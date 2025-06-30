-- Initial unoptimized query with WHERE/AND clauses
EXPLAIN ANALYZE
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date > '2025-01-01'
AND p.location = 'Paris'
AND u.status = 'active';

-- Optimized query with EXPLAIN
EXPLAIN ANALYZE
SELECT 
    b.id, b.start_date, b.end_date,
    u.name, u.email,
    p.name, p.location,
    pay.amount, pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date > '2025-01-01'
AND p.location = 'Paris'
AND u.status = 'active'
LIMIT 100;