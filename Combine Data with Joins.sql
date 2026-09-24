use retail;
-- Combine Data with Joins --

-- Inner Join --
-- to display product feedback of all the products purchased with customer reviews --(joining two tables)
select p.product_name , r.rating, r.review 
from product p
inner join rating r
on p.product_id = r.product_id;

-- to identify discounts applied to products that have been sold -- (joining three tables)
select p.product_id,d.discount_percentage, oi.quantity
from order_item oi
inner join product p on oi.product_id = p.product_id
inner join discount d on p.product_id = d.product_id;

-- display all products purchased by customers, along with their rating and feedback -- (joining multiple tables)
select o.order_id, p.product_id, r.rating, r.review
from orders o
inner join order_item oi on o.order_id = oi.order_id
inner join product p on oi.product_id = p.product_id
inner join rating r on p.product_id = r.product_id
and o.customer_id = r.customer_id;

-- need to write a query to find order history, including customer and product details like names and prices --
select c.customer_name,p.product_name, oi.price, o.order_date
from customer c 
inner join orders o on c.customer_id = o.customer_id
inner join order_item oi on o.order_id = oi.order_id
inner join product p on oi.product_id = p.product_id;

-- LEFT OUTER JOIN --

-- show all your customers, along with their orders --
select c.customer_name, o.order_id, o.total_amount
from customer c
left outer join orders o
on c.customer_id = o.customer_id;

-- retrieve all products and their order details, including products that haven't been ordered --
select p.product_name, o.order_date
from product p
left join order_item oi on p.product_id = oi.product_id
left join orders o on oi.order_id = o.order_date;

-- RIGHT OUTER JOIN --
-- show all your customers, along with their rating 
select r.product_id, r.rating, c.customer_name
from rating r
right join customer c on r.customer_id = c.customer_id;

-- retrieve all orders and their product details, including orders with products --
select o.order_id, p.product_name
from orders o 
right join order_item oi on o.order_id = oi.order_id
right join product p on oi.product_id = p.product_id;


