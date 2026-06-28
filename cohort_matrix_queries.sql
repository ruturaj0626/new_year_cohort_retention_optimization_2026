-- ============================================================================
-- PROJECT VITALITY: COHORT RETENTION & EXPERIMENT EVALUATION QUERIES
-- Target File: data/koa_final_analysis_with_experiment.csv
-- ============================================================================

-- ============================================================================
-- QUERY 1: HISTORICAL COHORT BASELINE (JANUARY 2026 CLIFF DIAGNOSTIC)
-- Verified via DuckDB Engine
-- ============================================================================
SELECT 
    frequency_months,
    COUNT(subscription_id) AS total_signups,
    COUNT(CASE WHEN status = 'CANCELLED' THEN subscription_id END) AS total_cancelled,
    ROUND(COUNT(CASE WHEN status = 'CANCELLED' THEN subscription_id END) * 100.0 / COUNT(subscription_id), 2) AS churn_rate_percentage,
    ROUND(AVG(CASE WHEN status = 'CANCELLED' THEN days_to_cancel END), 1) AS avg_days_to_destruction
FROM subscriptions_master
WHERE create_year = 2026 AND create_month = 1
GROUP BY frequency_months
ORDER BY total_signups DESC;


-- QUERY 2: A/B TEST EXPERIMENT OUTCOME MATRIX
-- Objective: Evaluate Group A (30-Day Control) vs. Group B (45-Day Variant) metrics.
WITH experiment_base AS (
    SELECT 
        subscription_id,
        group_assignment, -- Maps to 'group' column from simulation script
        status,
        frequency,
        total_spent,
        ltv_per_day,
        days_to_cancel
    FROM subscriptions_master
    WHERE experiment_cohort = TRUE -- Filters for our simulated April 2026 cohort
)
SELECT 
    group_assignment,
    frequency,
    COUNT(subscription_id) AS sample_size,
    COUNT(CASE WHEN status = 'CANCELLED' THEN subscription_id END) AS cancelled_count,
    ROUND(COUNT(CASE WHEN status = 'CANCELLED' THEN subscription_id END) * 100.0 / COUNT(subscription_id), 2) AS true_churn_percentage,
    ROUND(AVG(total_spent), 2) AS average_lifetime_spend,
    ROUND(AVG(ltv_per_day), 2) AS average_daily_ltv_velocity
FROM experiment_base
GROUP BY group_assignment, frequency
ORDER BY group_assignment;