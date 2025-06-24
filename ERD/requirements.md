# ER Diagram Requirements

## Entities and Attributes

### 🧑‍💼 Users
- `id` (UUID, Primary Key)
- `first_name` (varchar)
- `last_name` (varchar)
- `email` (varchar)
- `password_hash` (varchar)
- `phone_number` (varchar)
- `role` (enum) — e.g. guest, host, admin
- `created_at` (timestamp)

### 🏠 Property
- `property_id` (UUID, Primary Key)
- `host_id` (Foreign Key → users.id)
- `name` (varchar)
- `description` (varchar)
- `location` (varchar)
- `pricepernight` (decimal)
- `created_at` (timestamp)
- `updated_at` (timestamp)

### 📅 Booking
- `booking_id` (UUID, Primary Key)
- `property_id` (Foreign Key → property.property_id)
- `user_id` (Foreign Key → users.id)
- `start_date` (datetime)
- `end_date` (datetime)
- `total_price` (decimal)
- `status` (enum) — e.g. pending, confirmed, canceled
- `created_at` (timestamp)
- `updated_at` (timestamp)

### 💳 Payment
- `payment_id` (UUID, Primary Key)
- `booking_id` (Foreign Key → booking.booking_id)
- `amount` (decimal)
- `payment_date` (timestamp)
- `payment_method` (enum) — e.g. credit_card, paypal, bank_transfer

### ⭐ Review
- `review_id` (UUID, Primary Key)
- `property_id` (Foreign Key → property.property_id)
- `user_id` (Foreign Key → users.id)
- `rating` (integer)
- `comment` (varchar)
- `created_at` (timestamp)

### 💬 Message
- `message_id` (UUID, Primary Key)
- `sender_id` (Foreign Key → users.id)
- `recipient_id` (Foreign Key → users.id)
- `message_body` (text)
- `sent_at` (timestamp)

---

## Relationships

- A **User** can host many **Properties** (`property.host_id → users.id`)
- A **User** can make many **Bookings** (`booking.user_id → users.id`)
- A **Property** can have many **Bookings** (`booking.property_id → property.property_id`)
- A **Booking** has one **Payment** (`payment.booking_id → booking.booking_id`)
- A **User** can leave many **Reviews** (`review.user_id → users.id`)
- A **Property** can have many **Reviews** (`review.property_id → property.property_id`)
- A **User** can send and receive **Messages** (`message.sender_id`, `message.recipient_id → users.id`)

---

## ER Diagram

![ER Diagram](https://drive.google.com/file/d/1r-uv2VqYndghcCMWTJg-dRUTDNfMW617/view?usp=sharing)


