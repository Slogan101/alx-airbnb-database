

## Tables Covered

- `users`
- `property`
- `booking`
- `payment`
- `review`
- `message`

## Overview

### Users
- Three sample users: a guest, a host, and an admin.
- Includes sample emails, phone numbers, roles, and placeholder password hashes.

### Properties
- Two properties listed by the host user.
- Includes name, description, location, and price per night.

### Bookings
- Two bookings made by the guest user for the two properties.
- Different booking statuses (`confirmed`, `pending`).

### Payments
- Payments corresponding to the bookings.
- Includes payment amounts and methods (credit card, PayPal).

### Reviews
- Guest reviews for both properties with ratings and comments.

### Messages
- Sample communication between guest and host around bookings.

## How to Use

1. Ensure your database schema is created according to the main schema script.
2. Run this sample data script using your SQL client or migration tool.
3. Verify data was inserted with SELECT queries or through your application.

## Notes

- UUIDs are hardcoded to maintain consistent foreign key relationships.
- Password hashes are placeholders; replace with actual hashed passwords for production.
- Dates and amounts are realistic examples and can be modified as needed.
- Feel free to add more sample data or adjust values to fit your testing requirements.

---

## Example Insert Commands

```sql

INSERT INTO users ...

INSERT INTO property ...

INSERT INTO booking ...

INSERT INTO payment ...

INSERT INTO review ...

INSERT INTO message ...
