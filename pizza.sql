create database pizzadb;
create table pizza ( pizza_id int, 
order_id int,
 pizza_name_id varchar(50), 
 quantity int,
 order_date date, 
 order_time time, 
 unit_price float, 
 total_price float, 
 pizza_size varchar(50), 
 pizza_category varchar(50), 
 pizza_ingredients varchar(200), 
 pizza_name varchar(50));
 select * from pizza;
SELECT SUM(total_price) AS Total_Revenue FROM pizza;
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza;
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza;
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza
GROUP BY DAYNAME(order_date);
select MONTHNAME(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza
GROUP BY MONTHNAME(order_date);
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_category;
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_size
ORDER BY pizza_size;
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;






