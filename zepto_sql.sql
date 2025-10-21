create database zepto_db;
use zepto_db;
drop table customers;
alter table customer
add primary key (C_ID(50));
alter table delivery
add primary key (DP_ID(50));
RENAME TABLE `order` TO orders;
ALTER TABLE delivery
CHANGE `Delivery Partner` delivery_partner TEXT;
ALTER TABLE ratings
CHANGE `Delivery/Service_Rating` Delivery_Rating int;

alter table orders
add primary key (OR_ID(50));
alter table products
add primary key (P_ID(50));
alter table transactions
add primary key (Tr_ID(50));

select * from customer;
-- 1.Who are the top 10 customers based on total spending?
select c.c_id,c.name, 
round(sum(o.qty*p.price ),2)as total_spending
from customer c join orders o using (c_id)
join products p using (p_id)
group by 1,2
order by round(sum(o.qty*p.price ),2) desc
limit 10;
-- 2.How many customers placed only one order in their lifetime?
select count(*) as one_time_ordered
from (select o.c_id,c.name
      from customer c join orders o using(c_id)
      group by o.c_id
      having count(o.c_id)=1) as a;
-- 3. What is the average number of days between a customer's orders?
with cte as(
select c_id,order_date,
lead(order_date) over(partition by c_id order by order_date) as next_day
from orders)
select avg(datediff(next_day,order_date)) as avg_days
from cte;
-- 4.  Which customers have shown the highest order frequency in the last 30 days?
select c_id, count(or_id) as order_frequency
from orders 
where order_date>=(select max(order_date) from orders)- interval 30 day
group by c_id
order by count(or_id) desc
limit 5;
-- 5. What percentage of customers returned to place a second order?
select count(*)*100/(select count(distinct c_id) from customer) as second_order_rate
from (select c_id
      from orders 
      group by c_id
      having count(c_id)>1) as a;
-- 6. Which 5 products generated the most revenue ?
select p.pname,p.brand, 
round(sum(p.price*o.qty))as revenue
from products p join orders o using (p_id)
group by p.p_id
order by sum(p.price*o.qty) desc
limit 5;
-- 7. What is the average order value per product category?
select p.category, 
round(avg(p.price*o.qty)) as avg_order_value
from products p join orders o 
on p.p_id = o.p_id
group by p.category
order by round(avg(p.price*o.qty)) desc;
-- 8. What is the average discount given per product category?
select p.category, round(avg(o.coupon_discount)) as avg_discount
from products p join orders o 
on p.p_id = o.p_id
group by p.category
order by round(avg(o.coupon_discount)) desc;
-- 9.Which products had the highest growth in sales month-over-month?
WITH monthly_sales AS (
  SELECT p_id,
         DATE_FORMAT(order_date, '%Y-%m') AS month,
         SUM(qty) AS total_qty
  FROM orders
  GROUP BY p_id, month
),
growth AS (
  SELECT p_id, month,
         LAG(total_qty) OVER (PARTITION BY p_id ORDER BY month) AS prev_month_qty,
         total_qty
  FROM monthly_sales
)
SELECT p_id, month,
       total_qty, prev_month_qty,
       ROUND(((total_qty - prev_month_qty)/prev_month_qty)*100, 2) AS growth_pct
FROM growth
WHERE prev_month_qty IS NOT NULL
ORDER BY growth_pct DESC
limit 5;
--  10. Which day of the week has the highest total number of orders?
SELECT dayname(order_date) AS weekday,
COUNT(or_id) AS total_orders
FROM orders
GROUP BY dayname(order_date)
ORDER BY COUNT(or_id) DESC;
-- 11. What hour of the day sees the most orders?
select extract(hour from order_time) as busiest_order_time , 
count(*) as order_count
from orders
group by extract(hour from order_time)
order by count(*) desc;
-- 12. What is the total revenue generated from each city?
select c.city, round(sum(p.price*o.qty),2) as total_revenue
from customer c join orders o 
on c.c_id = o.c_id
join products p 
on p.p_id = o.p_id
group by c.city
order by round(sum(p.price*o.qty),2) desc
limit 5;
-- 13. What is the total number of orders each year?
select extract(year from order_date) as year ,
count(*) as order_count
from orders
group by extract(year from order_date)
order by count(*) desc;
-- 14. What is the total number of orders each month?
select monthname(order_date) as month ,
count(*) as order_count
from orders
group by monthname( order_date)
order by count(*) desc;
-- 15. What percentage of transactions fail due to payment errors?
select 
count(*)*100/(select count(*) from transactions) as payment_error
from transactions
where Transaction_Status = 'Failed';
-- 16. Which payment method has the highest success rate?
select Transaction_Mode , 
count(*)/(select count(*) from transactions) as success_rate
from transactions
where Transaction_Status = 'Success'
group by Transaction_Mode
order by count(*)/(select count(*) from transactions) desc
limit 1;
-- 17. What is the average transaction value by payment method?
select t.transaction_mode, round(avg(p.price*o.qty ),2) as avg_transaction_value
from transactions t join orders o
on t.or_id = o.or_id
join products p
on p.p_id = o.p_id
group by  t.transaction_mode;
-- 18. How many total orders were successfully delivered by each delivery partner?
select d.Delivery_Partner,count(*) as successful_delivery
from delivery d join orders o
on d.dp_id = o.dp_id
group by d.Delivery_Partner
order by count(*) desc;
-- 19.  What is the average number of orders handled by each delivery partner?
select d.Delivery_Partner,count(o.Or_ID) / count(distinct o.Order_Date) as  avg_orders_per_day
from delivery d join orders o
on d.dp_id = o.dp_id
group by d.Delivery_Partner
order by count(o.Or_ID) / count(distinct o.Order_Date) desc;
-- 20. What is the count of delivery service ratings per delivery partner?
select d.Delivery_Partner, 
count(r.Delivery_Rating) as rating_count
from delivery d join orders o
on d.dp_id = o.dp_id
join ratings r
on o.or_id = r.or_id
group by d.Delivery_Partner
order by count(r.Delivery_Rating) desc;













