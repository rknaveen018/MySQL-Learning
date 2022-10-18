use hr;

select * 
from employees;

-- Find employees with salary > 15k
select employee_id, first_name, salary, department_id
from employees
where salary >15000;

-- Find the count of employees having salary > 15k
select count(*)
from employees
where salary >15000;

-- How many customers are there with monthly charges >100?
select count(customerID) 
from churn_data 
where MonthlyCharges > 100;

select * from employees;
select count(distinct job_id) from employees;

-- Find how many unique PaymentMethods are there in the Churn_data?
Select Count(distinct PaymentMethod)
From churn_data;

