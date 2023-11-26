use pizza;
select * from pizza_sales;

# Find out total revenue of the pizza company
select sum(total_price) as Total_Revenue from pizza_sales;

# Find out average order values of the company
select sum(total_price) / count(distinct order_id) as Average_order_values from pizza_sales;

# Total Pizzas Sold
select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

# Total Order Placed
select count(distinct order_id) as Total_Order_Placed from pizza_sales;

# Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10, 2)) as decimal(10,2))
 as Average_Pizzas_Per_Order from pizza_sales;
 
# Daily Trend for Total Orders
SELECT DAYNAME(order_date) as order_day, COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

# Monthly Trend for Total Orders
SELECT MONTHNAME(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY Total_Orders DESC;

# Percentage of Sales by Pizza Category
select pizza_category, sum(total_price) as Total_Sales, sum(total_price)*100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_category;

# Percentage of Sales by Pizza size
select pizza_size, CAST(sum(total_price) as decimal(10,2)) as Total_Sales, 
CAST(sum(total_price)*100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT DESC;

# or
SELECT
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE QUARTER(order_date) = 1) AS DECIMAL(10,2)) AS PCT
FROM
    pizza_sales
WHERE
    QUARTER(order_date) = 1
GROUP BY
    pizza_size
ORDER BY
    PCT DESC;

# Total Pizzas sold by Pizza Category:
select pizza_category, count(quantity) as Total_Pizzas_sold
from pizza_sales
group by pizza_category
order by Total_Pizzas_sold DESC;

# Top 5 pizza by Revenue:
select pizza_name, sum(total_price) as Revenue
from pizza_sales
group by pizza_name
order by Revenue DESC
limit 5;

# Bottom 5 pizza by Revenue:
select pizza_name, sum(total_price) as Revenue
from pizza_sales
group by pizza_name
order by Revenue ASC
limit 5;

# Top 5 pizza by quantity:
select pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity DESC
limit 5;

# Bottom 5 pizza by quantity:
select pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity ASC
limit 5;

# Top 5 pizza by total order:
select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders DESC
limit 5;

# Bottom 5 pizza by total order:
select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders ASC
limit 5;






