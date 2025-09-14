1. Top 10 Properties by Number of Bookings
SELECT p.property_name,
       COUNT(b.booking_id) AS total_bookings
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
WHERE b.cancellation_flag = FALSE
GROUP BY p.property_name
ORDER BY total_bookings DESC
LIMIT 10;

2. Maximum Cancellations by Property
SELECT p.property_name,
       COUNT(b.booking_id) AS cancellations
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
WHERE b.cancellation_flag = TRUE
GROUP BY p.property_name
ORDER BY cancellations DESC
LIMIT 10;

3. Maximum Revenue by Property
SELECT p.property_name,
       SUM(b.price) AS total_revenue
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
WHERE b.cancellation_flag = FALSE
GROUP BY p.property_name
ORDER BY total_revenue DESC
LIMIT 10;

4. Revenue Trend by Month
SELECT c.year,
       c.month,
       SUM(b.price) AS monthly_revenue
FROM bookings_fact b
JOIN calendar_dim c ON b.booking_date_key = c.date_key
WHERE b.cancellation_flag = FALSE
GROUP BY c.year, c.month
ORDER BY c.year, c.month;

5. Top Hosts by Revenue
SELECT h.host_name,
       SUM(b.price) AS total_revenue
FROM bookings_fact b
JOIN hosts_dim h ON b.host_id = h.host_id
WHERE b.cancellation_flag = FALSE
GROUP BY h.host_name
ORDER BY total_revenue DESC
LIMIT 10;

6. Most Popular Locations
SELECT l.city_name,
       COUNT(b.booking_id) AS total_bookings
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
JOIN location_dim l ON p.city_id = l.city_id
WHERE b.cancellation_flag = FALSE
GROUP BY l.city_name
ORDER BY total_bookings DESC
LIMIT 10;

7. Average Rating by Property Type
SELECT pt.type_name,
       AVG(r.rating) AS avg_rating
FROM reviews_fact r
JOIN bookings_fact b ON r.booking_id = b.booking_id
JOIN properties_dim p ON b.property_id = p.property_id
JOIN property_type_dim pt ON p.property_type_id = pt.type_id
GROUP BY pt.type_name
ORDER BY avg_rating DESC;

8. Payment Method Distribution
SELECT pd.payment_method,
       COUNT(b.booking_id) AS total_bookings,
       SUM(b.price) AS total_revenue
FROM bookings_fact b
JOIN payments_dim pd ON b.payment_id = pd.payment_id
WHERE b.cancellation_flag = FALSE
GROUP BY pd.payment_method
ORDER BY total_revenue DESC;

9. Most Active Users
SELECT u.user_name,
       COUNT(b.booking_id) AS total_bookings
FROM bookings_fact b
JOIN users_dim u ON b.user_id = u.user_id
WHERE b.cancellation_flag = FALSE
GROUP BY u.user_name
ORDER BY total_bookings DESC
LIMIT 10;

10. Hosts with Highest Average Rating
SELECT h.host_name,
       AVG(r.rating) AS avg_rating
FROM reviews_fact r
JOIN bookings_fact b ON r.booking_id = b.booking_id
JOIN hosts_dim h ON b.host_id = h.host_id
GROUP BY h.host_name
ORDER BY avg_rating DESC
LIMIT 10;
