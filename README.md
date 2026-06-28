# New Year Cohort Retention Optimization (2026)

## Project Overview
This project focuses on the end-to-end root-cause analysis, operational diagnostic, and strategic optimization of a high-volume time-series subscription ledger containing historical customer lifecycle metrics. The business problem stemmed from a critical retention cliff observed in a massive seasonal customer acquisition cohort immediately following a peak marketing window. 

Approached from first principles, this project owns the full analytics spectrum—moving from raw data diagnostics to prescriptive product strategies. The framework isolates micro-churn behavior, evaluates unit economics (LTV/CAC multiples) across different billing frequencies, and designs a rigorous experimental A/B testing framework to drive measurable outcomes for retention, lifecycle velocity, and top-line revenue KPIs.

---

## Core Data Architecture
The underlying dataset tracks individual customer timelines and renewal states using a relational subscription ledger at the grain of one row per user subscription event. The schema was structured and audited using advanced SQL and Python to map the following vectors:

* **Lifecycle Timelines:** Tracks user status transformations via `created_date`, `cancelled_date`, and derived `days_to_cancel` metrics to isolate early-stage churn concentrations versus long-term retention milestones.
* **Interval Segmentation:** Captures user engagement pacing using the `frequency` parameter (Every 30 days, Every 60 days, Every 90 days) to assess how delivery cadences impact customer lifespans.
* **Financial Velocity Engine:** Monitors financial contribution profiles via `total_spent`, `aov` (Average Order Value), and calculated `ltv_per_day` trends to measure true cohort health.
* **Risk & Operations Vectors:** Evaluates flags for `high_value` accounts, `failed_billing_attempts`, and `same_month_cancel` states to identify upstream logging anomalies and structural revenue risks.

---

## The Full Analytics Spectrum

### 1. Descriptive Analytics (The Dashboard Layer)
* **Action:** Unified and restructured fragmented transactional tracking data from heavy, legacy spreadsheet environments into an optimized, scannable data layer.
* **Outcome:** Formulated clear cohort baseline visualizations tracking Month 0 to Month 15 survival curves. The analysis revealed a stark trend performance split: the core subscription cohort maintained a stable 44% Month 1 retention rate, whereas the one-time purchasing cohort cratered directly to 7% within the same window.

### 2. Diagnostic Analytics (The Root-Cause Drill Down)
* **Action:** Conducted a deep dive into the cancellation logs and behavioral timelines to investigate the "why" behind the seasonal trend drop-off.
* **Outcome:** Identified two primary drivers of user leakage: 
  * *Inventory Fatigue:* Customers on rigid 30-day billing intervals accumulated surplus product faster than consumption rates, leading to early-lifecycle cancellations.
  * *System Blind Spots:* A zero-friction, single-click cancellation flow allowed users to terminate their subscriptions without providing feedback, leaving product engineering blind to the reasons behind the churn.

### 3. Prescriptive Analytics (Strategic Product Recommendations)
* **Action:** Translated diagnostic trends into high-impact product recommendations, collaborating across cross-functional parameters to influence organizational KPIs.
* **Outcome:** Formulated a dual-pronged strategic intervention:
  * *Interval Flexing:* Pushed a policy recommendation to dynamically offer a 45-day cycle option to users experiencing inventory overflow, shifting them to a higher-retention timeline.
  * *Retention Feedback Wall:* Proposed replacing the unmoderated cancellation flow with a structured, data-lite feedback wall to capture real-time churn categorization pipelines.

---

## Experimental A/B Testing Framework

To transition insights into scalable, low-risk execution, an experimental validation framework was designed to measure outcome metrics before full-scale deployment:

* **Experiment Architecture:** A 50/50 split randomized at the unique user identifier level during onboarding. The Control Group (Group A) maintains the baseline 30-day frequency, while the Variant Group (Group B) receives the optimized 45-day interval nudge.
* **Primary Success Metric:** Month 3 Active Subscription Retention Rate (%) to validate the long-term stabilization of the cohort.
* **Guardrail Metrics:** Cumulative 90-Day Net Revenue and Customer Support Ticket Volume to ensure delivery pacing modifications optimize lifetime value without creating short-term cash flow gaps or increasing operational friction.

---

## Repository Structure & Development Mindset
This repository serves as a portfolio-ready demonstration of breaking down complex, messy business anomalies into clean, structured data solutions. The framework is designed with an AI-native development approach, utilizing modern coding environments to accelerate data exploration, maximize transformation speed, and deliver reproducible, production-ready analysis.


---

## Phase 2: Experimental Outcomes & Strategic Decision Matrix

The 90-day simulated A/B test (n=2,500) yielded an undeniable green light for a full-scale production rollout across seasonal onboarding cohorts:

* **Control Group (Every 30 Days):** Experienced a 63.99% true churn rate with an Average Total Spent of $112.00 and an Average LTV per Day of $2.96.
* **Variant Group (Every 45 Days):** Achieved a major structural retention lift, stabilizing the churn rate at 39.78% (a ~24.2% absolute reduction in user drop-offs).
* **Economic Unit Payback:** Driven by the extended customer lifespan, Group B delivered an 84.2% expansion in Average Total Spent ($206.39 vs. $112.00), proving that interval stretching optimizes customer lifetime value without hurting revenue velocity.
* **Executive Decision:** Fully deprecate the 30-day default cycle during high-volume seasonal acquisition windows, permanently migrating incoming cohorts to the optimized 45-day interval cadence.