-- DDL  create, alter, drop, truncate.
-- DML  insert, update, delete.
-- DCL  grant, revoke.
-- DQL 	select.
-- TCL  Commit, rollback, savepoint.

-- check available database
show databases;

-- create database if doesn't exist.
create database if not exists people;

-- to use database.
use people;

-- check available tables.
show tables;

-- to create a table.
create table details (p_name varchar(10), age int);

-- rename a table.
alter table details rename to people_details;

-- rename a column.
alter table people_details rename column age to people_age;

-- to add column to the table.
alter table people_details add column people_name varchar(10);
alter table people_details add column people_location varchar(10);

-- add multiple column to the table.
alter table people_details add column people varchar(10), add people_num int;

-- to drop a column.
alter table people_details drop p_name;

-- to move column to first.
alter table people_details modify column people_id int;
alter table people_details modify column people_name varchar(10) after people_id;

-- to insert records to the table.
insert into people_details values (1, 'Naveen', 23, 'Tirupur');
insert into people_details values (1, 'Santhosh', 23, 'Salem'), (1, 'Dinesh', 23, 'Salem');
insert into people_details (people_name, people_location, people_age) values ('Renga', 'Madurai', 23);

-- update records.
set sql_safe_updates = 0;
update people_details set people_id = 2 where people_name = 'Santhosh';
update people_details set people_id = 3 where people_name = 'Dinesh';
update people_details set people_id = 4 where people_name = 'Renga';

-- delete a create.
delete from people_details where people_id = 4;

-- truncate.
truncate table people_details;

-- drop table and database.
drop table people_details;
drop database people;