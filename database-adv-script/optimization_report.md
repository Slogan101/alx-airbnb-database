EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,

    u.first_name,
    u.last_name,

    p.name AS property_name,
    p.location,

    pay.amount,
    pay.payment_method

FROM
    booking b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    property p ON b.property_id = p.property_id
LEFT JOIN
    payment pay ON pay.booking_id = b.booking_id;
