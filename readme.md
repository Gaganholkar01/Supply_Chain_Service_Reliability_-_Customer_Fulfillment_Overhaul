```markdown
# 🚀 Supply Chain Service Reliability & Customer Fulfillment Overhaul

This repository documents the end-to-end analysis of a critical collapse in a major company's customer service and order fulfillment metrics (OTIF - On-Time, In-Full).

**The Business Problem:** Total Service Failure (OTIF %) plummeted to **29.02%**—a **36%** deviation from the target—threatening high-risk customer churn and operational efficiency.

**The Key Finding:** By creating specialized diagnostic metrics (LIFR vs. VOFR), the analysis proved the failure was structural: Inventory Control was failing (**65.96%** LIFR), while Warehouse Capacity was sufficient (**96.59%** VOFR). The problem was a Planning failure, not a physical constraint.

**Core Achievement:** Delivered a quantified, two-part strategy targeting the Top 5 SKUs and high-risk commercial accounts, providing a clear path to recover fulfillment and stabilize service.

## 🧭 Project Index
*   [🎯 Problem & Objectives](#problem--objectives)
*   [💾 Data Sources & ETL Process](#data-sources--etl-process)
*   [🥇 Dashboard 1: Executive Insights](#dashboard-1-executive-insights)
*   [🥈 Dashboard 2: Root Cause & Action](#dashboard-2-root-cause--action)
*   [🛠 Prioritized Recommendations](#prioritized-recommendations)
*   [📁 Repository Structure](#repository-structure)
*   [📧 Author & Contact](#author--contact)

---

## 🎯 Problem & Objectives

### The Problem
Total Service Failure (OTIF %) stands at **29.02%**, primarily driven by the Inventory Root Cause (IF %).

### Core Objectives
*   **Diagnosis:** Define the precise point of failure (Inventory Control vs. Logistics Capacity).
*   **Risk Quantification:** Identify the Top 5 High-Risk Customers and the most affected Geographical Region.
*   **Action Plan:** Create a quantified strategy for the Top 5 SKUs and the largest logistical failure bucket (**8.3K** 1-Day delays).

---

## 💾 Data Sources & ETL Process

**📁 Input files located under:** `C2 Input for participants/`

### 🛠 ETL Logic Contribution
The primary analytical contribution was the creation of diagnostic metrics in SQL to decouple inventory control from bulk capacity:

| Metric | Definition | Status/Insight |
| :--- | :--- | :--- |
| **Volume Fill Rate (VOFR %)** | Measures if the warehouse had enough total capacity. | High VOFR (**96.59%**) = Capacity is sufficient. (No Issue) |
| **Line-Item Fill Rate (LIFR %)** | Measures how often an SKU is stocked out. | Low LIFR (**65.96%**) = Inventory Control Problem. (Root Cause) |

*SQL logic available in:* `supply_chain.sql`

---

## 🥇 Dashboard 1 — Executive Insights (Risk Assessment)

**📊 Answers:** Who is impacted? Where is the failure concentrated?

### Critical Service Trend Failure
**Insight:** The service collapse began sharply in Quarter 2, confirming a structural failure in planning parameters that requires immediate correction.

### Commercial Priority and Churn Risk
**Insight:** Failure is concentrated. Logic Stores and Expert Mart are the top commercial priorities and require urgent Sales intervention.

### Geographical Risk Breakdown
**Insight:** The service gap against target is most acute in Ahmedabad, which is prioritized for operational stabilization efforts.

**📷 Dashboard Preview**
![Dashboard 1 Preview](https://github.com/Gaganholkar01/Supply_Chain_Service_Reliability_-_Customer_Fulfillment_Overhaul/blob/master/images/Dashboard_1.png)

---

## 🥈 Dashboard 2 — Root Cause & Action Plan

### Proof of Failure—Control vs. Capacity
**Diagnostic Conclusion:** The **100%** planning failure is proven by High VOFR (**96.59%**) vs. Low LIFR (**65.96%**). The problem is inventory control, not warehouse capacity.

### SKU-Level Concentration & Inventory Priority List
**Actionable Insight:** Failure is driven by a small number of high-volume SKUs. The Top 5 SKUs must have their planning parameters immediately reviewed and corrected.

### Logistics Tactical Fix (Quick Win)
**Actionable Insight:** The largest tactical failure point is the **8.3K** orders in the 1-Day Delays bucket. Focusing on this area offers the fastest incremental improvement to the overall OT % metric.

**📷 Dashboard Preview**
![Dashboard 2 Preview](https://github.com/Gaganholkar01/Supply_Chain_Service_Reliability_-_Customer_Fulfillment_Overhaul/blob/master/images/Dashboard_2.png)

---

## 🛠 Prioritized Recommendations

### Structural Fix: Inventory & Supply Chain (Priority)
| Action | Owner | Goal |
| :--- | :--- | :--- |
| **Immediate Stock Review** | Supply Planning Team | Review and correct planning parameters for the Top 5 failing SKUs to eliminate stockouts. |
| **LIFR % Stabilization** | Head of Supply Chain | Increase Actual LIFR % from **65.96%** to a target of **≈ 75%** within the next 30 days. |
| **Planning Audit** | Analyst Team | Conduct a full audit of forecast, safety stock, and lead time inputs. |

### Tactical Fix: Commercial & Logistics
| Action | Owner | Goal |
| :--- | :--- | :--- |
| **Customer Engagement** | Sales & Account Management | Immediately contact the Top 5 High-Risk Customers to acknowledge the failure and outline the corrective plan. |
| **Logistics Process Fix** | Distribution Manager | Implement changes to reduce the 1-Day Delays bucket by **50%** (reducing **8.3K** delayed orders). |
| **Geographical Focus** | Operations Manager | Prioritize dispatch and route optimization efforts in Ahmedabad. |

---

## 📁 Repository Structure
This project follows a professional data analysis project structure:

```
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
```

---

## 📧 Author & Contact
Thank you for reviewing this project.

| Detail | Contact Information |
| :--- | :--- |
| **Name** | Gagan C Holkar |
| **Email ID** | gagancholkar@gmail.com |
| **LinkedIn** | https://www.linkedin.com/in/gagan-holkar/ |
```

**Key improvements made:**

1. **Removed all anchor IDs** (`<a id="..."></a>`) - GitHub automatically generates anchors from headers
2. **Used horizontal rules (`---`)** to visually separate sections instead of forced anchors
3. **Added your dashboard images** with proper markdown image syntax
4. **Simplified the Table of Contents** - removed "Functional Clickable Navigation" text
5. **Cleaner visual structure** with proper spacing between sections

GitHub's README preview will now:
- Show proper section headers (not `##` symbols)
- Display your dashboard images properly
- Allow clicking on Table of Contents links (GitHub auto-generates anchors from header text)
- Have better visual separation between sections

The table of contents links will work because GitHub automatically creates anchor links from header text (converting to lowercase, replacing spaces with hyphens, etc.).
