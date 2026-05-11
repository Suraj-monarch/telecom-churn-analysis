# 📊 Telecom Customer Churn Analysis

> An end-to-end Data Analytics project analyzing customer churn patterns, revenue loss, and high-risk segments in the telecom industry using **MySQL** and **Power BI**.

---

## 🔍 Problem Statement

Telecom companies lose significant revenue due to customer churn. This project identifies:
- **Why** customers churn
- **Which** customers are at highest risk
- **How much** revenue is being lost
- **What** service and contract patterns drive churn

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| MySQL | Database creation, data cleaning, views |
| Power BI | Interactive 3-page dashboard |
| DAX | Custom KPI measures & calculated columns |
| CSV | Raw dataset (6,418 records, 32 columns) |

---

## 📁 Folder Structure

```
telecom-churn-analysis/
│
├── data/
│   └── raw/
│       └── Customer_Data.csv
│
├── images/
│   ├── page1_summary.png
│   ├── page2_churn_analysis.png
│   └── page3_demographics.png
│
├── power bi/
│   ├── Churn Analysis.pbix
│   └── ChurnTheme_Fixed.json
│
├── sql/
│   ├── schema.sql
│   ├── data_cleaning.sql
│   └── views.sql
│
└── README.md
```

---

## 📊 Dashboard — 3 Pages

### Page 1 — Summary
KPI Cards: Total Customers · Churned · Stayed · New Joined · Churn Rate · Revenue Lost · High Risk Customers

Charts:
- Churn by Contract Type (Bar)
- Churn by Internet Type (Donut)
- Customer Status Split (Pie)
- Avg Monthly Charge by Contract (Column)
- Tenure Distribution — Churned vs Stayed (Line)

### Page 2 — Churn Analysis
Slicers: Contract · Internet Type · Gender · State

Charts:
- Top 10 Churn Reasons (Horizontal Bar)
- Churn by Category (Donut)
- Churn by Payment Method (Bar)
- Churn by Premium Support Yes/No (Bar)
- Churn by Online Security Yes/No (Bar)

### Page 3 — Demographics
Charts:
- Churn by Gender (Donut)
- Churn by Age Group (Column)
- Churn — Married vs Single (Bar)
- Top 10 States by Churn (Horizontal Bar)
- Churn by Number of Referrals (Column)
- Churn by Tenure Group — 0-12, 12-24, 24-36, 36+ Months (Column)

---

## 🧹 SQL Workflow

### 1. Schema Creation
```sql
CREATE DATABASE churn_db;
USE churn_db;
CREATE TABLE customer_data ( ... );
```

### 2. Data Cleaning
Handled NULL values using `IFNULL()` across 10+ columns and created a clean analytics-ready table.
```sql
CREATE TABLE cleaned_churn AS
SELECT
    IFNULL(Value_deal, 'None') AS Value_deal,
    IFNULL(Multiple_Lines, 'No') AS Multiple_Lines,
    IFNULL(Internet_Type, 'None') AS Internet_Type,
    IFNULL(Online_Security, 'No') AS Online_Security,
    IFNULL(Churn_Category, 'Others') AS Churn_Category,
    ...
FROM customer_data;
```

### 3. Analytical Views
```sql
-- Churned & Stayed customers only
CREATE VIEW vw_churn_data AS
SELECT * FROM cleaned_churn
WHERE Customer_Status IN ('Churned', 'Stayed');

-- Newly joined customers
CREATE VIEW vw_join_data AS
SELECT * FROM cleaned_churn
WHERE Customer_Status = 'Joined';
```

---

## 🧮 DAX Measures

```dax
Total Customers = COUNT('churn_db cleaned_churn'[Customer_ID])

Churned Customers =
CALCULATE(COUNT('churn_db cleaned_churn'[Customer_ID]),
'churn_db cleaned_churn'[Customer_Status] = "Churned")

Churn Rate = DIVIDE([Churned Customers], [Total Customers])

Revenue Lost =
CALCULATE(SUM('churn_db cleaned_churn'[Monthly_Charge]),
'churn_db cleaned_churn'[Customer_Status] = "Churned")

High Risk Customers =
CALCULATE(COUNT('churn_db cleaned_churn'[Customer_ID]),
'churn_db cleaned_churn'[Contract] = "Month-to-Month",
'churn_db cleaned_churn'[Online_Security] = "No",
'churn_db cleaned_churn'[Premium_Support] = "No")

MTM Churn % =
DIVIDE(
  CALCULATE(COUNT('churn_db cleaned_churn'[Customer_ID]),
  'churn_db cleaned_churn'[Customer_Status] = "Churned",
  'churn_db cleaned_churn'[Contract] = "Month-to-Month"),
  [Churned Customers])
```

---

## 💡 Key Insights

- **26.99% churn rate** — more than 1 in 4 customers are leaving
- **$126.61K+ monthly revenue** at risk from churned customers
- **Month-to-Month contracts** account for the majority of churn
- **Fiber Optic users** churn the most despite paying higher charges
- **Competitor offers** are the #1 churn reason at 43.94%
- Customers with **no Online Security and no Premium Support** are highest risk
- **0–12 month tenure** group shows the highest churn volume

---

## 🎯 Business Impact

This dashboard enables businesses to:
- Identify high-risk customers before they leave
- Prioritize retention efforts by contract type and service usage
- Quantify revenue loss from churn
- Understand root causes of dissatisfaction
- Optimize service offerings to improve loyalty

---

## 🚀 How to Run

### SQL Setup
1. Run `schema.sql` to create the database and table
2. Import `Customer_Data.csv` into `customer_data` table
3. Run `data_cleaning.sql` to create `cleaned_churn` table
4. Run `views.sql` to create analytical views

### Power BI
1. Open `Churn Analysis.pbix`
2. Update MySQL connection if needed (Server: localhost, DB: churn_db)
3. Click **Refresh** to load data
4. Explore all 3 dashboard pages

---

## 📸 Dashboard Preview

### Page 1 — Summary
<img width="1541" height="857" alt="Screenshot 2026-05-11 094315" src="https://github.com/user-attachments/assets/5232e0fe-90fe-4285-9472-6b353cb457e0" />


### Page 2 — Churn Analysis
<img width="1536" height="859" alt="Screenshot 2026-05-11 094541" src="https://github.com/user-attachments/assets/5f89b3b6-3507-4e2f-8dd2-b879046dbc18" />


### Page 3 — Demographics
<img width="1546" height="864" alt="Screenshot 2026-05-11 094759" src="https://github.com/user-attachments/assets/0934b222-5c91-421e-86db-50ea8738da75" />


---

## 🧠 Skills Demonstrated

`SQL` · `Data Cleaning` · `MySQL` · `Power BI` · `DAX` · `Data Modeling` · `KPI Development` · `Dashboard Design` · `Business Intelligence` · `Customer Analytics` · `Data Visualization`
