SELECT * FROM booking INNER JOIN users ON booking.user_id = users.user_id;

SELECT * FROM property LEFT JOIN reviews ON property.property_id = review.property_id;

SELECT * FROM users FULL OUTER JOIN booking ON users.user_id = booking.user_id;