/* ============================================================
   PROJECT DESCRIPTION:
   This project analyzes Walmart sales data to evaluate branch performance, product profitability, customer behavior and sales trends using advanced SQL techniques including:

   - CTE (Common Table Expressions)
   - Window Functions
   - Ranking Functions
   - Running Totals
   - Analytical Comparisons
   ------------------------------------------------------------
   BUSINESS OBJECTIVES:
   1. Identify top-performing branches
   2. Analyze product line profitability
   3. Understand customer purchasing behavior
   4. Detect peak sales patterns
   5. Evaluate revenue trends over time
   ============================================================ 
   QUESTIONS:

   Q1. Which branch generates the highest revenue?
   Q2. What is the best-selling product line in each branch?
   Q3. Which transactions are above the average order value?
   Q4. What is the cumulative monthly revenue growth?
   Q5. What is the peak sales hour per branch?
   Q6. Rank product lines based on total profit.
   Q7. Which payment method has the highest average transaction value?
   Q8. Who spends more within each city (Member vs Normal)?
   Q9. What are the top 3 highest transactions per branch?
   Q10. Compare each branch revenue against the average branch revenue.
   ============================================================ */

	
-- Q1. Which branch generates the highest revenue?

WITH branch_revenue AS (
    SELECT 
        Branch,
        SUM(Total) AS total_revenue
    FROM walmartsalesdata
    GROUP BY Branch
)

SELECT 
    Branch,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM branch_revenue;


-- Q2. What is the best-selling product line in each branch?
 
WITH product_sales AS (
    SELECT 
        Branch,
        `Product line`,
        SUM(Total) AS total_revenue
    FROM walmart_project.walmartsalesdata
    GROUP BY Branch, `Product line`
)

SELECT *
FROM (
    SELECT 
        Branch,
        `Product line`,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Branch 
            ORDER BY total_revenue DESC
        ) AS rn
    FROM product_sales
) ranked
WHERE rn = 1;




   -- Q3. Which transactions are above the overall average order value?

WITH avg_value AS (
    SELECT AVG(Total) AS avg_order_value
    FROM walmartsalesdata
)

SELECT 
    `Invoice ID`,
    Branch,
    City,
    Total,
    CASE 
        WHEN Total > avg_order_value THEN 'Above Average'
        ELSE 'Below Average'
    END AS order_category
FROM walmartsalesdata, avg_value;


-- Q4. What is the cumulative revenue growth over months?

WITH monthly_sales AS (
    SELECT 
        YEAR(Date) AS year,
        MONTH(Date) AS month,
        SUM(Total) AS monthly_revenue
    FROM walmartsalesdata
    GROUP BY YEAR(Date), MONTH(Date)
)

SELECT 
    year,
    month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY year, month
    ) AS cumulative_revenue
FROM monthly_sales;

-- Q5. What is the peak sales hour in each branch?
WITH hourly_sales AS (
    SELECT 
        Branch,
        HOUR(Time) AS sales_hour,
        SUM(Total) AS total_revenue
    FROM walmartsalesdata
    GROUP BY Branch, HOUR(Time)
)

SELECT *
FROM (
    SELECT 
        Branch,
        sales_hour,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Branch
            ORDER BY total_revenue DESC
        ) AS rn
    FROM hourly_sales
) ranked
WHERE rn = 1;

-- Q6. Rank product lines based on profitability
WITH product_profit AS (
    SELECT 
        `Product line`,
        SUM(`gross income`) AS total_profit
    FROM walmartsalesdata
    GROUP BY `Product line`
)

SELECT 
    `Product line`,
    total_profit,
    DENSE_RANK() OVER (ORDER BY total_profit DESC) AS profit_rank
FROM product_profit;

-- Q7. Which payment method generates the highest average transaction value?

WITH payment_analysis AS (
    SELECT 
        Payment,
        AVG(Total) AS avg_transaction_value
    FROM walmartsalesdata
    GROUP BY Payment
)

SELECT 
    Payment,
    avg_transaction_value,
    RANK() OVER (ORDER BY avg_transaction_value DESC) AS rank_by_avg_value
FROM payment_analysis;

-- Q8.Who spends more within each city — Member or Normal customers?

WITH customer_spending AS (
    SELECT 
        City,
        `Customer type`,
        SUM(Total) AS total_spent
    FROM walmartsalesdata
    GROUP BY City, `Customer type`
)

SELECT 
    City,
    `Customer type`,
    total_spent,
    RANK() OVER (
        PARTITION BY City
        ORDER BY total_spent DESC
    ) AS spending_rank
FROM customer_spending;

-- Q9.Find top 3 highest revenue transactions in each branch
SELECT *
FROM (
    SELECT 
        Branch,
        `Invoice ID`,
        Total,
        ROW_NUMBER() OVER (
            PARTITION BY Branch
            ORDER BY Total DESC
        ) AS rn
    FROM walmartsalesdata
) ranked
WHERE rn <= 3;

-- Q10.Compare each branch revenue against overall average branch revenue
WITH branch_revenue AS (
    SELECT 
        Branch,
        SUM(Total) AS total_revenue
    FROM walmartsalesdata
    GROUP BY Branch
)

SELECT 
    Branch,
    total_revenue,
    ROUND(AVG(total_revenue) OVER (), 2) AS avg_branch_revenue,
    total_revenue - AVG(total_revenue) OVER () AS difference_from_avg
FROM branch_revenue;
