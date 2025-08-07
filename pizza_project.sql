#KPI's
alter table pizza_sale
rename column pizza_id to pizza_id;

alter table pizza_sale
modify order_date datetime;

desc pizza_sale;

select * from pizza_sale;

select sum(total_price)  as total_revenue from pizza_sale;

select ( sum(total_price) / count(Distinct order_id))  as average_order_value from pizza_sale;

select sum(quantity)  as total_pizza_sold from pizza_sale;

select count(Distinct order_id)  as total_orders from pizza_sale;

select sum(quantity) / count(Distinct order_id) as pizza_per_order from pizza_sale;

#Daily trend for total orders
select DAYNAME(order_date) as Order_Day , count(Distinct order_id) as Total_Orders from pizza_sale
group by Order_Day
order by Total_orders desc;

select MONTHNAME(order_date) as Order_Month , count(Distinct order_id) as Total_Orders from pizza_sale
group by Order_Month
order by Total_orders desc;

select distinct pizza_category, cast(sum(total_price) as decimal(10,2)) as total_rev_per_category from pizza_sale
group by pizza_category
order by total_rev_per_category desc;

select distinct pizza_category, cast(count(quantity) as decimal(10,2)) as no_of_sales from pizza_sale
group by pizza_category
order by no_of_sales desc;

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sale) AS DECIMAL(10,2)) AS PCT
FROM pizza_sale
GROUP BY pizza_category
order by PCT desc;


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sale) AS DECIMAL(10,2)) AS PCT
FROM pizza_sale
GROUP BY pizza_size
order by PCT desc;

SELECT pizza_category, sum(quantity) as total_quantity_sold
from pizza_sale
group by pizza_category
order by total_quantity_sold desc;

select pizza_name, sum(total_price) as total_revenue
from pizza_sale
group by pizza_name
order by total_revenue desc
limit 5;


select pizza_name, sum(total_price) as total_revenue
from pizza_sale
group by pizza_name
order by total_revenue asc
limit 5;

select pizza_name, sum(quantity) as total_sold
from pizza_sale
group by pizza_name
order by total_sold desc
limit 5;

select pizza_name, sum(quantity) as total_sold
from pizza_sale
group by pizza_name
order by total_sold asc
limit 5;

select pizza_name, count(distinct order_id) as total_orders
from pizza_sale
group by pizza_name
order by total_orders desc
limit 5;

select pizza_name, count(distinct order_id) as total_orders
from pizza_sale
group by pizza_name
order by total_orders asc
limit 5;
