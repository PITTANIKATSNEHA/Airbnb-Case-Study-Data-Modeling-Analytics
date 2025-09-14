CREATE OR REPLACE VIEW vw_host_response_stats AS
SELECT h.host_id, h.host_name,
       h.host_response_rate,
       COUNT(b.booking_id) AS total_bookings
FROM hosts_dim h
LEFT JOIN bookings_fact b ON h.host_id = b.host_id
GROUP BY h.host_id, h.host_name, h.host_response_rate;
