SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', payment_date)) AS cumulative_revenue
FROM payments
GROUP BY month
ORDER BY month;