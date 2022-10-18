use practice_database;

-- joins.
-- inner join. returns the matching records from one or more table.
select * from employees_data;
select * from department_data;

select a.DEPARTMENT_ID, a.EMPLOYEE_ID, b.DEPARTMENT_NAME from employees_data a inner join department_data b
on a.DEPARTMENT_ID = b.DEPARTMENT_ID where b.DEPARTMENT_NAME = 'IT';

-- left join. return all records from left table and return matching records from right table. 
select * from employees_data;
select * from department_data;

select a.DEPARTMENT_ID, a.EMPLOYEE_ID, b.DEPARTMENT_NAME from employees_data a left join department_data b
on a.DEPARTMENT_ID = b.DEPARTMENT_ID;

-- right join return all records from right table and matching records from left table.
select a.DEPARTMENT_ID, a.EMPLOYEE_ID, b.DEPARTMENT_NAME from employees_data a right join department_data b
on a.DEPARTMENT_ID = b.DEPARTMENT_ID;

-- union. without duplicates combile two or more table if same number of column and datatype is matches
-- union all. with duplicates combile two or more table if same number of column and datatype is matches
create table emp (id int, name_ varchar(10));
create table emp_d (id_val int, f_name varchar(10));
insert into emp_d values (1,'naveen'), (2, 'santhosh');
insert into emp values (1,'dinesh'), (3, 'naveenk');
select * from emp;
select * from emp_d;
select * from emp union  select * from emp_d;

select * from emp union all select * from emp_d;
-- Case.

select salary, 
case
	when salary < 4000 then 'earning less than average'
    when salary > 4000 and salary < 8000 then 'earning average'
    when salary > 8000 then 'earning more than average'
end as salary_ from employees_data;

-- (wrapping function) select in select.

select a.salary, a.salary_ from (
select salary, 
case
	when salary < 4000 then 'earning less than average'
    when salary > 4000 and salary < 8000 then 'earning average'
    when salary > 8000 then 'earning more than average'
end as salary_ from employees_data) a where a.salary_ = 'earning average';

-- insert in select.
create table employee (emp_name varchar(20), emp_salary int);

insert into employee (emp_name,emp_salary) select first_name, salary from employees_data;

select * from employee;
truncate table employee;

call insert_function('naveen', 23000);
call insert_function('santhosh', 23000);

create view select_view as
select salary from employees_data;

create view select_ as
select employee_id, salary from employees_data where salary > 6000;

select * from select_view;
select * from select_ where salary = 13000;
