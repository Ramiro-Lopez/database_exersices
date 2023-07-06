show databases;
use employees;
show tables;
select * from titles;
SELECT DISTINCT title FROM titles;
describe titles;
show tables;
describe titles;
select distinct last_names from employees;
select * from employees;
select distinct last_name from employees
order by last_name desc limit 10;

select * from employees 
where birth_date
like '%-12-25' and hire_date 
between '1990-01-01' and '1999-12-31'
order by hire_date limit 5;
-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

select * from employees 
where birth_date
like '%-12-25' and hire_date 
between '1990-01-01' and '1999-12-31'
order by hire_date limit 5 offset 50;