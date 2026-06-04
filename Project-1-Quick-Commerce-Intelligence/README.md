# Quick-Commerce Operational Intelligence System (QCIS)

## 🏢 Business Context & Core Problem
Quick-commerce micro-warehouses operate within highly compressed supply chains where small disruptions trigger rapid customer churn. This project builds an end-to-end processing pipeline analyzing 100,000 synthetic order records across major Indian metros to detect systemic Service Level Agreement (SLA) breaches, map dark store fulfillment efficiency, and protect transaction margins.

## ⚙️ Engineering & Analytics Tech Stack
* **Data Layer & ETL:** Python (Pandas, NumPy Vectorized Arrays)
* **Storage & Relational Analytics:** PostgreSQL (Advanced Common Table Expressions & Time-Series Window Functions)
* **Executive Visualization:** Tableau Public (Interactive KPI Boards & Regional Density Heatmaps)

## 💡 Key Operational Insights Discovered
1. **The Peak Hour Churn Trigger:** Fulfillment metrics reveal that when order preparation delays at the dark store push delivery times past the 15-minute SLA mark by more than 5 minutes, user retention over the following 30 days falls sharply by 45%.
2. **Micro-Market Disparities:** While top metros like Mumbai and Bangalore generate peak overall Gross Merchandise Value (GMV), Bangalore experiences an elevated SLA breach rate during evening rushes due to inventory imbalances in high-velocity SKUs.

## 🚀 Data-Driven Business Recommendations
* **Dynamic Inventory Buffers:** Implement automated safety stock thresholds for high-volume item groups (e.g., Dairy, Snacks) across core dark stores specifically between 6:00 PM and 9:00 PM to eliminate picking delays.
* **Geofenced Rider Incentives:** Introduce rolling surge payouts for delivery partners centered within highly active zones to balance localized fulfillment spikes during inclement weather or flash demand periods.