🛒 Walmart Sales Analysis using SQL
📌 Project Overview

This project analyzes Walmart sales data using MySQL 8 with advanced SQL techniques such as:

Common Table Expressions (CTE)

Window Functions

Ranking Functions

Running Totals

Analytical Comparisons

The goal of this project is to extract meaningful business insights related to branch performance, product profitability, customer behavior, and revenue trends.

🛠 Tools & Technologies

MySQL 8

MySQL Workbench

Excel (for result visualization)

SQL (CTE + Window Functions)

📂 Dataset Information

Database: walmart_project
Table: walmartsalesdata

The dataset contains transactional sales records including:

Branch

City

Product line

Customer type

Payment method

Revenue (Total)

Gross income

Date and Time

Rating

🎯 Business Objectives

Identify the highest-performing branch by revenue.

Determine the best-selling product line in each branch.

Classify transactions as above or below average order value.

Analyze cumulative revenue growth over time.

Identify peak sales hours per branch.

Rank product lines by profitability.

Evaluate payment methods based on average transaction value.

Compare customer spending behavior within each city.

Identify top 3 highest revenue transactions per branch.

Compare branch revenue against overall branch average.

🔎 Key Analytical Questions & Insights
1️⃣ Which branch generates the highest revenue?

Branch C ranked first based on total revenue.

2️⃣ What is the best-selling product line in each branch?

Each branch has a different top-performing product category based on revenue contribution.

3️⃣ Which transactions are above average order value?

Transactions were classified using a CASE statement and overall average comparison.

4️⃣ What is the cumulative revenue growth?

Running total analysis shows steady revenue growth across months.

5️⃣ What is the peak sales hour in each branch?

Each branch has a distinct peak hour contributing the highest revenue.

6️⃣ Which product line is most profitable?

Food and Beverages ranked highest based on total gross income.

7️⃣ Which payment method generates highest average transaction value?

Cash transactions showed the highest average transaction value.

8️⃣ Who spends more within each city?

Members generally spend slightly more than Normal customers.

9️⃣ Top 3 highest revenue transactions per branch

Window functions were used to rank transactions per branch.

🔟 Branch revenue comparison with overall average

Branch C performs above the overall branch revenue average, while others fall slightly below.
