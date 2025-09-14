CREATE OR REPLACE VIEW vw_property_utilization AS
SELECT p.property_id, p.property_name,
       AVG(b.nights) AS avg_nights,
       p.accommodates
FROM bookings_fact b
JOIN properties_dim p ON b.property_id = p.property_id
WHERE b.cancellation_flag = FALSE
GROUP BY p.property_id, p.property_name, p.accommodates;
