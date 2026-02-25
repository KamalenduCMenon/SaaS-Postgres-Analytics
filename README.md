# SaaS Analytics Project

This project demonstrates building a **PostgreSQL-based analytics system** for a SaaS platform, including **materialized views**, **analytics queries**, and **Python visualization dashboards**.  

It is designed to showcase SQL, database design, analytics, and data visualization skills.

---

## Project Structure
saas-postgres-analytics/
│
├── schema/ # Table creation and database reset scripts
├── data/ # Seed data scripts
├── queries/ # Advanced analytics queries
├── views/ # Materialized views for dashboard metrics
├── dashboard/ # Python notebook and generated charts
├── .gitignore
└── README.md

---

## Features

- PostgreSQL schema for **users, subscriptions, plans, payments**
- **Materialized views** for:
  - Monthly Recurring Revenue (MRR)
  - Cumulative Revenue
  - Monthly Churn Rate
  - Top 10 Lifetime Value Users
- **Python + Jupyter Notebook** for visualization
- Charts generated:
  - `mrr_chart.png`
  - `churn_chart.png`
  - `top_ltv_chart.png`

---

## Requirements

- Python 3.10+  
- PostgreSQL 14+  
- Python libraries:
  - `psycopg2-binary`
  - `pandas`
  - `matplotlib`
  - `seaborn`
  - `jupyter`

Install dependencies:

```bash
pip install psycopg2-binary pandas matplotlib seaborn jupyter
