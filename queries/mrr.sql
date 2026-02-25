SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS mrr
FROM payments
GROUP BY month
ORDER BY month;