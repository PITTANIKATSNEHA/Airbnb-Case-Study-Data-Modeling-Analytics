-- Calendar Dimension
CREATE TABLE calendar_dim (
    date_key INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT,
    weekday VARCHAR(20)
);

-- Users
CREATE TABLE users_dim (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    user_since DATE,
    user_country VARCHAR(50),
    user_type VARCHAR(50)
);

-- Hosts
CREATE TABLE hosts_dim (
    host_id INT PRIMARY KEY,
    host_name VARCHAR(100),
    host_since DATE,
    host_response_rate DECIMAL(5,2),
    host_location VARCHAR(100)
);

-- Property Type
CREATE TABLE property_type_dim (
    type_id INT PRIMARY KEY,
    type_name VARCHAR(50)
);

-- Location
CREATE TABLE location_dim (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(50),
    population INT
);

-- Properties
CREATE TABLE properties_dim (
    property_id INT PRIMARY KEY,
    property_name VARCHAR(100),
    property_type_id INT,
    room_type VARCHAR(50),
    accommodates INT,
    city_id INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    FOREIGN KEY (property_type_id) REFERENCES property_type_dim(type_id),
    FOREIGN KEY (city_id) REFERENCES location_dim(city_id)
);

-- Payments
CREATE TABLE payments_dim (
    payment_id INT PRIMARY KEY,
    payment_method VARCHAR(50),
    provider VARCHAR(50),
    transaction_status VARCHAR(50)
);

-- Bookings Fact
CREATE TABLE bookings_fact (
    booking_id INT PRIMARY KEY,
    booking_date_key INT,
    user_id INT,
    host_id INT,
    property_id INT,
    price DECIMAL(10,2),
    currency VARCHAR(10),
    nights INT,
    cancellation_flag BOOLEAN,
    payment_id INT,
    booking_created_at TIMESTAMP,
    FOREIGN KEY (booking_date_key) REFERENCES calendar_dim(date_key),
    FOREIGN KEY (user_id) REFERENCES users_dim(user_id),
    FOREIGN KEY (host_id) REFERENCES hosts_dim(host_id),
    FOREIGN KEY (property_id) REFERENCES properties_dim(property_id),
    FOREIGN KEY (payment_id) REFERENCES payments_dim(payment_id)
);

-- Reviews Fact
CREATE TABLE reviews_fact (
    review_id INT PRIMARY KEY,
    booking_id INT,
    review_date_key INT,
    rating DECIMAL(3,2),
    comment TEXT,
    FOREIGN KEY (booking_id) REFERENCES bookings_fact(booking_id),
    FOREIGN KEY (review_date_key) REFERENCES calendar_dim(date_key)
);
