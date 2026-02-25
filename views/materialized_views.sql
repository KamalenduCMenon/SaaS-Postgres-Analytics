CREATE MATERIALIZED VIEW mv_mrr AS
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS mrr
FROM payments
WHERE payment_status = 'success'
GROUP BY month
ORDER BY month;

CREATE MATERIALIZED VIEW mv_cumulative_revenue AS
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', payment_date)) AS cumulative_revenue
FROM payments
WHERE payment_status = 'success'
GROUP BY month
ORDER BY month;

CREATE MATERIALIZED VIEW mv_churn_rate AS
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

CREATE MATERIALIZED VIEW mv_top_ltv_users AS
SELECT
    u.user_id,
    u.email,
    SUM(p.amount) AS lifetime_value
FROM users u
JOIN subscriptions s ON u.user_id = s.user_id
JOIN payments p ON s.subscription_id = p.subscription_id
GROUP BY u.user_id, u.email
ORDER BY lifetime_value DESC
LIMIT 10;