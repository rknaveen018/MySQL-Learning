use AdventureWorksDW2008R2;

select * from countries_data;

select count(country_name) from countries_data where REGION_ID = 1;

select * from job_data;

select JOB_ID from job_data where MIN_SALARY > 10000 and MAX_SALARY > 10000;

select * from employees_data;

select COUNT(EMPLOYEE_ID) from employees_data where FIRST_NAME like '_a%';

select SUM(SALARY) from employees_data where DEPARTMENT_ID = 60;

select DEPARTMENT_ID, AVG(SALARY) from employees_data group by DEPARTMENT_ID order by AVG(SALARY) DESC;

select COUNT(DEPARTMENT_ID), AVG(SALARY) from employees_data group by DEPARTMENT_ID having AVG(SALARY) > 10000;

select AVG(SALARY) from employees_data where DEPARTMENT_ID = 10 and YEAR(Hire_date) = 1987;

select COUNT(JOB_ID), AVG(SALARY) from employees_data group by JOB_ID having AVG(SALARY) > 20000;

select count(EMPLOYEE_ID) from employees_data where COMMISSION_PCT = '00:00:00.0000000';
