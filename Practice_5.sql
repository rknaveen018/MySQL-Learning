use practice_database;

select employee_id, lag(salary) over(order by employee_id) from employees_data;

select employee_id, lead(salary) over(order by employee_id) from employees_data;