use SAMPLEDB
GO

--Basic Queries

select *from [hcm].[employees]

select first_name,
last_name
from hcm.employees

select last_name AS customer_last_name,
city
from [oes].[customers];

select*from[oes].[orders];

select*from[bird].[antarctic_populations];

select distinct top(2) *
from [bird].[antarctic_populations]
where population_count<=5000
order by date_of_count desc, species_id asc  ;

select top(10)*from[hcm].[employees]
order by salary desc;

select 
order_id,
customer_id,
freight_cost,
1000 AS new,             
freight_cost+1000 AS new_Expense
from[oes].[orders]
where freight_cost>=50
order by order_id asc;



select*from[oes].[warehouses]

select warehouse_name,
location_id
from[oes].[warehouses]
where warehouse_name is   not NULL;

select*from[hcm].[employees]

select employee_id,
first_name,
middle_name,
last_name,
CONCAT(first_name,'',middle_name,'',last_name) AS Full_Name
from[hcm].[employees]

select * from [oes].[products]

--/list price greater than 100
select *             
from[oes].[products]
where list_price >100; 


select * from [oes].[orders]

--//orders not delivered i.e null in shipped 
select *  
from[oes].[orders]
where  shipped_date is NULL;

--//to select on particular date ordered product
  select * 
 from[oes].[orders]
 where order_date = '20200226';

 --// Orders on or after Jan 01 2020
  select * 
 from[oes].[orders]
 where order_date >= '20200101';

 --Orders that were delivered between JAN and DEC 2020
 --using Not null ,where clause, AND operator
 Select*from[oes].[orders] 
 where 
 SHIPPED_DATE IS NOT NULL  
 AND  
 ORDER_DATE BETWEEN '20200101' AND'20201201' 
 ORDER BY order_date asc;

--Number of orders on and after Jan 2020( doing as extra on 12/08/2024)
--Semi Intermediate level
 select Year(order_date) AS Year ,
 Month(order_date) AS Month,   
 count(*) AS order_count
 from[oes].[orders] 
 where order_date >= '20200101'
 Group By Year(order_date),Month(order_date)
 Order By Month,Year asc;

 --  To look at all Collatations in sql server
 select*from sys.fn_helpcollations(); 

 -- To see the schema information (meta data view) 
  select*from INFORMATION_SCHEMA.COLUMNS 
  WHERE table_schema='oes' and table_name='products' ; 

--Collation Levels(https://www.geeksforgeeks.org/sql-server-collation/)

-- using wildcard '%' to get product names starting with Apple
select*from [oes].[products]  
where product_name like 'Apple%';

-- using wildcard '%' to get product names ending  with card
select*from [oes].[products] 
where product_name like '%Card';

--(_)can have single wildcard character before then n (%)then anything from 0 to characters
select*from [oes].[products] 
where product_name like '_n%';

-- Return products name that have number (0-9) as end
select*from [oes].[products]  
where product_name like '%[0-9]';

--1st letter 2nd number
select*from [oes].[products] 
where product_name like '[A-Z][0-9]%';

----Entry 20-08-2024 Git and Github for sql server(updates and pushing sql code via Git bash)

--To select from countries letter starting with N
  select *from[hcm].[countries]
  where country_name Like 'N%';

--customers who have Gmail
select customer_id,first_name, Email
from[oes].[customers]
where email like '%@gmail.com';

--Products with mouse name in it
select product_name 
from[oes].[products]
where product_name like '%mouse%';

--Product name that end with a number
select Product_name 
from[oes].[products]
where product_name like '%[0-9]';

