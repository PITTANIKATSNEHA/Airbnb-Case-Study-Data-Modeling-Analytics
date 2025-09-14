CREATE OR REPLACE VIEW vw_payment_success_ratio AS
SELECT provider, transaction_status,
       COUNT(payment_id) AS txn_count
FROM payments_dim
GROUP BY provider, transaction_status;
