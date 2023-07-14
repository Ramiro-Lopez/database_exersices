show databases;
use robinson_2286;
show tables;

-- exercise 1
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
where employees.dept_emp.to_date > now();

select * from employees_with_departments;

select max(length(CONCAT(first_name ' ', last_name)))
from employees.employees;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

update employees_with_departments
set full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE employees_with_departments drop column
first_name;

ALTER TABLE employees_with_departments drop column
last_name;

-- exersise 2
use sakila;
show tables;
select * from payment limit 1;

CREATE TEMPORARY TABLE payment_table AS
SELECT payment_id, amount 
FROM sakila.payment;

select * from payment_table;

describe payment_table;
  
update payment_table 
set amount = amount * 100;
-- how to change the data type 
ALTER TABLE payment_table 
MODIFY amount decimal(10.2);

update payment_table 
set amount = amount * 100;

-- exercise 3

USE employees;

SELECT 
	dept_name,
    AVG(salary) AS dept_avg
FROM 
	employees.departments d
JOIN employees.dept_emp de
	USING(dept_no)
JOIN employees.salaries s
	USING(emp_no)
WHERE 
	de.to_date > NOW()
	AND 
    s.to_date > NOW()
GROUP BY dept_name;

CREATE TEMPORARY TABLE dept_avgs (
SELECT 
	dept_name,
    AVG(salary) AS dept_avg
FROM 
	employees.departments d
JOIN employees.dept_emp de
	USING(dept_no)
JOIN employees.salaries s
	USING(emp_no)
WHERE 
	de.to_date > NOW()
	AND 
    s.to_date > NOW()
GROUP BY dept_name);

-- thing 2:
-- get the metrics that I want to compare these vals with
-- avg overall salary
-- stddev overall salary

DROP TABLE IF EXISTS metrics;


-- build the query that gets those things:
CREATE TEMPORARY TABLE metrics (
SELECT
	AVG(salary) AS overall,
    STDDEV(salary) AS stdv
FROM 
	employees.salaries s
WHERE to_date > NOW());

-- lets add some new fields into our department
--  average table

-- adding new fields, thats a strutural change
-- which means that we want to use an alter

-- mean values:
ALTER TABLE dept_avgs
ADD overall_avg FLOAT;

-- stdev values
ALTER TABLE dept_avgs
ADD overall_std FLOAT;

-- z values
ALTER TABLE dept_avgs
ADD zscore FLOAT;

SELECT * FROM dept_avgs;

-- put values in cells that are already there:
-- UPDATE!
UPDATE dept_avgs
SET overall_avg = 
	(
    SELECT overall FROM metrics
    );
    
SELECT * FROM dept_avgs;

UPDATE dept_avgs
SET overall_std = 
	(
    SELECT stdv FROM metrics
    );

SELECT * FROM dept_avgs;

UPDATE dept_avgs
SET zscore = 
(dept_avg - overall_avg) / overall_std;

SELECT dept_name, zscore FROM dept_avgs
ORDER BY zscore DESC;


