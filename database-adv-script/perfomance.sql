-- Initial query
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Optimized query
SELECT b.id, b.start_date, b.end_date,
       u.name as user_name, u.email,
       p.name as property_name, p.location,
       pay.amount, pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;