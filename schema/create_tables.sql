
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT UNIQUE NOT NULL,
    country TEXT,
    signup_date DATE NOT NULL
);

CREATE TABLE plans (
    plan_id SERIAL PRIMARY KEY,
    plan_name TEXT NOT NULL,
    monthly_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE subscriptions (
    subscription_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(user_id),
    plan_id INT REFERENCES plans(plan_id),
    start_date DATE NOT NULL,
    end_date DATE,
    status TEXT CHECK (status IN ('active','cancelled','paused'))
);

CREATE TABLE payments (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subscription_id UUID REFERENCES subscriptions(subscription_id),
    amount NUMERIC(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_status TEXT CHECK (payment_status IN ('success','failed'))
);