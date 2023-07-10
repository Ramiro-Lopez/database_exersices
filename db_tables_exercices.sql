/*
SHOW DATABASES;
USE albums_db;
SELECT database();
SHOW tables;
*/
-- SHOW databases;
USE employees;
SELECT database();
SHOW tables;
describe employees;
/* Numeric colums: 
emp_no
	String type:
first_name, laset_name, gender
	Data type:
birth_date, hire_date */
SHOW tables;
-- both departments and employees are tables within employees
CREATE TABLE dept_manager (
    column1_name data_type,
    column2_name data_type,
    ...
);
show databases;
USE albums_db;
select database();
show tables;
-- only thing here is a single table called albums
use employees;
-- if i want to switch databases you can just go to them directly 
show tables;
describe employees;
-- this employees is refering to a table not the schema
show create table dept_manager;
describe employees;
use employees;