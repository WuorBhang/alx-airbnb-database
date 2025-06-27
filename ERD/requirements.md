# Entity-Relationship Diagram Requirements - AirBnB Database

## Overview
This document outlines the Entity-Relationship (ER) diagram for the AirBnB database system, defining entities, attributes, and relationships.

## Entities and Attributes

### 1. User
- **Primary Key**: user_id (UUID)
- **Attributes**:
  - first_name (VARCHAR, NOT NULL)
  - last_name (VARCHAR, NOT NULL)
  - email (VARCHAR, UNIQUE, NOT NULL)
  - password_hash (VARCHAR, NOT NULL)
  - phone_number (VARCHAR, NULL)
  - role (ENUM: guest, host, admin, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. Property
- **Primary Key**: property_id (UUID)
- **Foreign Key**: host_id → User(user_id)
- **Attributes**:
  - name (VARCHAR, NOT NULL)
  - description (TEXT, NOT NULL)
  - location (VARCHAR, NOT NULL)
  - price_per_night (DECIMAL, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### 3. Booking
- **Primary Key**: booking_id (UUID)
- **Foreign Keys**: 
  - property_id → Property(property_id)
  - user_id → User(user_id)
- **Attributes**:
  - start_date (DATE, NOT NULL)
  - end_date (DATE, NOT NULL)
  - total_price (DECIMAL, NOT NULL)
  - status (ENUM: pending, confirmed, canceled, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 4. Payment
- **Primary Key**: payment_id (UUID)
- **Foreign Key**: booking_id → Booking(booking_id)
- **Attributes**:
  - amount (DECIMAL, NOT NULL)
  - payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

### 5. Review
- **Primary Key**: review_id (UUID)
- **Foreign Keys**:
  - property_id → Property(property_id)
  - user_id → User(user_id)
- **Attributes**:
  - rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
  - comment (TEXT, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 6. Message
- **Primary Key**: message_id (UUID)
- **Foreign Keys**:
  - sender_id → User(user_id)
  - recipient_id → User(user_id)
- **Attributes**:
  - message_body (TEXT, NOT NULL)
  - sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## Relationships

### 1. User → Property (One-to-Many)
- **Relationship**: HOSTS
- **Description**: A user (host) can own multiple properties
- **Cardinality**: 1:N
- **Foreign Key**: Property.host_id references User.user_id

### 2. User → Booking (One-to-Many)
- **Relationship**: MAKES
- **Description**: A user (guest) can make multiple bookings
- **Cardinality**: 1:N
- **Foreign Key**: Booking.user_id references User.user_id

### 3. Property → Booking (One-to-Many)
- **Relationship**: HAS
- **Description**: A property can have multiple bookings
- **Cardinality**: 1:N
- **Foreign Key**: Booking.property_id references Property.property_id

### 4. Booking → Payment (One-to-One)
- **Relationship**: GENERATES
- **Description**: Each booking has one payment
- **Cardinality**: 1:1
- **Foreign Key**: Payment.booking_id references Booking.booking_id

### 5. User → Review (One-to-Many)
- **Relationship**: WRITES
- **Description**: A user can write multiple reviews
- **Cardinality**: 1:N
- **Foreign Key**: Review.user_id references User.user_id

### 6. Property → Review (One-to-Many)
- **Relationship**: RECEIVES
- **Description**: A property can receive multiple reviews
- **Cardinality**: 1:N
- **Foreign Key**: Review.property_id references Property.property_id

### 7. User → Message (One-to-Many) - Sender
- **Relationship**: SENDS
- **Description**: A user can send multiple messages
- **Cardinality**: 1:N
- **Foreign Key**: Message.sender_id references User.user_id

### 8. User → Message (One-to-Many) - Recipient
- **Relationship**: RECEIVES
- **Description**: A user can receive multiple messages
- **Cardinality**: 1:N
- **Foreign Key**: Message.recipient_id references User.user_id

## ER Diagram Structure

```
[USER] ---|< HOSTS >|--- [PROPERTY]
   |                        |
   |< MAKES >|--- [BOOKING] ---|< HAS >|
   |              |
   |< WRITES >|   |--- [PAYMENT]
   |          |
   |      [REVIEW] ---|< RECEIVES >|--- [PROPERTY]
   |
   |< SENDS/RECEIVES >|--- [MESSAGE]
```

## Key Constraints

1. **User.email** must be unique
2. **Review.rating** must be between 1 and 5
3. **User.role** must be one of: guest, host, admin
4. **Booking.status** must be one of: pending, confirmed, canceled
5. **Payment.payment_method** must be one of: credit_card, paypal, stripe

## Indexes

- Primary keys are automatically indexed
- Additional indexes on:
  - User.email
  - Property.host_id
  - Booking.property_id
  - Booking.user_id
  - Payment.booking_id
  - Review.property_id
  - Review.user_id
  - Message.sender_id
  - Message.recipient_id

## Business Rules

1. Only users with role 'host' can create properties
2. Only users with role 'guest' can make bookings
3. A user cannot book their own property
4. Reviews can only be written by users who have completed a booking
5. Payments are automatically generated when a booking is confirmed
6. Messages facilitate communication between guests and hosts