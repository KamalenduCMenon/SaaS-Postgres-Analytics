SELECT
    DATE_TRUNC('month', signup_date) AS month,
    COUNT(*) AS total_signups
FROM users
GROUP BY month
ORDER BY month;