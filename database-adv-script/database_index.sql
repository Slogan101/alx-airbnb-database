-- user table
CREATE INDEX idx_users_role ON users(role);


-- Property table
CREATE INDEX idx_property_host_id ON property(host_id);
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_pricepernight ON property(pricepernight);


-- booking Table
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_status ON booking(status);
CREATE INDEX idx_booking_dates ON booking(start_date, end_date);
