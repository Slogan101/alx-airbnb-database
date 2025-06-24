# 🏠 Booking Platform Database Schema

This project defines a relational database schema for a property booking platform. It includes user management, property listings, bookings, payments, reviews, and messaging between users.

## 📚 Tables Overview

### 1. `users`
Stores basic user information.

| Column         | Type      | Description                          |
|----------------|-----------|--------------------------------------|
| user_id        | UUID      | Primary key, unique user ID          |
| first_name     | VARCHAR   | User's first name                    |
| last_name      | VARCHAR   | User's last name                     |
| email          | VARCHAR   | Unique user email                    |
| password_hash  | VARCHAR   | Encrypted user password              |
| phone_number   | VARCHAR   | Contact number                       |
| role           | VARCHAR   | One of: `guest`, `host`, `admin`     |
| created_at     | TIMESTAMP | Timestamp when the user was created  |

---

### 2. `property`
Stores listings for properties available for booking.

| Column         | Type      | Description                               |
|----------------|-----------|-------------------------------------------|
| property_id    | UUID      | Primary key, unique property ID            |
| host_id        | UUID      | Foreign key referencing `users(user_id)`  |
| name           | VARCHAR   | Name/title of the property                |
| description    | TEXT      | Description of the property               |
| location       | VARCHAR   | Location or address                       |
| pricepernight  | DECIMAL   | Nightly price                             |
| created_at     | TIMESTAMP | Created timestamp                         |
| updated_at     | TIMESTAMP | Updated timestamp                         |


---

### 3. `booking`
Stores individual bookings for properties.

| Column       | Type      | Description                                     |
|--------------|-----------|-------------------------------------------------|
| booking_id   | UUID      | Primary key                                     |
| property_id  | UUID      | Foreign key referencing `property(property_id)` |
| user_id      | UUID      | Foreign key referencing `users(user_id)`        |
| start_date   | DATE      | Check-in date                                   |
| end_date     | DATE      | Check-out date                                  |
| total_price  | DECIMAL   | Total cost of the booking                       |
| status       | TEXT      | One of: `pending`, `confirmed`, `canceled`      |
| created_at   | TIMESTAMP | Booking creation time                           |

---

### 4. `payment`
Stores payment records for bookings.

| Column         | Type      | Description                                 |
|----------------|-----------|---------------------------------------------|
| payment_id     | UUID      | Primary key                                 |
| booking_id     | UUID      | Foreign key referencing `booking(booking_id)`|
| amount         | DECIMAL   | Payment amount                              |
| payment_date   | TIMESTAMP | Date of payment                             |
| payment_method | VARCHAR   | One of: `credit_card`, `paypal`, `stripe`   |

---

### 5. `review`
Stores user reviews for properties.

| Column      | Type      | Description                                     |
|-------------|-----------|-------------------------------------------------|
| review_id   | UUID      | Primary key                                     |
| property_id | UUID      | Foreign key referencing `property(property_id)` |
| user_id     | UUID      | Foreign key referencing `users(user_id)`        |
| rating      | INTEGER   | Rating from 1 to 5                              |
| comment     | TEXT      | User comment                                    |
| created_at  | TIMESTAMP | Timestamp of review                             |

---

### 6. `message`
Stores direct messages between users.

| Column        | Type      | Description                               |
|---------------|-----------|-------------------------------------------|
| message_id    | UUID      | Primary key                               |
| sender_id     | UUID      | Foreign key referencing `users(user_id)`  |
| recipient_id  | UUID      | Foreign key referencing `users(user_id)`  |
| message_body  | TEXT      | Message content                           |
| sent_at       | TIMESTAMP | When the message was sent                 |

---

## 🧩 Indexes

The following indexes are created to improve query performance:

```sql
CREATE INDEX idx_message_id ON message(message_id);
CREATE INDEX idx_review_id ON review(review_id);
CREATE INDEX idx_booking_id ON booking(booking_id);
CREATE INDEX idx_payment_id ON payment(payment_id);
