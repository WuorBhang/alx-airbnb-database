-- ============================================
-- AirBnB Database Schema (DDL)
-- Database Management System: MySQL/PostgreSQL Compatible
-- Created: 2025
-- ============================================

-- Create Database (Optional - uncomment if needed)
-- CREATE DATABASE airbnb_db;
-- USE airbnb_db;

-- ============================================
-- User Table
-- ============================================
CREATE TABLE User (
    user_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Indexes
    INDEX idx_user_email (email),
    INDEX idx_user_role (role)
);

-- ============================================
-- Property Table
-- ============================================
CREATE TABLE Property (
    property_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    host_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(500) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_property_host 
        FOREIGN KEY (host_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Indexes
    INDEX idx_property_host (host_id),
    INDEX idx_property_location (location),
    INDEX idx_property_price (price_per_night)
);

-- ============================================
-- Booking Table
-- ============================================
CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price > 0),
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraints
    CONSTRAINT chk_booking_dates CHECK (start_date < end_date),
    CONSTRAINT chk_booking_future CHECK (start_date >= CURDATE()),
    
    -- Foreign Key Constraints
    CONSTRAINT fk_booking_property 
        FOREIGN KEY (property_id) REFERENCES Property(property_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_booking_user 
        FOREIGN KEY (user_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Indexes
    INDEX idx_booking_property (property_id),
    INDEX idx_booking_user (user_id),
    INDEX idx_booking_dates (start_date, end_date),
    INDEX idx_booking_status (status)
);

-- ============================================
-- Payment Table
-- ============================================
CREATE TABLE Payment (
    payment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_payment_booking 
        FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Indexes
    INDEX idx_payment_booking (booking_id),
    INDEX idx_payment_date (payment_date),
    INDEX idx_payment_method (payment_method)
);

-- ============================================
-- Review Table
-- ============================================
CREATE TABLE Review (
    review_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_review_property 
        FOREIGN KEY (property_id) REFERENCES Property(property_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_user 
        FOREIGN KEY (user_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Unique Constraint (One review per user per property)
    CONSTRAINT uk_review_user_property UNIQUE (user_id, property_id),
    
    -- Indexes
    INDEX idx_review_property (property_id),
    INDEX idx_review_user (user_id),
    INDEX idx_review_rating (rating),
    INDEX idx_review_created (created_at)
);

-- ============================================
-- Message Table
-- ============================================
CREATE TABLE Message (
    message_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraints
    CONSTRAINT chk_message_different_users CHECK (sender_id != recipient_id),
    
    -- Foreign Key Constraints
    CONSTRAINT fk_message_sender 
        FOREIGN KEY (sender_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_message_recipient 
        FOREIGN KEY (recipient_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Indexes
    INDEX idx_message_sender (sender_id),
    INDEX idx_message_recipient (recipient_id),
    INDEX idx_message_sent_at (sent_at),
    INDEX idx_message_conversation (sender_id, recipient_id, sent_at)
);

-- ============================================
-- Additional Optimization Indexes
-- ============================================

-- Composite indexes for common query patterns
CREATE INDEX idx_booking_property_dates ON Booking(property_id, start_date, end_date);
CREATE INDEX idx_property_host_price ON Property(host_id, price_per_night);
CREATE INDEX idx_review_property_rating ON Review(property_id, rating);

-- ============================================
-- Database Constraints and Triggers
-- ============================================

-- Add constraint to ensure host role for property owners
-- Note: This would typically be handled at application level
-- ALTER TABLE Property ADD CONSTRAINT chk_host_role 
-- CHECK (host_id IN (SELECT user_id FROM User WHERE role IN ('host', 'admin')));

-- ============================================
-- Views for Common Queries (Optional)
-- ============================================

-- Property summary with host information
CREATE VIEW v_property_summary AS
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location,
    p.price_per_night,
    CONCAT(u.first_name, ' ', u.last_name) as host_name,
    u.email as host_email,
    p.created_at,
    p.updated_at
FROM Property p
JOIN User u ON p.host_id = u.user_id
WHERE u.role IN ('host', 'admin');

-- Booking details with property and user information
CREATE VIEW v_booking_details AS
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    p.name as property_name,
    p.location as property_location,
    CONCAT(guest.first_name, ' ', guest.last_name) as guest_name,
    guest.email as guest_email,
    CONCAT(host.first_name, ' ', host.last_name) as host_name,
    host.email as host_email,
    b.created_at
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN User guest ON b.user_id = guest.user_id
JOIN User host ON p.host_id = host.user_id;

-- ============================================
-- Comments and Documentation
-- ============================================

/*
Schema Features:
1. UUID primary keys for all tables (36-character strings)
2. Proper foreign key relationships with CASCADE options
3. Check constraints for data validation
4. Comprehensive indexing strategy for performance
5. Timestamp tracking for audit trails
6. ENUM types for controlled vocabularies
7. Unique constraints where appropriate

Performance Considerations:
- Indexes on foreign keys for join performance
- Composite indexes for common query patterns
- Date range indexes for booking queries
- Text search capabilities can be added with full-text indexes

Security Notes:
- Password stored as hash only
- UUIDs prevent enumeration attacks
- Foreign key constraints maintain referential integrity
- Check constraints ensure data validity

Scalability Features:
- UUID keys allow for distributed systems
- Proper indexing supports large datasets
- Views provide abstraction for complex queries
- Partitioning can be added on date fields if needed
*/