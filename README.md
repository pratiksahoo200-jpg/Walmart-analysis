# 🛒 Walmart Sales Analysis using SQL

## 📌 Project Overview

This project analyzes Walmart sales data using **MySQL 8** with advanced SQL techniques.

The objective is to extract meaningful business insights related to branch performance, product profitability, customer behavior, and revenue trends.

---

## 🛠 Tools & Technologies

- MySQL 8
- MySQL Workbench
- Microsoft Excel
- SQL (CTE & Window Functions)

---

## 📂 Dataset Information

**Database:** `walmart_project`  
**Table:** `walmartsalesdata`

The dataset contains transactional sales records including:

- Invoice ID
- Branch
- City
- Customer Type
- Product Line
- Payment Method
- Total Revenue
- Gross Income
- Date and Time
- Customer Rating

---

## 🎯 Business Questions Answered

1. Which branch generates the highest revenue?
2. What is the best-selling product line in each branch?
3. Which transactions are above the overall average order value?
4. What is the cumulative revenue growth over months?
5. What is the peak sales hour in each branch?
6. Rank product lines based on profitability.
7. Which payment method generates the highest average transaction value?
8. Who spends more within each city — Member or Normal customers?
9. Find top 3 highest revenue transactions in each branch.
10. Compare each branch revenue against overall average branch revenue.

---

## 🔎 SQL Concepts Used

- Common Table Expressions (CTE)
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Window Functions (OVER())
- CASE Statements
- Aggregate Functions (SUM, AVG, COUNT)
- Date Functions (YEAR, MONTH, HOUR)

---

## 📊 Key Insights

- Branch C generated the highest overall revenue.
- Food and Beverages was the most profitable product line.
- Cash transactions showed the highest average transaction value.
- Members generally spent slightly more than Normal customers.
- Revenue showed steady cumulative growth over months.
- Each branch has a distinct peak sales hour.

---

## 📁 Repository Structure

