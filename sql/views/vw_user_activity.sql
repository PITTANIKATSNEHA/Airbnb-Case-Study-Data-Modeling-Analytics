CREATE OR REPLACE VIEW vw_user_activity AS
SELECT u.user_id, u.user_name,
       COUNT(b.booking_id) AS total_bookings,
       COUNT(r.review_id) AS total_reviews
FROM users_dim u
LEFT JOIN bookings_fact b ON u.user_id = b.user_id
LEFT JOIN reviews_fact r ON b.booking_id = r.booking_id
GROUP BY u.user_id, u.user_name;
