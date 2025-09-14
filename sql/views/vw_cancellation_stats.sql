CREATE OR REPLACE VIEW vw_cancellation_stats AS
SELECT l.city_name, COUNT(*) AS total_bookings,
       SUM(CASE WHEN b.cancellation_flag THEN 1 ELSE 0 END) AS cancelled,
       ROUND(SUM(CASE WHEN b.cancellation_flag THEN 1 ELSE 0 END)::DECIMAL / COUNT(*) * 100, 2) AS cancel_rate_pct
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
JOIN location_dim l ON p.city_id = l.city_id
GROUP BY l.city_name;
