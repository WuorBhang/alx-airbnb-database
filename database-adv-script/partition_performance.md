# Partitioning Performance Report

## Implementation

- Partitioned by year on start_date column
- 5 partitions created (2020-2023 + future)

## Results

Query | Before | After
--- | --- | ---
Date range query (2022 only) | 320ms | 45ms
