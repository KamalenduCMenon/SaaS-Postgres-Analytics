SELECT
    u.user_id,
    SUM(p.amount) AS lifetime_value
FROM users u
JOIN subscriptions s ON u.user_id = s.user_id
JOIN payments p ON s.subscription_id = p.subscription_id
GROUP BY u.user_id
ORDER BY lifetime_value DESC
LIMIT 10;