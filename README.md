# 🧠 Sales Data Analysis & BI Dashboard Project

This project provides a **comprehensive analysis** of a large e-commerce sales dataset.  
The workflow is divided into **three main parts**:  
1. **Data Cleaning & Exploratory Data Analysis (EDA)** in Python  
2. **Advanced Querying** in SQL  
3. **Interactive BI Dashboard** in Power BI  

---

## 📑 Table of Contents
- [Project Overview](#project-overview)  
- [Dataset](#dataset)  
- [Tools and Technologies](#tools-and-technologies)  
- [Project Tasks](#project-tasks)  
  - [Part 1: Python Data Cleaning & EDA](#part-1-python-data-cleaning--exploratory-data-analysis)  
  - [Part 2: SQL Analysis](#part-2-sql-analysis)  
  - [Part 3: Power BI Dashboard](#part-3-power-bi-dashboard)  
- [Key Insights & Visualizations](#key-insights--visualizations)  
- [File Structure](#file-structure)  
- [How to Run](#how-to-run)  
  - [Prerequisites](#prerequisites)  
  - [Instructions](#instructions)  

---

## 🧩 Project Overview
The goal is to take a **raw, messy e-commerce dataset** and transform it into a clean, analysis-ready format.  
Using **Python, SQL, and Power BI**, the project uncovers insights on **sales performance, customer behavior, and product trends**.

---

## 🗃️ Dataset
**Source:** A major e-commerce platform in Pakistan  
**Original Size:** 1M+ rows, 26 columns  
**Issues Found:**
- 460K+ null or "ghost" records  
- Wrong data types (dates as strings, IDs as floats)  
- Placeholder nulls (`\N`, `#REF!`)  
- Redundant columns  

✅ **Final Cleaned Dataset:** 584,481 rows, fully validated and analysis-ready.

---

## ⚙️ Tools and Technologies
| Purpose | Tools |
|----------|-------|
| **Data Cleaning & Analysis** | Python (Pandas, NumPy, Matplotlib, Seaborn, Plotly) |
| **Database Management** | SQL (PostgreSQL / SQLite / SQL Server) |
| **Business Intelligence** | Microsoft Power BI |
| **Environment** | Jupyter Notebook |

---

## 🧠 Project Tasks

### 🐍 Part 1: Python Data Cleaning & Exploratory Data Analysis
**Objectives:** Clean raw data, handle inconsistencies, and generate insights.

#### 🔧 Data Cleaning Steps
- **Missing Data:** Removed 460K+ null rows  
- **Data Types:** Converted columns to correct formats  
- **Standardization:** Unified column names, removed whitespace  
- **Value Imputation:** Replaced placeholders (`\N`, `#REF!`)  
- **Outlier Treatment:** Used 99th percentile capping  

#### 🧮 Feature Engineering
Created 6 new features:
1. `Revenue_Before_Discount`
2. `Has_Discount`
3. `Customer_Type` (New / Returning)
4. `Customer_Tenure_Days`
5. `Order_Day_of_Week`
6. `Order_Quarter`

#### 📊 Insights & EDA
Generated **10 interactive insights** using Plotly (see [Key Insights](#key-insights--visualizations)).

---

### 🧾 Part 2: SQL Analysis
The cleaned dataset was loaded into SQL for deeper querying.

#### 🔍 Example Queries
1. Total yearly sales ordered from newest to oldest.  
2. Avg. discount per payment method (with >100 transactions).  
3. Top 5 product categories by quantity.  
4. Orders above avg. grand_total.  
5. First & latest order per customer.  
6. Rank orders by total per category using `RANK()`.  
7. Monthly total sales (for 2018).  
8. Orders with above-average discount.  
9. Customers (joined <2023, >5 orders).  
10. Rank payment methods by total sales using `DENSE_RANK()`.

---

### 📈 Part 3: Power BI Dashboard
An **interactive dashboard** built on the SQL dataset to visualize business KPIs.

#### 🎯 KPI Cards
- Total Revenue: **₨ 4.49B**  
- Total Orders: **584.5K**  
- Unique Customers: **115.3K**  
- Avg. Order Value: **₨ 7.69K**

#### 📊 Visuals
- Top 5 Payment Methods (Donut)
- Discounts vs. Avg Order Value (Bar)
- Monthly Sales Trend (Line)
- Sales by Category (Bar)
- Category Performance Summary (Matrix)
- Filters: Year, Month, Category

---

## 💡 Key Insights & Visualizations
1. **Seasonal Peak:** Huge revenue spike every **November** (Black Friday effect).  
2. **Top Category:** *Mobiles & Tablets* lead with over **₨2B revenue**.  
3. **Customer Value:** *New customers* drive most revenue.  
4. **Peak Day:** *Friday* = highest orders.  
5. **Cancellations:** ~34.7% of orders canceled.  
6. **Payment Popularity:** *Cash on Delivery* dominates.  
7. **Discount Impact:** Higher AOV for discounted orders.  
8. **Loyalty Growth:** Returning customers increasing over time.  
9. **Category Spike:** Friday surge mainly from *Mobiles & Tablets*.  
10. **Tenure Effect:** New customers spend high initially; returning ones stable.

---

## 🧰 How to Run

### 🔧 Prerequisites
- Python 3.x  
- Jupyter Notebook / JupyterLab  
- Power BI Desktop  
- SQL Database (PostgreSQL, SQL Server, or SQLite)  
- Python Libraries: `pandas`, `numpy`, `matplotlib`, `seaborn`, `plotly`, `openpyxl`

---

### 🚀 Instructions

#### **1️⃣ Python Analysis & Data Cleaning**
```bash
# Clone repository
git clone <repo_url>

# Install dependencies
pip install pandas numpy matplotlib seaborn plotly openpyxl

# Run notebook
jupyter notebook "Main EDA File.ipynb"
