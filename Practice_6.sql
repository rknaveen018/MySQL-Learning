use practice_database;

select department_id, employee_id from employees_data order by department_id;

select distinct(department_id), first_value(employee_id) over(partition by department_id) as first_employee from employees_data;

select distinct(department_id), last_value(employee_id) over(partition by department_id) as first_employee from employees_data;