# AirBnB Database Schema

## Overview
This directory contains the complete database schema definition for the AirBnB platform, including all tables, constraints, indexes, and relationships.

## Files
- `schema.sql` - Complete DDL (Data Definition Language) script to create the database structure

## Database Structure

### Tables Created
1. **User** - Stores user information (guests, hosts, admins)
2. **Property** - Stores property listings
3. **Booking** - Stores booking transactions
4. **Payment** - Stores payment information
5. **Review** - Stores property reviews and ratings
6. **Message** - Stores messages between users

### Key Features

#### Primary Keys
- All tables use UUID (36-character) primary keys for better scalability and security
- UUIDs prevent enumeration attacks and support distributed systems

#### Foreign Key Relationships
- Proper referential integrity with CASCADE options
- User → Property (host relationship)
- User → Booking (guest relationship)
- Property → Booking (property booking relationship)
- Booking → Payment (payment relationship)
- User/Property → Review (review relationships)
- User → Message (sender/recipient relationships)

#### Data Validation
- Check constraints ensure data quality (e.g., rating 1-5, positive prices)
- Date validation ensures booking dates are logical
- ENUM types control acceptable values for status fields

#### Performance Optimization
- Comprehensive indexing strategy
- Composite indexes for common query patterns
- Foreign key indexes for join performance
- Date range indexes for booking queries

## Usage Instructions

### 1. Database Creation
```sql
-- Create database (if needed)
CREATE DATABASE airbnb_db;
USE airbnb_db;

-- Run the schema script
SOURCE schema.sql;
```

### 2. Verification
```sql
-- Check table creation
SHOW TABLES;

-- Verify table structure
DESCRIBE User;
DESCRIBE Property;
-- ... etc for each table
```

### 3. Index Verification
```sql
-- Check indexes
SHOW INDEX FROM User;
SHOW INDEX FROM Property;
-- ... etc for each table
```

## Schema Highlights

### Security Features
- Password hashing (passwords never stored in plain text)
- UUID primary keys prevent enumeration attacks
- Proper foreign key constraints maintain data integrity
- Role-based access control through user roles

### Business Logic Enforcement
- Booking dates must be logical (start < end, future dates)
- Reviews limited to 1-5 star ratings
- Users cannot message themselves
- Proper status enums prevent invalid states

### Performance Considerations
- Strategic indexing for common queries
- Views for complex joins
- Optimized for read-heavy workloads typical of booking platforms

## Database Compatibility
The schema is designed to be compatible with:
- MySQL 8.0+
- PostgreSQL 12+
- MariaDB 10.5+

### MySQL-Specific Features Used
- `CHAR(36)` for UUID storage
- `ENUM` data types
- `ON UPDATE CURRENT_TIMESTAMP`
- `UUID()` function for default values

### PostgreSQL Adaptation Notes
For PostgreSQL, make these changes:
- Replace `CHAR(36)` with `UUID` type
- Replace `UUID()` with `gen_random_uuid()`
- Replace `ENUM` with `CHECK` constraints or custom types
- Adjust timestamp functions as needed

## Views Created
1. `v_property_summary` - Property details with host information
2. `v_booking_details` - Complete booking information with related data

## Maintenance

### Regular Maintenance Tasks
1. **Index Analysis**: Monitor query performance and adjust indexes
2. **Constraint Validation**: Ensure all constraints are properly enforced
3. **Statistics Update**: Keep database statistics current for optimal query planning
4. **Backup Strategy**: Implement regular backup procedures

### Potential Enhancements
1. **Partitioning**: Consider date-based partitioning for large booking tables
2. **Full-Text Search**: Add full-text indexes for property descriptions
3. **Archival**: Implement archival strategy for old bookings
4. **Monitoring**: Add database monitoring and alerting

## Testing
Before deploying to production:
1. Run the schema script in a test environment
2. Verify all constraints work as expected
3. Test foreign key relationships
4. Validate data types and constraints
5. Performance test with sample data

## Support
For issues or questions about the database schema:
1. Check constraint definitions in the schema file
2. Review relationship diagrams in the ERD directory
3. Consult the normalization documentation
4. Test queries against the sample data

## Version History
- v1.0 - Initial schema creation with all core tables
- v1.1 - Added performance indexes and views
- v1.2 - Enhanced constraints and validation rules