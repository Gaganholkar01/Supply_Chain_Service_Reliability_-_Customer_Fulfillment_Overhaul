```markdown
# 🚀 Supply Chain Service Reliability & Customer Fulfillment Overhaul

This repository documents the end-to-end analysis of a critical collapse in a major company's customer service and order fulfillment metrics (OTIF - On-Time, In-Full).

**The Business Problem:** Total Service Failure (OTIF %) plummeted to **29.02%**—a **36%** deviation from the target—threatening high-risk customer churn and operational efficiency.

**The Key Finding:** By creating specialized diagnostic metrics (LIFR vs. VOFR), the analysis proved the failure was structural: Inventory Control was failing (**65.96%** LIFR), while Warehouse Capacity was sufficient (**96.59%** VOFR). The problem was a Planning failure, not a physical constraint.

**Core Achievement:** Delivered a quantified, two-part strategy targeting the Top 5 SKUs and high-risk commercial accounts, providing a clear path to recover fulfillment and stabilize service.

## 🧭 Project Index (Functional Clickable Navigation)
*   [🎯 Problem & Objectives](#1-problem--objectives)
*   [💾 Data Sources & ETL Process](#2-data-sources--etl-process)
*   [🥇 Dashboard 1: Executive Insights](#3-dashboard-1-executive-insights)
*   [🥈 Dashboard 2: Root Cause & Action](#4-dashboard-2-root-cause--action)
*   [🛠 Prioritized Recommendations](#5-prioritized-recommendations)
*   [📁 Repository Structure](#6-repository-structure)
*   [📧 Author & Contact](#7-author--contact)

<a id="1-problem--objectives"></a>
## 1. 🎯 Problem & Objectives

### The Problem
Total Service Failure (OTIF %) stands at **29.02%**, primarily driven by the Inventory Root Cause (IF %).

### Core Objectives
*   **Diagnosis:** Define the precise point of failure (Inventory Control vs. Logistics Capacity).
*   **Risk Quantification:** Identify the Top 5 High-Risk Customers and the most affected Geographical Region.
*   **Action Plan:** Create a quantified strategy for the Top 5 SKUs and the largest logistical failure bucket (**8.3K** 1-Day delays).

<a id="2-data-sources--etl-process"></a>
## 2. 💾 Data Sources & ETL Process

**📁 Input files located under:** `C2 Input for participants/`

### 🛠 ETL Logic Contribution
The primary analytical contribution was the creation of diagnostic metrics in SQL to decouple inventory control from bulk capacity:

| Metric | Definition | Status/Insight |
| :--- | :--- | :--- |
| **Volume Fill Rate (VOFR %)** | Measures if the warehouse had enough total capacity. | High VOFR (**96.59%**) = Capacity is sufficient. (No Issue) |
| **Line-Item Fill Rate (LIFR %)** | Measures how often an SKU is stocked out. | Low LIFR (**65.96%**) = Inventory Control Problem. (Root Cause) |

*SQL logic available in:* `supply_chain.sql`

<a id="3-dashboard-1-executive-insights"></a>
## 3. 🥇 Dashboard 1 — Executive Insights (Risk Assessment)
**📊 Answers:** Who is impacted? Where is the failure concentrated?

### 3.1 Critical Service Trend Failure
**Insight:** The service collapse began sharply in Quarter 2, confirming a structural failure in planning parameters that requires immediate correction.

### 3.2 Commercial Priority and Churn Risk
**Insight:** Failure is concentrated. Logic Stores and Expert Mart are the top commercial priorities and require urgent Sales intervention.

### 3.3 Geographical Risk Breakdown
**Insight:** The service gap against target is most acute in Ahmedabad, which is prioritized for operational stabilization efforts.

**📷 Dashboard Preview**
https://github.com/Gaganholkar01/Supply_Chain_Service_Reliability_-_Customer_Fulfillment_Overhaul/blob/master/images/Dashboard_1.png

<a id="4-dashboard-2-root-cause--action"></a>
## 4. 🥈 Dashboard 2 — Root Cause & Action Plan

### 4.1 Proof of Failure—Control vs. Capacity
**Diagnostic Conclusion:** The **100%** planning failure is proven by High VOFR (**96.59%**) vs. Low LIFR (**65.96%**). The problem is inventory control, not warehouse capacity.

### 4.2 SKU-Level Concentration & Inventory Priority List
**Actionable Insight:** Failure is driven by a small number of high-volume SKUs. The Top 5 SKUs must have their planning parameters immediately reviewed and corrected.

### 4.3 Logistics Tactical Fix (Quick Win)
**Actionable Insight:** The largest tactical failure point is the **8.3K** orders in the 1-Day Delays bucket. Focusing on this area offers the fastest incremental improvement to the overall OT % metric.

<a id="5-prioritized-recommendations"></a>
## 5. 🛠 Prioritized Recommendations

### 5.1 Structural Fix: Inventory & Supply Chain (Priority)
| Action | Owner | Goal |
| :--- | :--- | :--- |
| **Immediate Stock Review** | Supply Planning Team | Review and correct planning parameters for the Top 5 failing SKUs to eliminate stockouts. |
| **LIFR % Stabilization** | Head of Supply Chain | Increase Actual LIFR % from **65.96%** to a target of **≈ 75%** within the next 30 days. |
| **Planning Audit** | Analyst Team | Conduct a full audit of forecast, safety stock, and lead time inputs. |

### 5.2 Tactical Fix: Commercial & Logistics
| Action | Owner | Goal |
| :--- | :--- | :--- |
| **Customer Engagement** | Sales & Account Management | Immediately contact the Top 5 High-Risk Customers to acknowledge the failure and outline the corrective plan. |
| **Logistics Process Fix** | Distribution Manager | Implement changes to reduce the 1-Day Delays bucket by **50%** (reducing **8.3K** delayed orders). |
| **Geographical Focus** | Operations Manager | Prioritize dispatch and route optimization efforts in Ahmedabad. |

<a id="6-repository-structure"></a>
## 6. 📁 Repository Structure
This project follows a professional data analysis project structure:

```
supply-chain-fulfillment-overhaul/
├── C2 Input for participants/  (Source data and business context files)
│   ├── dim_customers.csv
│   └── C2 Business Knowledge.pdf
├── images/                      (All dashboard exports used in the final report)
│   ├── Dashboard_1.png
│   ├── Insight 5.2 SKU-Level Concentration...png
│   └── Insight 5.4 Logistics Tactical Fix (Quick Win).png
├── Supply Chain Service Reliability...pbix (Power BI Source File)
├── Supply Chain Service Reliability...pdf  (Final Report Output)
└── supply_chain.sql             (SQL script used for ETL, metric calculation, and view creation)
```

<a id="7-author--contact"></a>
## 7. 📧 Author & Contact
Thank you for reviewing this project.

| Detail | Contact Information |
| :--- | :--- |
| **Name** | Gagan C Holkar |
| **Email ID** | gagancholkar@gmail.com |
| **LinkedIn** | https://www.linkedin.com/in/gagan-holkar/ |
```
