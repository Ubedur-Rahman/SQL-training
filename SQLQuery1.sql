select*from[hcm].[employees];

select 
employee_id,
first_name,
salary AS Amount,
salary*12 as Annual_pay
from [hcm].[employees];