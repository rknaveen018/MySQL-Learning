-- contrains.
-- 1. Primary key. Accepts only unique values can't have muliple primary key in a table.
-- 2. Foreign key.
-- 3. unique key.  Accepts only unique values and can have muliple unique key in a table.
-- 4. default.	   if value not provided while inserting it will insert the default value.
-- 5. check.	   before inserting it will check the condition if matches insert will happen else it will through an error.
-- 6. not null.    value should be provided.

use employee;
create table emp_details (id int, emp_name varchar(10) not null, age int check(age > 18), primary key(id));

insert into emp_details values (1, 'naveen', 19);
insert into emp_details values (2, 'santhosh', 19);

select * from emp_details;

create table emp_detail (emp_id int, emp_location varchar(10) default 'india', emp_num int, emp_pan varchar(10) unique,
foreign key(emp_id) references emp_details(id));

insert into emp_detail (emp_id, emp_num, emp_pan) values (1, 8222, 'ER344E');
insert into emp_detail (emp_id, emp_num, emp_pan, emp_location) values (2, 8222, 'ER344F', 'Tirupur');

select * from emp_detail;

-- to describe a table.
desc emp_detail;

-- different ways to create constrains.
create table emp_details (emp_id int, emp_location varchar(10), emp_num int, emp_pan varchar(10));
create table emp_detail (id int, emp_name varchar(10), age int);

-- default.
create table emp_details (emp_id int, emp_location varchar(10) default 'india', emp_num int, emp_pan varchar(10));
alter table emp_details modify emp_location varchar(10) default "india";
alter table emp_details alter emp_location set default "india";

-- check.
create table emp_detail (id int, emp_name varchar(10), age int check(age>18));
create table emp_detail (id int, emp_name varchar(10), age int,
constraint check_age check(age>18));
alter table emp_detail modify age int check(age>18);
alter table emp_detail add check(age>18);


select position("n" in 'naveen');
select locate("n", 'naveen');

select concat('naveen', 'kumar');

select concat_ws('-','naveen', 'kumar');

select rpad('naveen', 15,'ab');
select lpad('naveen', 15,'ab');

select trim('   naveen    ');
select rtrim('   naveen    ');
select ltrim('   naveen    ');

select length('naveen');

select field('a', 'b', 'c', 'a','d');
select find_in_set('a', 'b,c,a,v');

select upper('naveen');
use practice_database;
select if(salary > 6000, 'average', 'not average') as salary from employees_data;