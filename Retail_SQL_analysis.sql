-- Now that we moved our data from Jupyter here, lets do some analysis

-- select * from df1_orders limit 5;

-- 1. Find top 10 highest revenue generating products
SELECT product_id, sum(sale_price) as total_sales 
FROM df1_orders
group by product_id
Order by total_sales desc 
limit 10;

-- 2. Lets break down highest selling products in each region - Lets use CTE
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

-- 3. Find Month over Month growth camprison for 2022 and 2023 sales example: January 2022 vs January 2023
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


-- 4. For each category which month has highest sales

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

-- 5. Sub category that had the highest growth by profit in 2023 compared to 2022 in terms of percentage

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


















