-- After cleaning and loading the dataset into MySQL, I performed SQL-based exploratory analysis. Here are some of the key business insights:  

-- select * from df1_orders limit 5;

-- 1. Top 10 Highest Revenue-Generating Products
-- Business insights:
-- Identifies the best-selling products by total revenue.
-- These products represent the core drivers of sales and are crucial for demand forecasting.

SELECT product_id, sum(sale_price) as total_sales 
FROM df1_orders
group by product_id
Order by total_sales desc 
limit 10;

-- 2. Highest-Selling Products by Region (Top 5 per Region)
-- Business insights:
-- Breaks down regional performance by identifying the top 5 products in each region
-- Provides insights for regional marketing strategies and localized inventory management.
-- Product popularity varies by region — localized marketing and stocking strategies can maximize efficiency.

WITH CTE AS 
(
SELECT region, product_id, sum(sale_price) as total_sales 
FROM df1_orders
group by region, product_id
)
SELECT * FROM
(
SELECT *,
row_number() over(partition by region order by total_sales desc) as rank_num
FROM CTE
) CTE_2
WHERE rank_num <= 5;

-- 3. Month-over-Month Sales Growth (2022 vs 2023)
-- Business InsightS:
-- Compares month-over-month growth between 2022 and 2023.
-- Clear seasonal sales trends exist. Comparing 2022 vs 2023 highlights year-over-year growth patterns.

WITH CTE AS(
SELECT YEAR(order_date) as order_year, month(order_date) as order_month, sum(sale_price) as total_sales 
FROM df1_orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month
)
SELECT order_month,
sum(case when order_year = 2022 then total_sales else 0 end) as sales_2022,
sum(case when order_year = 2023 then total_sales else 0 end) as sales_2023
FROM CTE
GROUP BY order_month
ORDER BY order_month;


-- 4. Highest Sales Month for Each Category
-- Business Insights:
-- Finds the peak month for sales in each category.
-- Each product category has peak months. These insights support seasonal promotions and inventory adjustments.

WITH CTE AS
(
SELECT category, DATE_FORMAT(order_date, '%Y%m') as order_year_month, sum(sale_price) as total_price
FROM df1_orders
group by category, DATE_FORMAT(order_date, '%Y%m')
)
SELECT * FROM
(
SELECT *,
row_number() over(partition by category order by total_price desc) as rank_num
from CTE
) B
WHERE rank_num = 1;

-- 5. Sub-Category with Highest Profit Growth (2023 vs 2022)
-- Business insights:
-- Identifies sub-categories with the highest profit growth in 2023 compared to 2022.
-- Some sub-categories saw explosive growth in 2023 compared to 2022. These represent emerging opportunities for expansion.

WITH CTE AS
(
SELECT sub_category, year(order_date) as order_year, sum(profit) as total_profit
FROM df1_orders
group by sub_category, order_year
),
CTE2 AS
(
SELECT sub_category, 
sum(case when order_year = 2022 then total_profit else 0 end) as profit_2022,
sum(case when order_year = 2023 then total_profit else 0 end) as profit_2023
FROM CTE
GROUP BY sub_category
-- ORDER BY profit_2023 desc;
) 
SELECT *, (profit_2023 - profit_2022)*100/profit_2022 as percent_increase
FROM CTE2
order by percent_increase desc;


















