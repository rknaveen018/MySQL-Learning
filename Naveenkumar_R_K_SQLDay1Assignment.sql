use AdventureWorksDW2008R2;

select count(EMPLOYEE_ID) from employees_data;

select AVG(SALARY) from employees_data;

select COUNT(EMPLOYEE_ID) from employees_data where JOB_ID = 'IT_PROG';

select COUNT(EMPLOYEE_ID) from employees_data where SALARY > 15000;

select COUNT(department_id) from department_data;



