create database assignement;
use assignement;

select * from customers;
select * from offices;
select * from orderdetails;
select * from orders;

-- 1.Write a SQL query to retrieve the first 5 rows from the customers table.-- 
select * 
from customers
limit 5;

-- 2. Write a SQL query to retrieve the unique city names from "customers" table sorted in descending order
 select distinct city 
 from customers
 order by city desc;
 
 -- 3. Write a SQL query to get the number of unique city names "offices" table.
 select count(distinct city) from offices;
 
 
 
-- 4. Write a SQL query to get the maximum, minimum and average value from the "age" column in the "customers" table
select max(creditLimit)as max,min(creditLimit)as min,round(avg(creditLimit),2)as avg 
from customers;


-- 5. Write a SQL query to get the city names which are present in "offices" table but not in "customer" table.
select distinct city 
from offices 
where city not in(select distinct city
from customers);

-- 6. Write a SQL query to get the city names which are present in "offices" table as well as in "customer" table
select distinct city 
from offices 
where city  in(select distinct city
from customers);


-- 7. Write a SQL query to get records where city or state is not given in "customer" table and creditlimit is in the range-80000 to 130000
select creditlimit
from customers
where (city is null or state is null) and (creditlimit  between 80000 and 130000) ;

-- 8.Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table
select orderDate,count(customerNumber) as cnt
from orders
group by orderDate
order by cnt desc
limit 1;

-- 9. For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers.
        
       select customerName,phone
       from customers 
       where customerNumber in(select customerNumber 
       from orders 
       where orderDate = (select orderDate
       from orders 
       group by orderDate
       order by count(customerNumber) desc
       limit 1));

-- 10. SQL query to get the customer phone number and customer name from customers table.where order is either cancelled or disputed in orders table

select customerName,phone 
from customers
where customerNumber in (select customerNumber
from orders 
where status='Cancelled' or status='disputed');


-- 11. Write a SQL query to get the top 4 highest selling products from orderdetails table.

select productCode, sum(quantityOrdered) as totalordered
from orderdetails
group by productCode
order by totalordered desc
limit 4;


-- 12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.
select customerNumber, COUNT(*) as OrderCount
from orders
where orderDate >'2003-01-01' and orderDate < '2004-12-31'
group by customerNumber
order by OrderCount desc;

-- 13. Write a SQL query to get the city names from customer table where more than 4 customers reside
select city,count(customerNumber) as cnt
from customers
group by city
having count(customerNumber)>4;








