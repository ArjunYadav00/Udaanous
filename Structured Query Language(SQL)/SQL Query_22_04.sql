use udaanous;
select * from sales_data;
-- Create_table_&_then_load_the_XLSX_file_into_this_table.
create table sales_data(
order_id INT,
customer_id INT,
product_id varchar(20),
product_name text,
category text,
quantity int,
price int,
order_date date,
region text
);
-- Total_sales_value
select sum(quantity * price) as total_sales from sales_data;
/* Another Way to find the total sales value*/
SELECT
  category, 
SUM(quantity * price) AS total_sales
FROM
  sales_data
GROUP BY
  category;
-- Monthly_sales_trends
select date_format(order_date,"%Y-%c") as date_,sum(price * quantity) as total_sales from sales_data
group by date_format(order_date,"%Y-%c");
-- Top_5 product by sales values
select product_name, sum(quantity * price) as total_revenue 
from sales_data
group by product_name
order by total_revenue desc limit 5;
-- sales by region
select region, sum(quantity * price) as Total_sales
from sales_data
group by region;
-- customer purchase by freuquency
select customer_id, count(order_id) as buyers
from sales_data
group by customer_id
order by buyers desc limit 10;
-- category_wise revenue contibution
select category, sum(price * quantity) as total_sales, round(sum(price * quantity) * 100 / (select sum(price * quantity) from sales_data),2) as sales_percentage
from sales_data
group by category;
-- repeat customer rate
select customer_id, count(order_id) as Total_purchase
from sales_data
group by customer_id
having Total_purchase >1;
