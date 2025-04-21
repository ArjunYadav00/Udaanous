use udaanous;
select * from customers;
select * from products;
select * from orders;
-- List all cust_&_their cities
SELECT first_name, city
FROM customers;
-- display_each_order
SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name,
    p.product_name,
    o.quantity * p.price AS total_price
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
JOIN
    products p ON o.product_id = p.product_id;
-- all_order_placed_in_march_2024
SELECT *
FROM orders
WHERE order_date >= '2024-03-01'
  AND order_date < '2024-04-01';
-- 
select * from products;
select customers.last_name,products.product_name,sum(products.price * orders.quantity) as total_revenue from orders
join customers
on customers.customer_id = orders.customer_id
join products
on products.product_id = orders.product_id
group by customers.last_name,products.product_name
order by total_revenue;
--
select * from products;
select products.product_name,count(orders.order_id)as order_count from products
join orders
on orders.product_id = products.product_id
group by products.product_name;
--
select customers.first_name,sum(products.price * orders.quantity) as total_spent from orders
join products
on products.product_id = orders.product_id
join customers
on customers.customer_id = orders.customer_id
group by customers.first_name
order by total_spent desc;
--
Select C.city , Avg(O.Quantity * p.Price) As Total_spend from customers as c
join orders as o on C.customer_id = O.customer_id
join products as p on P.product_id = O.product_id
group by C.city 
order by Total_spend;

