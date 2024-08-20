use SAMPLEDB
GO

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

select *             --/list price greater than 100
from[oes].[products]
where list_price >100; 


select * from [oes].[orders]

 select *  --//orders not delivered i.e null in shipped 
 from[oes].[orders]
 where  shipped_date is NULL;

  select * --//to select on particular date ordered product
 from[oes].[orders]
 where order_date = '20200226';

  select * --// Orders on or after Jan 01 2020
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

 select Year(order_date) AS Year ,--Number of orders on and after Jan 2020( doing as extra on 12/08/2024)
 Month(order_date) AS Month,  --Semi Intermediate level 
 count(*) AS order_count
 from[oes].[orders] 
 where order_date >= '20200101'
 Group By Year(order_date),Month(order_date)
 Order By Month,Year asc;

 select*from sys.fn_helpcollations(); --  To look at all Collatations in sql server

  select*from INFORMATION_SCHEMA.COLUMNS -- To see the schema information (AIM:to see the collatation of schema)
  WHERE table_schema='oes' and table_name='products' ; 

--Collation Levels(https://www.geeksforgeeks.org/sql-server-collation/)


select*from [oes].[products]  -- using wildcard '%' to get product names starting with Apple
where product_name like 'Apple%';

select*from [oes].[products]  -- using wildcard '%' to get product names ending  with card
where product_name like '%Card';

select*from [oes].[products] --(_)can have single wildcard character before then n (%)then anything from 0 to characters
where product_name like '_n%';

select*from [oes].[products]  -- Return products name that have number (0-9) as end
where product_name like '%[0-9]';

select*from [oes].[products]  --1st letter 2nd number
where product_name like '[A-Z][0-9]%';

----Entry on 20-08-2024 Learning Git and Github for sql server learing (learing to push sql code via Git bash)