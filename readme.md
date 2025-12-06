🚀 Supply Chain Service Reliability & Customer Fulfillment Overhaul

A comprehensive analysis of a critical collapse in customer service (OTIF - On-Time, In-Full) and the delivery of a quantified, two-part strategy for immediate stabilization.

The Business Problem: Total Service Failure (OTIF %) plummeted to $\mathbf{29.02\%}$, a $\mathbf{36\%}$ deviation from the target.

The Key Finding: The failure is structural: Inventory Control is failing ($\mathbf{65.96\%}$ LIFR), while Warehouse Capacity is sufficient ($\mathbf{96.59\%}$ VOFR). The problem is a Planning failure.

🧭 Project Index (Functional Clickable Navigation)

🎯 Problem & Objectives

💾 Data Sources & ETL Process

🥇 Dashboard 1: Executive Insights

🥈 Dashboard 2: Root Cause & Action

🛠 Prioritized Recommendations

📁 Repository Structure

📧 Author & Contact

<a id="1-problem--objectives"></a>

1. 🎯 Problem & Objectives

The Problem

Total Service Failure (OTIF %) stands at $\mathbf{29.02\%}$, primarily driven by the Inventory Root Cause (IF %).

Core Objectives

Diagnosis: Define the precise point of failure (Inventory Control vs. Logistics Capacity).

Risk Quantification: Identify the Top 5 High-Risk Customers and the most affected Geographical Region.

Action Plan: Create a quantified strategy for the Top 5 SKUs and the largest logistical failure bucket ($\mathbf{8.3K}$ 1-Day delays).

<a id="2-data-sources--etl-process"></a>

2. 💾 Data Sources & ETL Process

📁 Input files located under: C2 Input for participants/

🛠 ETL Logic Contribution

The primary analytical contribution was the creation of diagnostic metrics to decouple inventory control from bulk capacity:

Metric

Definition

Status/Insight

Volume Fill Rate (VOFR %)

Measures if the warehouse had enough total capacity.

High VOFR ($\mathbf{96.59\%}$) = Capacity is sufficient.

Line-Item Fill Rate (LIFR %)

Measures how often an SKU is stocked out.

Low LIFR ($\mathbf{65.96\%}$) = Inventory Control Problem. (Root Cause)

SQL logic available in: supply_chain.sql

<a id="3-dashboard-1-executive-insights"></a>

3. 🥇 Dashboard 1 — Executive Insights (Risk Assessment)

📊 Answers: Who is impacted? Where is the failure concentrated?

3.1 Critical Service Trend Failure

Insight: The service collapse began sharply in Quarter 2, confirming a structural failure in planning parameters that requires immediate correction.

3.2 Commercial Priority and Churn Risk

Insight: Failure is concentrated. Logic Stores and Expert Mart are the top commercial priorities and require urgent Sales intervention.

3.3 Geographical Risk Breakdown

Insight: The service gap against target is most acute in Ahmedabad, prioritized for operational stabilization efforts.

📷 Dashboard Preview

<a id="4-dashboard-2-root-cause--action"></a>

4. 🥈 Dashboard 2 — Root Cause & Action Plan

4.1 Proof of Failure—Control vs. Capacity

Diagnostic Conclusion: The $\mathbf{100\%}$ planning failure is proven by High VOFR ($\mathbf{96.59\%}$) vs. Low LIFR ($\mathbf{65.96\%}$). The problem is inventory control.

4.2 SKU-Level Concentration & Inventory Priority List

Actionable Insight: Failure is driven by a small number of high-volume SKUs. The Top 5 SKUs must have their planning parameters immediately reviewed.

4.3 Logistics Tactical Fix (Quick Win)

Actionable Insight: The largest tactical failure point is the $\mathbf{8.3K}$ orders in the 1-Day Delays bucket. Focusing on this root cause offers the fastest incremental improvement to the overall OT % metric.

<a id="5-prioritized-recommendations"></a>

5. 🛠 Prioritized Recommendations

5.1 Structural Fix: Inventory & Supply Chain (Priority)

Action

Owner

Goal

Immediate Stock Review

Supply Planning Team

Correct planning parameters for the Top 5 failing SKUs.

LIFR % Stabilization

Head of Supply Chain

Increase Actual LIFR % from $\mathbf{65.96\%}$ to target $\approx 75\%$ (30 days).

Planning Audit

Analyst Team

Conduct a full audit of forecast, safety stock, and lead time inputs.

5.2 Tactical Fix: Commercial & Logistics

Action

Owner

Goal

Customer Engagement

Sales & Account Management

Contact Top 5 High-Risk Customers to outline the corrective plan.

Logistics Process Fix

Distribution Manager

Reduce the 1-Day Delays bucket by 50% (reducing $\mathbf{8.3K}$ delayed orders).

Geographical Focus

Operations Manager

Prioritize dispatch and route optimization efforts in Ahmedabad.

<a id="6-repository-structure"></a>

6. 📁 Repository Structure

The project structure is as follows:

supply-chain-fulfillment-overhaul/
├── C2 Input for participants/  (Original source data and business context files)
│   ├── dim_customers.csv
│   └── C2 Business Knowledge.pdf
├── images/                      (All dashboard exports used in the final report)
│   ├── Dashboard_1.png
│   ├── Insight 5.2 SKU-Level Concentration...png
│   └── Insight 5.4 Logistics Tactical Fix (Quick Win).png
├── Supply Chain Service Reliability...pbix (Power BI Source File)
├── Supply Chain Service Reliability...pdf  (Final Report Output)
└── supply_chain.sql             (SQL script used for ETL, metric calculation, and view creation)


<a id="7-author--contact"></a>

7. 📧 Author & Contact

This project was developed by:

Gagan C Holkar

Detail

Contact Information

Email ID

gagancholkar@gmail.com

LinkedIn

https://www.linkedin.com/in/gagan-holkar/
