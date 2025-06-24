
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_password_1', '123-456-7890', 'guest', CURRENT_TIMESTAMP),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_password_2', '234-567-8901', 'host', CURRENT_TIMESTAMP),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Davis', 'carol@example.com', 'hashed_password_3', '345-678-9012', 'admin', CURRENT_TIMESTAMP);


INSERT INTO property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'A small, cozy cottage in the countryside.', '123 Country Rd, Springfield', 75.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Modern Apartment', 'Modern apartment downtown with great amenities.', '456 City St, Metropolis', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('aaaaaaaa-1111-1111-1111-aaaaaaaa1111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-07-01', '2025-07-07', 525.00, 'confirmed', CURRENT_TIMESTAMP),
('bbbbbbbb-2222-2222-2222-bbbbbbbb2222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', '2025-08-15', '2025-08-20', 600.00, 'pending', CURRENT_TIMESTAMP);


INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pppppppp-0000-0000-0000-pppppppp0000', 'aaaaaaaa-1111-1111-1111-aaaaaaaa1111', 525.00, CURRENT_TIMESTAMP, 'credit_card'),
('qqqqqqqq-0000-0000-0000-qqqqqqqq0000', 'bbbbbbbb-2222-2222-2222-bbbbbbbb2222', 600.00, CURRENT_TIMESTAMP, 'paypal');


INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rrrrrrrr-1234-1234-1234-rrrrrrrr1234', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Lovely stay, very cozy and quiet!', CURRENT_TIMESTAMP),
('ssssssss-5678-5678-5678-ssssssss5678', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 4, 'Great location but a bit noisy at night.', CURRENT_TIMESTAMP);


INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('mmmmmmmm-1111-2222-3333-mmmmmmmm1111', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I would like to book your cottage from July 1st.', CURRENT_TIMESTAMP),
('mmmmmmmm-4444-5555-6666-mmmmmmmm2222', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, your booking is confirmed! Looking forward to hosting you.', CURRENT_TIMESTAMP);
