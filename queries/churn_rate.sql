WITH monthly_churn AS (
    SELECT
        DATE_TRUNC('month', start_date) AS month,
        COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled,
        COUNT(*) AS total
    FROM subscriptions
    GROUP BY month
)
SELECT
    month,
    cancelled,
    total,
    ROUND((cancelled::numeric / total) * 100, 2) AS churn_rate_percent
FROM monthly_churn
ORDER BY month;