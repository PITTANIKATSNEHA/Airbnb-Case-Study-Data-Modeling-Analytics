CREATE OR REPLACE VIEW vw_top_hosts AS
SELECT h.host_id, h.host_name,
       COUNT(b.booking_id) AS total_bookings,
       SUM(b.price) AS total_revenue
FROM bookings_fact b
JOIN hosts_dim h ON b.host_id = h.host_id
WHERE b.cancellation_flag = FALSE
GROUP BY h.host_id, h.host_name
ORDER BY total_revenue DESC;
