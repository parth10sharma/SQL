-- Query used to show databases --
show databases;

-- Query used to use a database (use database_name) --
use retail;

-- Query used to show tables --
show tables;

--  To describe a table (desc table_name) --
desc category;
           -- or (show columns from table_name) --
show columns from product;

-- To select a table (select *from table_name)--
select *from product;

-- SELECT a table with WHERE (comparison operator) --

-- Equality --
select * from product
where price = 2999;

-- Less than or Equal --
select *from product
where price <=  3000;

-- More than or Equal --
select *from product
where price >= 5000;

-- Not Equal --
select *from product
where brand <> 'samsung';

-- Greater than  --
select *from product
where price > 20000;

-- Less than --
select *from product
where price < 2500;

-- Between --
select *from product
where price between 10000 and 15000;
