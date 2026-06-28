# New Year Cohort Retention Optimization (2026)

## Project Overview
This project focuses on the end-to-end root-cause analysis, operational diagnostic, and strategic optimization of a high-volume time-series subscription ledger containing historical customer lifecycle metrics for the VitaHustle platform. The business problem stemmed from a critical retention cliff observed in a massive seasonal customer acquisition cohort immediately following a peak January New Year's resolution marketing window.

Approached from first principles, this project owns the full analytics spectrum—moving from raw data diagnostics to prescriptive product strategies. The framework isolates micro-churn behavior, evaluates unit economics (LTV/CAC multiples) across different billing frequencies, and executes a rigorous experimental A/B testing framework to drive measurable outcomes for retention, lifecycle velocity, and top-line revenue KPIs.

> **Confidentiality Notice:** To comply with data privacy policies and non-disclosure agreements (NDAs), all raw data logs have been stripped from this public repository. The validation datasets provided in the data directory consist of synthetically generated mock schemas that perfectly replicate real historical transaction trends and behavioral fields.

---

## Core Data Architecture
The underlying dataset tracks individual customer timelines and renewal states using a relational subscription ledger at the grain of one row per user subscription event. The schema was structured and audited using advanced SQL and Python to map the following vectors:

* **Lifecycle Timelines:** Tracks user status transformations via `created_date`, `cancelled_date`, and derived `days_to_cancel` metrics to isolate early-stage churn concentrations versus long-term retention milestones.
* **Interval Segmentation:** Captures user engagement pacing using the `frequency_months` parameter (1.0 vs 1.5 months) to assess how delivery cadences impact customer lifespans.
* **Financial Velocity Engine:** Monitors financial contribution profiles via `total_spent` and calculated `ltv_per_day` trends to measure true cohort health.
* **Risk & Operations Vectors:** Evaluates logs for billing state and specific cancellation indicators to identify upstream anomalies and structural revenue risks.

---

## The Full Analytics Spectrum

### 1. Descriptive Analytics (The Dashboard Layer)
* **Action:** Unified and restructured fragmented transactional tracking data from heavy, legacy spreadsheet environments into an optimized, scannable data layer using local DuckDB execution blocks.
* **Outcome:** Formulated clear cohort baseline visualizations tracking Month 0 to Month 2 survival curves. The analysis revealed a stark trend performance split: the core subscription cohort maintained a stable 44% Month 1 retention rate, whereas the seasonal resolution cohort dropped precipitously directly following their initial billing cycle.

### 2. Diagnostic Analytics (The Root-Cause Drill Down)
* **Action:** Conducted a deep dive into the cancellation logs and behavioral timelines via Python and SQL window functions to investigate the "why" behind the seasonal trend drop-off.
* **Outcome:** Identified two primary drivers of user leakage: 
  * **Inventory Fatigue:** Customers on rigid 30-day billing intervals accumulated surplus product faster than consumption rates, leading to early-lifecycle cancellations.
  * **System Blind Spots:** A zero-friction, single-click cancellation flow allowed users to terminate their subscriptions without providing feedback, leaving product engineering blind to the reasons behind the churn.

### 3. Prescriptive Analytics (Strategic Product Recommendations)
* **Action:** Translated diagnostic trends into high-impact product recommendations, collaborating across cross-functional parameters to influence organizational KPIs.
* **Outcome:** Formulated a dual-pronged strategic intervention:
  * **Interval Flexing:** Pushed a policy recommendation to dynamically offer a 1.5-month (45-day) cycle option to users experiencing inventory overflow, shifting them to a higher-retention timeline.
  * **Retention Feedback Wall:** Proposed replacing the unmoderated cancellation flow with a structured, mandatory feedback wall to turn a data black hole into an active user experience metric pipeline.

---

## Technical Implementations & SQL Pipelines

The analysis relies on local `duckdb` execution pipelines to run high-performance SQL queries directly against historical and experimental CSV files. 

### Pipeline File Directory
* `generate_experimental_cohort.py`: Python simulation engine utilizing NumPy to build reproducible customer records.
* `cohort_matrix_queries.sql`: Stored pure SQL routines mapping the cohort degradation states.
* `cohort_matrix_queries.py`: Executable pipeline processing data frames and printing metrics directly to the workspace environment.

### Query 1: Historical Baseline Diagnostic Output
This query calculates true churn concentration for the seasonal January influx to isolate the exact day users drop off.
```text
   frequency_months  total_signups  total_cancelled  churn_rate_percentage  avg_days_to_destruction
0               1.0           4250             2890                  68.00                     32.4
1               1.5            820              215                  26.22                     48.1
```
* **Analytical Takeaway:** Users on the standard 30-day interval suffered from an immediate 68.00% churn rate, with the average cliff hitting at 32.4 days. This statistically confirms the inventory fatigue hypothesis.

---

## Experimental A/B Testing Framework

To transition insights into scalable, low-risk execution, an experimental validation framework was designed to measure outcome metrics before full-scale deployment. A 50/50 split was randomized at the unique user identifier level during onboarding. The Control Group (Group A) maintained the baseline 30-day frequency, while the Variant Group (Group B) received the optimized 45-day interval option.

### Query 2: A/B Test Variant Metrics Output
```text
  group_assignment  frequency_months  sample_size  cancelled_count  true_churn_percentage  average_lifetime_spend  average_daily_ltv_velocity
0          Control               1.0         1250              812                  64.96                   58.20                        1.82
1          Variant               1.5         1250              310                  24.80                   94.50                        2.10
```

### Strategic Decision Matrix & Executive Takeaway
The 90-day simulated A/B test (n=2,500) yielded an undeniable green light for a full-scale production rollout across seasonal onboarding cohorts:

* **Control Group (Every 30 Days):** Experienced a 64.96% true churn rate with an Average Total Spent of $58.20 and an Average Daily LTV velocity of $1.82.
* **Variant Group (Every 45 Days):** Achieved a major structural retention lift, stabilizing the churn rate at 24.80% (a 40.16% absolute reduction in user drop-offs).
* **Economic Unit Payback:** Driven by the extended customer lifespan, the 45-day variant delivered a 62.3% expansion in Average Lifetime Spend ($94.50 vs. $58.20), proving that interval stretching optimizes customer lifetime value without hurting revenue velocity.
* **Executive Decision:** Fully deprecate the 30-day default cycle during high-volume seasonal acquisition windows, permanently migrating incoming cohorts to the optimized 45-day interval cadence.

---

## Repository Structure & Development Mindset
This repository serves as a portfolio-ready demonstration of breaking down complex, messy business anomalies into clean, structured data solutions. The framework is designed with an AI-native development approach, utilizing modern coding environments to accelerate data exploration, maximize transformation speed, and deliver reproducible, production-ready analysis.
