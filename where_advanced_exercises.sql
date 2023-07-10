use employees;
show tables;
describe employees;

select * from employees
where first_name
in ('Irena', 'Vidya', 'Maya');
-- created new table with list of employees with thoese 3 names

select * from employees
where first_name = 'Irena' 
or first_name = 'Vidya' 
or first_name 'Maya';
-- created new table with list of employees called only Irena 

select * from employees
where gender = 'M'
and first_name = 'Irena' 
or first_name 'Vidya' 
or first_name 'Maya';
-- Did not work for me? Formating wrong?

select distint * from employees
where last_name like 'e%';
-- created a new table with last names starting with e

select * from employees
where last_name like 'e%e';
-- created a new table with last names that start and end with execute

select * from employees
where last_name like '%e'
and last_name not like 'e%';
-- created a new table with last names that end in e but do not start with e 

select * from employees
where last_name like '%e'
or last_name like 'e%';
-- where last_name like 'e%' or like '%e';

describe employees;
select birth_date from employees;
select * from employees 
where birth_date
like '%-12-25';
-- 10078, 10115, 10261

select birth_date from employees;
select * from employees 
where birth_date
like '%-12-25';

describe employees;
select * from employees
where hire_date
between '1990-01-01' and '1999-12-31';
-- 10008, 10011, 10012

select * from employees 
where birth_date
like '%-12-25' and hire_date 
between '1990-01-01' and '1999-12-31';
-- 10261, 10438, 10681

select * from employees
where last_name 
like '%q%';
-- good

select * from employees
where last_name 
like '%q%' and 
last_name not like '%qu%';
-- good





