use retail;

-- SELECT with Where (Logical operator i.e and, or) --
select *from product
where brand = 'Samsung' and price < 20000;

select *from product
where brand ='sony' or brand = 'samsung'; 

-- SELECT with Where (Comparison + Logical) -- 

select *from product
where (brand= 'Samsung' or brand = 'Sony')
and price < 12000 ;

select *from product
where brand = 'Sony' 
or (brand = 'Samsung' and price > 1200);

-- SELECT using Like Operator --

-- Finding customer whose name starts with A --
select *from customer
where customer_name like 'A%';

-- Finding customers who have given feedback as Good in review --
select *from rating
where review like '%Good%';

-- Where using the IN Operator --

-- Finding customers from Delhi, Mumbai, Noida --
select *from customer 
where city IN ('Delhi','Noida','Mumbai');
