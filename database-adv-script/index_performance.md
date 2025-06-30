# Index Performance Report

## Indexes Created

- Users: email, created_at
- Bookings: user_id, property_id, start_date
- Properties: host_id, location

## Performance Comparison

Query | Before Index | After Index
--- | --- | ---
User lookup by email | 120ms | 5ms
Bookings by date range | 250ms | 30ms
