-- Why we need a better techonolgy for storage and why a company can't rely on Traditional Data Storage Systems.
-- Large Storage Space.
-- Logical collection of Data
-- Same View of the Data.
-- Expandable.

-- RDBS: Relational Database Management System.
-- Server: Actual Data Storage.
-- Client: User interface/ Software that helps the user to connect to the server.

-- SQL: Structured Query Language. Communication language between the client and the server. 

-- Componenets of SQL:
-- DDL: DE
-- DML: DA: That's what we are learning
-- DCL: DE

-- How to write a simple SQL Query.alter
-- SELECT --- FROM --- WHERE


-- ---------------------------------------------------------------------------------------------------------
-- SQL-2

-- Agenda
-- Where: And, Or, In
-- Like
-- Year
-- Groupby
-- Orderby
-- Having

-- ---------------------------------------------------------------------------------
use telecom;
select * from churn;

-- Find the number of Churn customers?
select count(*)
from churn
where churn = 'Yes';

select * from churn;

-- Find the number of customers who are using papaerless billing and are not churn
select count(*)
from churn
where paperlessbilling = 'Yes' and Churn = 'NO';

-- Find the number of customers who are with the company for more than 50 months and have not left.
-- 1: Customer is churn: They have left
-- 0: Customer is non-Churn: They are with the company
select count(*)
from churn
where tenure>50 and churn = 'no';

-- Find the avg monthlycharges for the employees using electronic check and mailed check payment service.
select * from churn;
-- And: When it's happening simultenously.
-- If the filter is on the same field then OR is used, if it's in different fields, and

select avg(monthlycharges)
from churn 
where paymentmethod = 'electronic check' or paymentmethod = 'mailed check';

-- When we have to filter a particular field on multiple values then it's better to use IN rather than using multiple or
select avg(monthlycharges)
from churn 
where paymentmethod in ('electronic check', 'mailed check');

-- Filter the customers having tenure>50 and using all other payment method except electronic check and mailed check.alter
select count(*)
from churn
where tenure>50 and paymentmethod not in ('electronic check', 'mailed check');

-- Find the number average tenure of the customers with monthlycharges between 60 and 100;
select avg(tenure)
from churn 
where monthlycharges>=60 and monthlycharges<=100;

select avg(tenure)
from churn 
where monthlycharges between 60 and 100;

-- Find the number of customers those who are in Contract as month-to-month and one year
-- they are not churn  and prefer using mailed check and bank transfer and payment method.

select count(*)
from churn_data
where contract in ('month-to-month', 'one year')
and 
churn  = 'no'
and 
paymentmethod in ('mailed check', 'Bank Transfer (automatic)');

-- Operator: Like
use hr;
select * from employees;

-- Find the employees whoes name starts with 'a'
select *
from employees
where first_name like 'a%';

-- Find the number of employees having letter 'e' in 3rd position of the first_name and doesn't have 'a' in their last name.
select count(*)
from employees
where first_name like '__e%' and last_name not like '%a%';

-- Group By
select phoneservice, avg(monthlycharges) as avg_month
from churn 
where churn = 'yes'
group by phoneservice;

-- Find which kind of contract is having more churn customers?
select contract, count(*)
from churn
where churn = 'yes' 
group by contract;

-- order by asc, desc

select contract, count(*)
from churn
where churn = 'yes' 
group by contract
order by count(*) desc;

-- Which Payment Method generates maximum revenue(sum(totalcharges) for the company?
select paymentmethod, sum(totalcharges) as revenue
from churn 
group by paymentmethod
order by revenue desc;

select * from churn;

select dayofmonth(hire_date) from employees;
-- year
-- month
-- day

-- Find the department where avg(salary)>10000
select * from employees;

select department_id, avg(salary)
from employees
group by department_id
having avg(salary)>10000;

-- Having: To apply a filter on the grouped table
-- Where: To apply the filter on the main table

-- Find the payment method for which the avg(teneure) is more than 30 for non churn customers
use telecom;
select paymentmethod, avg(tenure)
from churn 
where churn  = 'no'
group by paymentmethod
having avg(tenure)>30
order by avg(tenure) desc;