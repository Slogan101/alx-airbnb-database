


## Users Table

```user_id```: Used in JOINs → already PRIMARY KEY (automatically indexed).
```email```: Might be used in login/auth WHERE clause → already UNIQUE (automatically indexed).
```role```: Might be filtered in WHERE clauses.


## Property Table
```property_id```: Used in JOINs → already PRIMARY KEY (indexed).
```host_id``: Used in JOIN with users.
```location```: Likely used in search queries (WHERE).
```pricepernight```: Likely filtered or sorted (ORDER BY).


## Booking Table

```booking_id```: already PRIMARY KEY.
```user_id & property_id```: used in JOINs.
```status```: filtered in WHERE.
```start_date and end_date```: date range filters (e.g., availability).