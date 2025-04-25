use udaanous;
create table customer_1(
customer_id int,
customer_name Varchar(20),
join_date date,
region text
);
select * from customer_1;
create table orders_1(
order_id int,
customer_id int,
order_date date,
total_amount int
);
select * from orders_1;
--
WITH ranked AS (
  SELECT c.customer_name, c.region,
    COUNT(*) AS order_count,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (PARTITION BY c.region ORDER BY SUM(o.total_amount) DESC) AS rnk
  FROM orders_1 o
  JOIN customer_1 c ON o.customer_id = c.customer_id
  WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
  GROUP BY c.customer_id, c.customer_name, c.region
  HAVING order_count > 3
)
SELECT customer_name, region, total_spent, order_count
FROM ranked
WHERE rnk <= 3
ORDER BY region, rnk;
--
SELECT customer_name, region, SUM(total_amount) AS total_spent, COUNT(*) AS order_count
FROM orders_1 o
JOIN customer_1 c ON o.customer_id = c.customer_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY o.customer_id, customer_name, region
HAVING order_count > 3
ORDER BY region, total_spent DESC limit 5;
