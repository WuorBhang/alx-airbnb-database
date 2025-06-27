# AirBnB Sample Data (Seed Script)

## Overview
This directory contains the sample data script to populate the AirBnB database with realistic test data for development and testing purposes.

## Files
- `seed.sql` - Complete sample data insertion script
- `README.md` - This documentation file

## Sample Data Overview

### Users (13 total)
- **5 Hosts**: John Smith, Sarah Johnson, Michael Brown, Emily Davis, David Wilson
- **7 Guests**: Lisa Anderson, Robert Taylor, Jennifer Martinez, Christopher Garcia, Amanda Rodriguez, James Lee, Michelle White  
- **1 Admin**: Admin User

### Properties (10 total)
Diverse property portfolio across major US cities:

#### New York Properties (2)
- **Cozy Downtown Apartment** - $150/night (John Smith)
- **Luxury Penthouse Suite** - $350/night (John Smith)

#### Miami Properties (2)  
- **Beachfront Villa** - $280/night (Sarah Johnson)
- **Art Deco Studio** - $120/night (Sarah Johnson)

#### Colorado Properties (2)
- **Mountain Cabin Retreat** - $200/night (Michael Brown)
- **Ski Lodge Chalet** - $450/night (Michael Brown)

#### Boston Properties (2)
- **Historic Brownstone** - $220/night (Emily Davis)
- **Waterfront Loft** - $180/night (Emily Davis)

#### California Properties (2)
- **Wine Country Estate** - $500/night (David Wilson)
- **Cozy Cottage** - $180/night (David Wilson)

### Bookings (9 total)
- **5 Confirmed** bookings with payments
- **2 Pending** bookings awaiting confirmation
- **2 Canceled** bookings for testing scenarios

### Payments (5 total)
- Payment methods: Credit Card, PayPal, Stripe
- All confirmed bookings have corresponding payments
- Amounts range from $450 to $1,680

### Reviews (8 total)
- Ratings: 4-5 stars (realistic positive reviews)
- Detailed comments with specific property feedback
- Mix of different guests reviewing different properties

### Messages (11 total)
- Pre-booking inquiries and responses
- Check-in instructions and confirmations
- During-stay support conversations
- Post-stay follow-up communications
- Special request handling

## Usage Instructions

### 1. Prerequisites
Ensure the database schema is already created:
```sql
-- Run schema first
SOURCE schema.sql;
```

### 2. Load Sample Data
```sql
-- Load the sample data
SOURCE seed.sql;
```

### 3. Verify Data Loading
```sql
-- Check record counts
SELECT 'Users' as table_name, COUNT(*) as record_count FROM User
UNION ALL
SELECT 'Properties', COUNT(*) FROM Property
UNION ALL  
SELECT 'Bookings', COUNT(*) FROM Booking
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payment
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Review
UNION ALL
SELECT 'Messages', COUNT(*) FROM Message;
```

## Data Characteristics

### Realistic Relationships
- Each host owns 2 properties (realistic portfolio size)
- Bookings span different time periods (past, current, future)
- Reviews only exist for completed stays
- Messages show typical host-guest communication patterns

### Geographic Diversity
Properties spread across major US markets:
- **Urban**: New York City, Boston, Miami
- **Resort**: Aspen (ski), Miami Beach, Napa Valley
- **Mountain**: Colorado Rockies
- **Coastal**: Miami oceanfront, Boston harbor

### Price Range Variety
- **Budget**: $120-180/night (studios, cottages)
- **Mid-range**: $200-280/night (apartments, cabins)
- **Luxury**: $350-500/night (penthouses, estates)

### Booking Status Distribution
- **Confirmed** (56%): Typical successful bookings with payments
- **Pending** (22%): New bookings awaiting host approval
- **Canceled** (22%): Realistic cancellation scenarios

### Security Features
- All passwords are properly hashed using bcrypt
- UUIDs used for all primary keys
- Phone numbers follow realistic US format
- Email addresses are properly formatted

## Testing Scenarios

### 1. Host Management
```sql
-- Find all properties for a specific host
SELECT p.name, p.location, p.price_per_night 
FROM Property p 
JOIN User u ON p.host_id = u.user_id 
WHERE u.first_name = 'John' AND u.last_name = 