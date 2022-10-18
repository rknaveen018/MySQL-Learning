use AdventureWorksDW2008R2;

--How many managers are there in the Sales department

select COUNT(DISTINCT MANAGER_ID) from employees_data 
where JOB_ID in (select JOB_ID from job_data where JOB_TITLE like '%manager%') 
and DEPARTMENT_ID in (select department_id from department_data where DEPARTMENT_NAME = 'Sales');

-- Find the average salary of "Clerk". Important: Consider all the clerks in the company

select AVG(SALARY) from employees_data where JOB_ID in 
(select JOB_ID from job_data where JOB_TITLE like '%clerk%');

/* If a department has a count of employees < 1, then it's known as a "0" level department. 
If it's greater equal to 1 but less than 25, then "A". 
If it's greater than equal to 25 but less than 35 then "B". 
If it's greater than equal to 35 but less than 50 then "C" else "D"
Based on the above information, find the count of level-A departments */ 

select COUNT(a.AVG_SALARY) as Level_A_departments from 
(select DEPARTMENT_ID,
(case
when COUNT(EMPLOYEE_ID) < 0 then '0'
when COUNT(EMPLOYEE_ID) between 1 and 25 then 'A'
when COUNT(EMPLOYEE_ID) between 25 and 35 then 'B'
when COUNT(EMPLOYEE_ID) between 35 and 50 then 'C'
ELSE 'D'
END) as AVG_SALARY
from employees_data  GROUP BY DEPARTMENT_ID)as a where a.AVG_SALARY = 'A';

/* If an employee is having a salary of less than 2000, then he/she is at rank "D".
If the salary is >= 2000 but less than 10000, then he/she is at rank "C".
If the salary is >=10000 but less than 20000, then he/she is at rank "B" else rank "A".

Based on the above information, find the number of employees under A, B, C, and D */

select emp_rank, COUNT(a.EMPLOYEE_ID) from
(select EMPLOYEE_ID, case
when SALARY < 2000 then 'D'
when SALARY between 2000 and 10000-1 then 'C'
when SALARY between 10000 and 20000-1 then 'B'
ELSE 'A'
END as emp_rank
from employees_data) as a group by a.emp_rank;

-- Find the number of employees having rank-1 in all the departments.

select COUNT(a.emp_rank) from
(select DEPARTMENT_ID, EMPLOYEE_ID, RANK() OVER(PARTITION BY DEPARTMENT_ID order by EMPLOYEE_ID) as emp_rank 
from employees_data) as a group by a.emp_rank having a.emp_rank = 1;

--Find the salary of the employee whose phone number starts with 515 and works at Administration department.

select EMPLOYEE_ID, SALARY from employees_data
where PHONE_NUMBER like '515%' and DEPARTMENT_ID in 
(select DEPARTMENT_ID from department_data 
where DEPARTMENT_NAME = 'Administration');

-- Find the Name of the Sales Representative with the 7th highest salary in the Sales department.

select FIRST_NAME, SALARY
from employees_data
where JOB_ID in(select JOB_ID from job_data
where JOB_TITLE = 'Sales Representative') order by SALARY desc;

-- Find the number of employees working in Canada

select COUNT(a.EMPLOYEE_ID) from employees_data a inner join department_data b on 
a.DEPARTMENT_ID= b.DEPARTMENT_ID
where b.LOCATION_ID in
(select LOCATION_ID from locations_data
where COUNTRY_ID in ( select COUNTRY_ID from countries_data where COUNTRY_NAME = 'canada'));

-- How many employees are working in the department located at India

select a.DEPARTMENT_ID, COUNT(a.EMPLOYEE_ID) as count_EMP from employees_data a inner join department_data b on
a.DEPARTMENT_ID = b.DEPARTMENT_ID where b.LOCATION_ID in 
(select LOCATION_ID from locations_data where COUNTRY_ID in 
(select COUNTRY_ID from countries_data where COUNTRY_NAME = 'India')) group by a.DEPARTMENT_ID;

-- Find the number of employees working in Sales department but earning less than 7000

select DEPARTMENT_ID, COUNT(EMPLOYEE_ID) from employees_data 
where DEPARTMENT_ID in (select DEPARTMENT_ID from department_data
where DEPARTMENT_NAME ='Sales') and SALARY < 7000 group by DEPARTMENT_ID;