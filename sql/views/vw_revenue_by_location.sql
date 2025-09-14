CREATE OR REPLACE VIEW vw_revenue_by_location AS
SELECT l.country, l.city_name,
       SUM(b.price) AS total_revenue,
       COUNT(b.booking_id) AS total_bookings
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
JOIN location_dim l ON p.city_id = l.city_id
WHERE b.cancellation_flag = FALSE
GROUP BY l.country, l.city_name;
