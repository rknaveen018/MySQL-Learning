-- SQL-3

-- Joins: Left, Right, Inner
-- Subquery: On Where

-- Agenda SQL-4
-- Select in Select
-- Wrapper
-- Window
-- Case When

use telecom;
select * from churn;
select * from customer;
select * from internet;

select count(distinct customerid) from churn;
-- Find the gender wise avg tenure for the customers who don't use DSL or No Internet service, have a partner, they have not churned.

select b.gender, avg(a.tenure)
from churn a 
inner join customer b 
on a.customerid = b.customerid
where a.customerid in (select customerid from internet where internetservice not in ('DSL', 'No') )
and 
b.partner = 'Yes'
and 
a.churn = 'No'
group by b.gender;

-- Select in Select 
-- Percentage of Churn customers: 100*(Number of churn customers/Total number of customer)
select 100*count(*)/(select count(*) from churn) as churn_precent from churn
where churn  = 'Yes';

-- Find the percentage of customers under each payment method used by non churn customers.
select * from churn;

select paymentmethod, concat(100*count(*)/(select count(*) from churn where churn  = 'No'), "%") as percent_cust
from churn 
where churn  = 'No'
group by paymentmethod;

-- Find the percentage of customers not using internet service and have not churned.
select 100*count(*)/(select count(*) from churn) as percent
from churn
where customerid in (select customerid from internet where internetservice = 'No')
and churn = 'No';

-- Warraper Technique
use hr;

select * from employees;

-- Find the total number of employees working in those department where avg(salary)>10000
select sum(x.cnt)
from (
select department_id, avg(salary) as avg_sal, count(*) as cnt
from employees
group by department_id
having avg(salary)>10000 ) x;

use telecom;
select * from churn;
select * from internet;
select * from customer;

-- Find the total number of customers using those payment methods for which the avg tenure is more than 30 and have no dependents or partner.
-- Include those who are non-churn
select sum(x.cnt)
from (
select paymentmethod, avg(tenure), count(*) as cnt
from churn
where customerid in (select customerid from customer where partner = 'no' and dependents = 'no')
and churn = 'no'
group by paymentmethod
having avg(tenure)>30) x;

use hr;
select * from employees;

-- Write the window function to get the department wise avg salary as a part of the same table.
select *, avg(salary) over(partition by department_id) as avg_sal
from employees;

-- Rank the employees according to their salaries in their respective departments.
select * from (
select *, rank() over(partition by department_id order by salary desc) as rank_
from employees) x
where x.rank_ = 1;

use telecom;
select * from churn;

select *, case
			when monthlycharges>=0 and monthlycharges <50 then 'A'
            when monthlycharges>=50 and monthlycharges<100 then 'B'
            else 'C'
		end as level_
from churn;
		





































































