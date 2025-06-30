# ALX Airbnb Advanced Querying Project

## Overview

This project demonstrates advanced SQL skills using MySQL. It includes complex join operations, subqueries, window functions, indexing, query optimization, and table partitioning. The goal is to simulate performance tuning in a real-world Airbnb-style database.

## Project Structure

### Complex Queries with Joins

This task demonstrates three types of SQL joins:

1. **INNER JOIN**: Retrieves only matching records from both tables
2. **LEFT JOIN**: Retrieves all records from left table with matching right table records
3. **FULL OUTER JOIN**: Retrieves all records when there's a match in either table (simulated in MySQL)

### Subquery Practice

This task demonstrates:

1. **Non-correlated subquery**: Finds properties with average rating > 4.0
2. **Correlated subquery**: Finds users with more than 3 bookings

### Aggregations and Window Functions

This task demonstrates:

1. **GROUP BY**: Counts bookings per user
2. **Window functions**: Ranks properties by booking count

## Usage

To execute the project:

1. Ensure MySQL server is running.
2. Use the schema provided for Airbnb-style tables.
3. Run each SQL file in sequence based on the task.
4. Use `EXPLAIN` and `ANALYZE` (or `EXPLAIN FORMAT=JSON`) for performance testing.

## Requirements Met

- SQL joins and relationships
- Subqueries (correlated and non-correlated)
- Aggregations and window functions
- Index creation and performance testing
- Query optimization techniques
- Table partitioning strategy in MySQL

## Author

Wuor Bhang – ALX Software Engineering Program
