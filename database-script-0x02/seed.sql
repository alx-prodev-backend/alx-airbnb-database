-- Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('uuid-1', 'John', 'Doe', 'john@example.com', 'hashed_pw1', '1234567890', 'guest'),
('uuid-2', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw2', '0987654321', 'host');

-- Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('prop-1', 'uuid-2', 'Seaside Villa', 'A peaceful villa by the sea.', 'Miami, FL', 250.00);

-- Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book-1', 'prop-1', 'uuid-1', '2025-08-01', '2025-08-05', 1000.00, 'confirmed');

-- Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
('pay-1', 'book-1', 1000.00, 'credit_card');

-- Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
('rev-1', 'prop-1', 'uuid-1', 5, 'Amazing experience!');

-- Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
('msg-1', 'uuid-1', 'uuid-2', 'Hello, is the villa available next week?');
