use practice_database;

-- to view a records from table.
select * from employees_data;

-- to view a particular column in table.
select * from employees_data;

-- to view a record using conditions.
select * from employees_data where employee_id = 100;

-- to get min value from the record.
select min(salary) from employees_data;

-- to get max value from the record.
select max(salary) from employees_data;

-- to get avg value from the record.
select avg(salary) from employees_data;

-- to get count value from the record.
select count(employee_id) from employees_data;
select count(*) from employees_data;

-- to get around value from the record.
select round(avg(employee_id),2) from employees_data;

-- average salary in each department(group by).
select department_id, round(avg(salary),2) from employees_data group by department_id;

-- order by.
select department_id, round(avg(salary),2) from employees_data group by department_id order by round(avg(salary),2) asc;

-- where. used to apply filter in each records.
select * from employees_data where department_id=100;

-- having. used in aggretation function and group by function.
select department_id, round(avg(salary),2) from employees_data group by department_id having round(avg(salary),2) > 6500;

-- alias.
select department_id, round(avg(salary),2) as salary from employees_data group by department_id having salary = 6500;

-- between.
select department_id, round(avg(salary),2) as salary from employees_data group by department_id having salary between 6500 and 10150;

-- in.
select department_id, round(avg(salary),2) as salary from employees_data group by department_id having salary in (6500,7000);


-- and. with different column.
-- or. with same column.
-- not. for filtering out records that need not be in the filter.

select employee_id, department_id from employees_data where department_id = 90 or department_id=60;

select employee_id, department_id from employees_data where department_id = 90 and employee_id = 100;

select employee_id, department_id from employees_data where department_id = 90 and employee_id not in(100);

-- exist. 1st it will execute the subquery and compare the retured data with main query. 
-- any. larger than mininmum, smaller than maximum.
-- all. lesser than minimum, larger than maximum.

select employee_id from employees_data where exists (select department_id from department_data where department_id = 110 and department_data.department_id = employees_data.employee_id);

select employee_id, salary from employees_data where salary = any (select salary from employees_data where salary in (4200,4800,6000));

-- smaller than maximum returned by sub-query.
select employee_id, salary from employees_data where salary < any (select salary from employees_data where salary in (4200,4800,6000)) 
order by salary desc;

-- larger than mininmum returned by sub-query.
select employee_id, salary from employees_data where salary > any (select salary from employees_data where salary in (4200,4800,6000)) 
order by salary desc;

-- smaller than minimun value retuned by sub-query.
select employee_id, salary from employees_data where salary < all (select salary from employees_data where salary in (4200,4800,6000))
order by salary desc;

-- larger than maximun value retuned by sub-query.
select employee_id, salary from employees_data where salary > all (select salary from employees_data where salary in (4200,4800,6000))
order by salary desc;

-- like
-- ends with a.
select first_name from employees_data where first_name like '%a';

-- starts with a
select first_name from employees_data where first_name like 'a%';

-- a in any position.
select first_name from employees_data where first_name like '%a%';

-- starts and ends with a.
select first_name from employees_data where first_name like 'a%a';

-- starts with a and atleast 6 in length.
select first_name from employees_data where first_name like 'a______%';

-- ends with a and atleast 6 in length.
select first_name from employees_data where first_name like '%a______';