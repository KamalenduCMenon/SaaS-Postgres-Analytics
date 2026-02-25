WITH cohort AS (
    SELECT
        user_id,
        DATE_TRUNC('month', signup_date) AS cohort_month
    FROM users
),
activity AS (
    SELECT
        s.user_id,
        DATE_TRUNC('month', p.payment_date) AS activity_month
    FROM subscriptions s
    JOIN payments p ON s.subscription_id = p.subscription_id
)
SELECT
    c.cohort_month,
    a.activity_month,
    COUNT(DISTINCT a.user_id) AS active_users
FROM cohort c
JOIN activity a ON c.user_id = a.user_id
GROUP BY c.cohort_month, a.activity_month
ORDER BY c.cohort_month;