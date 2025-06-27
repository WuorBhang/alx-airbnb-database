-- ============================================
-- AirBnB Database Sample Data (Seed Script)
-- This script populates the database with realistic sample data
-- ============================================

-- Clear existing data (if any)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Message;
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Booking;
TRUNCATE TABLE Property;
TRUNCATE TABLE User;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Insert Sample Users
-- ============================================

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Hosts
('550e8400-e29b-41d4-a716-446655440001', 'John', 'Smith', 'john.smith@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0101', 'host', '2024-01-15 10:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Sarah', 'Johnson', 'sarah.j@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0102', 'host', '2024-01-20 14:15:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Michael', 'Brown', 'mike.brown@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0103', 'host', '2024-02-01 09:45:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Emily', 'Davis', 'emily.davis@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0104', 'host', '2024-02-10 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'David', 'Wilson', 'david.wilson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0105', 'host', '2024-02-15 11:30:00'),

-- Guests
('550e8400-e29b-41d4-a716-446655440006', 'Lisa', 'Anderson', 'lisa.anderson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0106', 'guest', '2024-03-01 12:00:00'),
('550e8400-e29b-41d4-a716-446655440007', 'Robert', 'Taylor', 'robert.taylor@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0107', 'guest', '2024-03-05 15:30:00'),
('550e8400-e29b-41d4-a716-446655440008', 'Jennifer', 'Martinez', 'jennifer.m@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0108', 'guest', '2024-03-10 08:45:00'),
('550e8400-e29b-41d4-a716-446655440009', 'Christopher', 'Garcia', 'chris.garcia@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0109', 'guest', '2024-03-15 13:20:00'),
('550e8400-e29b-41d4-a716-446655440010', 'Amanda', 'Rodriguez', 'amanda.r@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0110', 'guest', '2024-03-20 10:15:00'),
('550e8400-e29b-41d4-a716-446655440011', 'James', 'Lee', 'james.lee@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0111', 'guest', '2024-03-25 17:00:00'),
('550e8400-e29b-41d4-a716-446655440012', 'Michelle', 'White', 'michelle.white@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0112', 'guest', '2024-04-01 09:30:00'),

-- Admin
('550e8400-e29b-41d4-a716-446655440013', 'Admin', 'User', 'admin@airbnb.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LeA/OwPMqGbMrXhV6', '+1-555-0000', 'admin', '2024-01-01 00:00:00');

-- ============================================
-- Insert Sample Properties
-- ============================================

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
-- John Smith's properties
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Downtown Apartment', 'A beautiful 2-bedroom apartment in the heart of downtown with modern amenities and city views. Perfect for business travelers and couples looking for a romantic getaway. Walking distance to restaurants, shopping, and public transportation.', 'New York, NY', 150.00, '2024-01-16 11:00:00', '2024-01-16 11:00:00'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Luxury Penthouse Suite', 'Stunning penthouse with panoramic city views, private terrace, and premium furnishings. Features 3 bedrooms, 2 bathrooms, full kitchen, and dedicated workspace. Ideal for extended stays and special occasions.', 'New York, NY', 350.00, '2024-01-18 14:30:00', '2024-01-18 14:30:00'),

-- Sarah Johnson's properties
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', 'Beachfront Villa', 'Spectacular oceanfront villa with direct beach access, private pool, and outdoor entertainment area. 4 bedrooms, 3 bathrooms, fully equipped kitchen. Perfect for families and groups seeking a luxury beach vacation.', 'Miami, FL', 280.00, '2024-01-22 16:45:00', '2024-01-22 16:45:00'),
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Art Deco Studio', 'Charming Art Deco studio in South Beach with vintage charm and modern conveniences. Features original details, updated kitchen, and close proximity to nightlife, beaches, and dining. Perfect for solo travelers and couples.', 'Miami, FL', 120.00, '2024-01-25 12:15:00', '2024-01-25 12:15:00'),

-- Michael Brown's properties
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Mountain Cabin Retreat', 'Rustic log cabin nestled in the mountains with fireplace, hot tub, and hiking trails nearby. 2 bedrooms, 1 bathroom, full kitchen. Escape the city and reconnect with nature. Pet-friendly and family-oriented.', 'Aspen, CO', 200.00, '2024-02-03 10:20:00', '2024-02-03 10:20:00'),
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'Ski Lodge Chalet', 'Luxury ski-in/ski-out chalet with mountain views, stone fireplace, and alpine furnishings. 5 bedrooms, 4 bathrooms, gourmet kitchen, game room. Perfect for ski enthusiasts and winter sports lovers.', 'Aspen, CO', 450.00, '2024-02-05 13:40:00', '2024-02-05 13:40:00'),

-- Emily Davis's properties
('650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 'Historic Brownstone', 'Elegant Victorian brownstone in prestigious neighborhood with period details and modern updates. 3 bedrooms, 2.5 bathrooms, formal dining room, private garden. Rich in history and architectural beauty.', 'Boston, MA', 220.00, '2024-02-12 15:10:00', '2024-02-12 15:10:00'),
('650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', 'Waterfront Loft', 'Contemporary loft with harbor views, exposed brick, high ceilings, and industrial chic design. Open floor plan, modern kitchen, rooftop access. Walking distance to historical sites and waterfront activities.', 'Boston, MA', 180.00, '2024-02-14 11:25:00', '2024-02-14 11:25:00'),

-- David Wilson's properties
('650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', 'Wine Country Estate', 'Luxurious estate surrounded by vineyards with wine tasting room, infinity pool, and gourmet kitchen. 6 bedrooms, 5 bathrooms, formal dining, library. Perfect for wine enthusiasts and special celebrations.', 'Napa Valley, CA', 500.00, '2024-02-17 09:55:00', '2024-02-17 09:55:00'),
('650e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', 'Cozy Cottage', 'Charming cottage in wine country with garden, patio, and peaceful surroundings. 1 bedroom, 1 bathroom, kitchenette, fireplace. Intimate setting for romantic getaways and quiet retreats.', 'Napa Valley, CA', 180.00, '2024-02-20 14:30:00', '2024-02-20 14:30:00');

-- ============================================
-- Insert Sample Bookings
-- ============================================

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
-- Confirmed bookings
('750e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '2024-06-15', '2024-06-18', 450.00, 'confirmed', '2024-04-15 10:30:00'),
('750e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440007', '2024-07-01', '2024-07-07', 1680.00, 'confirmed', '2024-04-20 14:15:00'),
('750e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440008', '2024-08-10', '2024-08-15', 1000.00, 'confirmed', '2024-05-05 16:45:00'),
('750e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440009', '2024-09-20', '2024-09-25', 1100.00, 'confirmed', '2024-06-01 09:20:00'),
('750e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440010', '2024-10-05', '2024-10-08', 1500.00, 'confirmed', '2024-06-15 11:30:00'),

-- Pending bookings
('750e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440011', '2024-11-15', '2024-11-20', 1750.00, 'pending', '2024-06-20 13:45:00'),
('750e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440012', '2024-12-01', '2024-12-05', 480.00, 'pending', '2024-06-22 15:20:00'),

-- Canceled bookings
('750e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440006', '2024-05-01', '2024-05-05', 1800.00, 'canceled', '2024-03-15 12:00:00'),
('750e8400-e29b-41d4-a716-446655440009', '650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440007', '2024-06-01', '2024-06-03', 360.00, 'canceled', '2024-04-10 14:30:00');

-- ============================================
-- Insert Sample Payments
-- ============================================

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
-- Payments for confirmed bookings
('850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', 450.00, '2024-04-15 10:35:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', 1680.00, '2024-04-20 14:20:00', 'stripe'),
('850e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440003', 1000.00, '2024-05-05 16:50:00', 'paypal'),
('850e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440004', 1100.00, '2024-06-01 09:25:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440005', 1500.00, '2024-06-15 11:35:00', 'stripe');

-- ============================================
-- Insert Sample Reviews
-- ============================================

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
-- Reviews for completed stays
('950e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', 5, 'Amazing stay! The apartment was exactly as described with stunning city views. John was a fantastic host - very responsive and provided great local recommendations. The location is perfect for exploring downtown. Would definitely book again!', '2024-06-20 15:30:00'),

('950e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440007', 5, 'Incredible beachfront villa! Waking up to ocean views every morning was magical. The private pool and beach access made it perfect for our family vacation. Sarah thought of everything - the kitchen was fully stocked and the property was immaculate. Highly recommended!', '2024-07-10 12:45:00'),

('950e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440008', 4, 'Great mountain retreat! The cabin was cozy and well-appointed. Loved the hot tub after long days of hiking. The fireplace created the perfect ambiance for evening relaxation. Only minor issue was the WiFi could be stronger, but that added to the digital detox experience!', '2024-08-18 18:20:00'),

('950e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440009', 5, 'Absolutely loved this historic brownstone! The architecture and period details are stunning. Emily was an excellent host with great knowledge of the local area. Walking distance to everything we wanted to see in Boston. The private garden was a lovely bonus!', '2024-09-28 14:15:00'),

('950e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440010', 5, 'Wine country paradise! This estate exceeded all expectations. The vineyard views, wine tasting room, and infinity pool made for an unforgettable weekend. David was incredibly welcoming and knowledgeable about local wineries. Perfect for our anniversary celebration!', '2024-10-12 16:40:00'),

-- Additional reviews from other guests for variety
('950e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440011', 4, 'Charming Art Deco studio in the heart of South Beach! The vintage details are beautiful and the location is unbeatable. Just steps from the beach and nightlife. Sarah was very helpful with check-in. Only wish there was a bit more closet space, but overall a great stay!', '2024-05-15 11:30:00'),

('950e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440012', 5, 'Luxury at its finest! This penthouse is absolutely breathtaking. The panoramic views, private terrace, and high-end furnishings made us feel like royalty. Perfect for our special occasion. John anticipated every need and provided exceptional service. Worth every penny!', '2024-03-10 09:45:00'),

('950e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', 4, 'Beautiful waterfront loft with amazing harbor views! The industrial design is stylish and the location is perfect for exploring Boston. Emily provided excellent local tips. The rooftop access was a highlight. Would have given 5 stars but the heating was a bit inconsistent during our winter stay.', '2024-02-25 13:20:00');

-- ============================================
-- Insert Sample Messages
-- ============================================

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
-- Pre-booking inquiries
('a50e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', 'Hi John! I\'m interested in booking your downtown apartment for June 15-18. Is it available? Also, is parking included?', '2024-04-10 14:20:00'),
('a50e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', 'Hi Lisa! Yes, the apartment is available for those dates. Parking is available for an additional $20/night. The apartment also includes WiFi, cable TV, and a fully equipped kitchen. Would you like me to send you some local restaurant recommendations?', '2024-04-10 15:45:00'),
('a50e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', 'That sounds perfect! Yes, I\'d love the restaurant recommendations. I\'ll go ahead and book now. Thanks!', '2024-04-10 16:10:00'),

-- Check-in instructions
('a50e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440007', 'Hi Robert! Your check-in is tomorrow at 3 PM. The villa address is 123 Ocean Drive. I\'ll send you the access code and parking instructions via text. Looking forward to hosting you!', '2024-06-30 18:30:00'),
('a50e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', 'Thank you Sarah! We\'re so excited for our beach vacation. Is there anything specific we should know about the property or local area?', '2024-06-30 19:15:00'),

-- During stay support
('a50e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440003', 'Hi Michael! We\'re having a wonderful time at the cabin. Just wanted to let you know the hot tub temperature seems a bit low. Is there a way to adjust it?', '2024-08-12 20:45:00'),
('a50e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440008', 'Hi Jennifer! Glad you\'re enjoying your stay! The hot tub controls are located behind the wooden panel next to the steps. Turn the dial clockwise to increase temperature. It takes about 30 minutes to heat up. Let me know if you need any other assistance!', '2024-08-12 21:20:00'),

-- Post-stay follow-up
('a50e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440009', 'Hi Christopher! I hope you enjoyed your stay at the brownstone. Would you mind leaving a review when you have a moment? Also, you\'re welcome back anytime!', '2024-09-26 10:30:00'),
('a50e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440004', 'Hi Emily! We had an absolutely wonderful time. The property is beautiful and your hospitality was exceptional. I\'ll definitely leave a review and we\'d love to come back next year!', '2024-09-26 14:20:00'),

-- Special requests
('a50e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', 'Hi David! We\'re celebrating our 10th anniversary during our stay. Is it possible to arrange for some wine from local vineyards to be available upon arrival? We\'d be happy to pay extra for this service.', '2024-09-20 16:45:00'),
('a50e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440010', 'Hi Amanda! Congratulations on your anniversary! I\'d be delighted to arrange a welcome wine package. I can provide a selection of our best local wines along with some artisanal chocolates. No extra charge - it\'s my pleasure to help make your celebration special!', '2024-09-20 18:10:00');

-- ============================================
-- Data Summary Report
-- ============================================

-- Display summary of inserted data
SELECT 'Data Summary Report' as '';
SELECT 
    'Users' as Entity, 
    COUNT(*) as Total_Records,
    SUM(CASE WHEN role = 'host' THEN 1 ELSE 0 END) as Hosts,
    SUM(CASE WHEN role = 'guest' THEN 1 ELSE 0 END) as Guests,
    SUM(CASE WHEN role = 'admin' THEN 1 ELSE 0 END) as Admins
FROM User
UNION ALL
SELECT 'Properties', COUNT(*), 0, 0, 0 FROM Property
UNION ALL
SELECT 'Bookings', COUNT(*), 
    SUM(CASE WHEN status = 'confirmed' THEN 1 ELSE 0 END),
    SUM(CASE WHEN status = 'pending' THEN 1 ELSE 0 END),
    SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END)
FROM Booking
UNION ALL
SELECT 'Payments', COUNT(*), 0, 0, 0 FROM Payment
UNION ALL
SELECT 'Reviews', COUNT(*), 0, 0, 0 FROM Review
UNION ALL
SELECT 'Messages', COUNT(*), 0, 0, 0 FROM Message;