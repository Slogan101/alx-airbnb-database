SELECT booking.user_id, COUNT(*) AS total_bookings FROM booking GROUP BY booking.user_id;

SELECT p.property_id, COUNT(b.booking_id) AS total_bookings,
RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank FROM property p LEFT JOIN booking b ON p.property_id = b.property_id GROUP BY p.property_id, ORDER BY booking_rank;

SELECT p.property_id, COUNT(b.booking_id) AS total_bookings,
ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p LEFT JOIN booking b ON p.property_id = b.property_id GROUP BY p.property_id, ORDER BY booking_rank;