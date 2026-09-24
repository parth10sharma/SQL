USE retail;
-- STRING FUNCTION --

-- generating last two letters of the city names as reward codes
select customer_name , city , substr(city, -2,2) AS reward_code from customer;

-- generating last first letters of the city names as reward codes
select customer_name , city , substr(city,1,2) AS reward_code from customer;

-- Date Function

-- Finding orders placed in 11th Month
select order_id, customer_id, order_date from orders
where month(order_date)= 11;

-- Extractng the current date
select curdate();

