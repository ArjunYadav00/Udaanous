-- work_17/04/2025
use udaanous;
-- Group_by_Function
create table customer_date(
City varchar(50),
Customer_id int primary key,
Total_Spending int
);
insert into customer_date(City,Customer_id,Total_Spending)
      values("Mumbai",55,545656),
            ("Delhi",75,784365),
            ("Coimbatore",67,874569);
select sum(Total_spending),City from customer_date
group by city;
-- Order_by_function
select * from customer_date 
order by total_spending asc;
select * from customer_date
order by total_spending desc;
-- left_join_function
select * from pizzas
left  join pizza_types
on pizza_types.pizza_type_id = pizzas.pizza_type_id;
-- right_join_function
select * from pizzas
right join orders
on order_id = pizza_id;
-- Cross_join_function
select * from orders
cross join pizzas
on order_id = pizzas.pizza_id;
