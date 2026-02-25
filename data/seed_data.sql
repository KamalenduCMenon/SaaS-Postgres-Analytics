-- Insert plans
INSERT INTO plans (plan_name, monthly_price)
VALUES 
('Basic', 19.99),
('Pro', 49.99),
('Enterprise', 99.99);

-- Insert 500 users
INSERT INTO users (email, country, signup_date)
SELECT 
    'user' || gs || '@email.com',
    CASE 
        WHEN random() < 0.5 THEN 'Canada'
        ELSE 'USA'
    END,
    CURRENT_DATE - (random() * 365)::INT
FROM generate_series(1,500) AS gs;

-- Insert subscriptions
INSERT INTO subscriptions (user_id, plan_id, start_date, status)
SELECT 
    user_id,
    (random()*2 + 1)::INT,
    signup_date,
    CASE 
        WHEN random() < 0.2 THEN 'cancelled'
        ELSE 'active'
    END
FROM users;

-- Insert payments (1 per month for active subs)
INSERT INTO payments (subscription_id, amount, payment_date, payment_status)
SELECT 
    s.subscription_id,
    p.monthly_price,
    s.start_date + (interval '1 month' * gs),
    'success'
FROM subscriptions s
JOIN plans p ON s.plan_id = p.plan_id
JOIN generate_series(0,11) AS gs ON true
WHERE s.status = 'active';