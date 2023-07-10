show databases;
USE employees;
show tables;
select * from titles;

-- problem 2
select distinct title, COUNT(title) 
from titles
group by title;

select title, COUNT(distinct title) FROM titles
group by title;

-- problem 3
select *
from employees
where last_name
like 'e%e'
group by last_name;

-- problem 4 
select distinct first_name, last_name
from employees
where last_name
like 'e%e';

-- problem 5 
select last_name
from employees
where last_name
like '%q%'
and last_name
not like '%qu%'
group by last_name;

-- problem 6 
select last_name, COUNT(*)
from employees
where last_name
like '%q%'
and last_name
not like '%qu%'
group by last_name;

-- problem 7 
USE employees;
select first_name, gender, COUNT(first_name)
from employees
where first_name
in ('Irena', 'Vidya', 'Maya')
group by first_name, gender;

SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1),
 SUBSTR(LOWER(last_name), 1, 4),
 '_', 
 SUBSTR(birth_date, 6,2),
 SUBSTR(birth_date, 3, 2)) as user_name
 FROM employees;

-- problem 8
 SELECT COUNT(*),
 CONCAT(SUBSTR(LOWER(first_name), 1, 1),
 SUBSTR(LOWER(last_name), 1, 4),
 '_', 
 SUBSTR(birth_date, 6,2),
 SUBSTR(birth_date, 3, 2)) as user_name 
FROM employees
group by user_name;

-- problem 9 
SELECT distinct (CONCAT(SUBSTR(LOWER(first_name), 1, 1),
 SUBSTR(LOWER(last_name), 1, 4),
 '_', 
 SUBSTR(birth_date, 6,2),
 SUBSTR(birth_date, 3, 2))) as user_name,  
COUNT(*)
FROM employees
group by user_name
having COUNT(*) > 1;

 