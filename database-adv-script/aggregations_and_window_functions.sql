-- Bookings count per user
SELECT user_id, COUNT(*) as booking_count
FROM bookings
GROUP BY user_id;

-- Property ranking by bookings
SELECT 
    p.id,
    p.name,
    COUNT(b.id) as booking_count,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) as popularity_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;