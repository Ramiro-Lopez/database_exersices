use emloyees;
select * from employees;
-- problem 2
SELECT CONCAT(first_name, ' ', last_name) 
as full_name 
FROM employees
WHERE last_name 
LIKE 'e%e';

-- problem 3
SELECT CONCAT(UPPER(first_name), ' ', UPPER(last_name)) 
as full_name 
FROM employees
WHERE last_name 
LIKE 'e%e';

SELECT UPPER(CONCAT(first_name, ' ',last_name)) 
as full_name 
FROM employees
WHERE last_name 
LIKE 'e%e';

/*
SELECT UPPER(eployees.full_name)
FROM employees;*/

-- problem 4
SELECT COUNT(CONCAT(UPPER(first_name), ' ', UPPER(last_name))) 
as number_of_full_name 
FROM employees
WHERE last_name 
LIKE 'e%e';

-- problem 5 
SELECT DATEDIFF(hire_date, birth_date) AS num_days_working, 
CURDATE()
FROM employees
WHERE birth_date
LIKE '%-12-25'
AND hire_date
BETWEEN '1990-01-01' AND '1999-12-31';
-- how to use AS to lable two new tables 

-- problem 6 
SELECT * 
FROM employees.salaries;
-- used this to see table names
SELECT MIN(salary) FROM salaries;

SELECT MAX(salary) FROM salaries;

SELECT 
MAX(salary), as best_deal
MIN(salary) as bad_deal
FROM salaries.salary

/* A username should be all lowercase, 
consist of the first character of the employees first name,
 the first 4 characte*/
 
 SELECT birth_date FROM employees;
 
 SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1),
 SUBSTR(LOWER(last_name), 1, 4),
 '_', 
 SUBSTR(birth_date, 6,2),
 SUBSTR(birth_date, 3, 2)), 
 first_name,
 last_name,
 birth_date
 AS user_name
 FROM employees;
 
 


