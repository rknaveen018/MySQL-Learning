-- SQL_2

-- Where: AND and OR
-- In and Not In
-- Between
-- Like: '%_'
-- Groupby
-- Orderby
-- Having

-- SQL_3 ------------------------------------------------------------------------------
-- Agenda

-- Joins
-- Subqueries
-- ------------------------------------------------------------------------------------

use telecom;
select * from churn;

-- Find the count of customers whoes customerID starts with 9 and ends with either A or U and 
-- the customer is not churn have monthylcharges greater than 20 and uses paymentmethod only automatic.

select count(*)
from churn
where 
customerID like '9%'
and 
(customerID like '%a' or customerID like '%u')
and 
churn = 'no'
and 
monthlycharges>20
and 
paymentmethod in ('Bank transfer (automatic)', 'Credit card (automatic)');

select count(*)
from churn
where 
customerID like '9%'
and 
(customerID like '%a' or customerID like '%u')
and 
churn = 'no'
and 
monthlycharges>20
and 
paymentmethod like '%automatic%';

-- Join churn and customer table using inner join
select * from churn;
select * from customer;

select *
from 
churn a inner join customer b 
on a.customerid = b.customerid;

-- Find the count of male and female customers who have not churned and uses automatic payment methods.

select b.gender, count(*)
from 
churn a inner join customer b 
on a.customerid = b.customerid
where a.churn = 'no'
and a.paymentmethod like '%automatic%'
group by b.gender
order by count(*) desc;

-- Use employee and department table and find out if we have departments with no employees?(if yes, find the count)
use hr;
select * from employees;
select * from departments;

select count(*)
from employees a 
right join 
departments b
on a.department_id = b.department_id
where b.manager_id = 0;

-- Find the average salary of the Eexcutive Department.
select avg(a.salary)
from employees a 
inner join departments b 
on a.department_id = b.department_id
where b.department_name = 'Executive';

select * from departments;

-- SUB-QUERY
select avg(salary)
from employees
where department_id in (select department_id from departments where department_name = 'Executive');

-- Find avg salary of employees from the executive department with job title as accountant.
select * from jobs;

select avg(salary)
from employees
where department_id in (select department_id from departments where department_name = 'Executive')
and
job_id in (select job_id from jobs where job_title  = 'accountant');

-- Find the avg(mnthly charges) for male and female those who are non-churn and use fiber optic as internet service.

use telecom;
select b.gender, avg(a.monthlycharges)
from churn a 
join customer b 
on a.customerid  = b.customerid
where a.churn = 'no'
and a.customerid in (select customerid from internet where internetservice = 'Fiber optic')
group by b.gender;

select * from internet;












































































