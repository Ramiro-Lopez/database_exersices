use employees;
describe employees;
select * from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
order by first_name;
-- Irena Reutenauer and Vidya Demeyer

select * from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
order by first_name
and last_name;
-- Vidya Awdeh and Vidya Skafidas

select * from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
order by last_name
and first_name;
-- Vidya Awdeh and Vidya Skafidas

select * from employees
where last_name like 'e%e'
order by emp_no;
/* ~501 employes returned
10021 Ramzi Erde
255285 Xudong Erie */

select * from employees
where last_name like 'e%e'
order by hire_date desc;
/* ~501 employes returned
67892 Teiji Eldridge
496264 Olivera Eldridge */

select * from employees 
where birth_date
like '%-12-25' and hire_date 
between '1990-01-01' and '1999-12-31'
order by hire_date;
/* ~363 employes returned
oldest Alselm Cappello
youngest Khun Bernini */

use employees;
describe employees;
select * from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
order by first_name;

use employees;
select * from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
order by first_name, last_name;