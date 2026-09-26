use retail;
-- SQL AGGREGATION FUNCTIONS --

-- Count --
-- finding total number of orders
select count(order_id) from orders;

-- SUM --
-- calculating the total revenue from all orders
select sum(total_amount) from orders;

-- AVERAGE --
-- find the average product price
select avg(price) from product;

-- MINIMUM --
-- finding minimum price in product
select min(price) from product;

-- MAXIMUM --
-- finding maxaimum price in product
select max(price) from product;

