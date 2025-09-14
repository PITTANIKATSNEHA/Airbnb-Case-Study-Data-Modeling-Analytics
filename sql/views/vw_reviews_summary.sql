CREATE OR REPLACE VIEW vw_reviews_summary AS
SELECT l.city_name, AVG(r.rating) AS avg_rating, COUNT(r.review_id) AS review_count
FROM reviews_fact r
JOIN bookings_fact b ON r.booking_id = b.booking_id
JOIN properties_dim p ON b.property_id = p.property_id
JOIN location_dim l ON p.city_id = l.city_id
GROUP BY l.city_name;
