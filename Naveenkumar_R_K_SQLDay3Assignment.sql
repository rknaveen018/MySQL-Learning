use AdventureWorksDW2008R2;

-- 1. How many departments are there where no employee is currently working

select COUNT(a.DEPARTMENT_ID) from department_data a left join employees_data b on
a.DEPARTMENT_ID = b.DEPARTMENT_ID where b.EMPLOYEE_ID IS NULL;

-- 2. Find the average salary of the Shipping Department

select AVG(SALARY) from employees_data where DEPARTMENT_ID in
(select DEPARTMENT_ID from department_data where DEPARTMENT_NAME = 'Shipping');

-- 3. Find the number of Accountant in the company

select COUNT(EMPLOYEE_ID) from employees_data where JOB_ID in 
(select JOB_ID from job_data where JOB_TITLE = 'Accountant');

-- 4. Find the average salary of the employees who started working in the year 1993

select AVG(SALARY) from employees_data where EMPLOYEE_ID in 
(select EMPLOYEE_ID from job_history_data where START_DATE like '1993%');

-- 5. Find the department name which is at postal code 26192

select DEPARTMENT_NAME from department_data where LOCATION_ID in
(select LOCATION_ID from locations_data where POSTAL_CODE = '26192');

-- 6. Find the number of employees who work at country_id = 'US'

select COUNT(a.EMPLOYEE_ID) from employees_data a inner join department_data b on
a.DEPARTMENT_ID = b.DEPARTMENT_ID where b.LOCATION_ID in 
(select LOCATION_ID from locations_data where COUNTRY_ID = 'US');

-- 10. Find the total commission paid by the Sales department

select SUM(a.COMMISSION_PCT) from employees_data a inner join department_data b on
a.DEPARTMENT_ID = b.DEPARTMENT_ID where b.DEPARTMENT_NAME = 'Sales';

-- 11. In which department_id did more than 40 percent of employees are working

select DEPARTMENT_ID, COUNT(EMPLOYEE_ID) *100 / (select COUNT(EMPLOYEE_ID) from employees_data) as Per_Emp
from employees_data group by DEPARTMENT_ID order by Per_Emp DESC;

-- 12. Which department more than 40% of the total salary is getting paid 

select DEPARTMENT_ID, ROUND(SUM(SALARY) * 100 / (select SUM(SALARY) from employees_data),0) as Per_Emp
from employees_data group by DEPARTMENT_ID order by Per_Emp DESC;

-- 13. What percentage of employees are managers

select EMPLOYEE_ID from employees_data where JOB_ID in
(select JOB_ID from job_data where JOB_TITLE like '%manager%');

select COUNT(EMPLOYEE_ID) * 100 / (select COUNT(EMPLOYEE_ID) from employees_data) from employees_data where JOB_ID in
(select JOB_ID from job_data where JOB_TITLE like '%manager%');

select COUNT(EMPLOYEE_ID) from employees_data where JOB_ID in
(select JOB_ID from job_data where JOB_TITLE like '%manager%');

