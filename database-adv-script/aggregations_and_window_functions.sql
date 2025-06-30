-- Bookings count per user (GROUP BY and COUNT)
SELECT 
    user_id,
    COUNT(*) as booking_count
FROM bookings
GROUP BY user_id
ORDER BY booking_count DESC;

-- Property ranking using both RANK() and ROW_NUMBER()
SELECT 
    p.id,
    p.name,
    COUNT(b.id) as booking_count,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) as rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) as row_num_by_bookings
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY booking_count DESC;