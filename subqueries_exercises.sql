USE employees;
show tables;

-- exercise 1
-- Find all the current employees with the same hire date as employee 101010 using a subquery.

-- find all current employees
select concat(first_name, ' ', last_name) as 'current employees',
hire_date
from 
employees as e
join dept_emp as de
on de.emp_no = e.emp_no
and de.to_date > now();

-- find all employees with the same hire date as 101010
select * from employees 
where hire_date = '1990-10-22';

-- add one query as a subquery
select concat(first_name, ' ', last_name) as 'current employees',
hire_date
from
	( 
	select * from employees 
	where hire_date = '1990-10-22'
	)
as e
join dept_emp as de
on de.emp_no = e.emp_no
and de.to_date > now();

-- exercise 2
-- Find all the titles ever held by all current employees with the first name Aamod.

-- Outer query: titles
SELECT * FROM titles LIMIT 2;

-- inner query: current employees named Aamod
SELECT 
	e.emp_no
FROM
	employees e
JOIN dept_emp de
	ON de.emp_no = e.emp_no
	AND de.to_date > NOW()
WHERE first_name = 'Aamod';


SELECT 
	title,
    COUNT(*)
FROM 
	titles
WHERE 
	emp_no IN (
		SELECT 
			e.emp_no
		FROM
			employees e
		JOIN dept_emp de
			ON de.emp_no = e.emp_no
			AND de.to_date > NOW()
		WHERE first_name = 'Aamod'
    )
GROUP BY title;

-- exersise 3
-- How many people in the employees table are no longer working for the company? 
-- Give the answer in a comment in your code.

-- this will give us our no longer working list 
select to_date as s
from dept_emp
where to_date < now();

-- used a join to get full names
select concat(first_name, ' ', last_name) as 'full name',
to_date
from dept_emp
join employees as e
using(emp_no)
where to_date 
in (select to_date 
from dept_emp
where to_date < now()
);

select count(*)
from employees e 
where emp_no 
not in (
select emp_no from dept_emp where to_date < now());

-- this one shows dates and employee # of everyone no longer working 
select COUNT(to_date)
from dept_emp
where to_date in 
(select to_date 
from dept_emp
where to_date < now()
);
-- no longer working 91479

SELECT 
	COUNT(*)
FROM 
	employees e
WHERE emp_no
NOT IN (
	-- inner query:
    SELECT emp_no FROM dept_emp
    WHERE to_date > NOW()
    );
-- count 59900

-- exercise 4
-- Find all the current department managers that are female. 
-- List their names in a comment in your code.

-- this will list only females
select gender 
from employees
where gender = 'F';

-- this gives me a list of all current managers, gender, and department 
select CONCAT(first_name, ' ', last_name) as 'full name',
gender, 
dept_name
from employees as e
join dept_manager as dm
using(emp_no)
join departments as d
using(dept_no)
where dm.to_date > now();


select CONCAT(first_name, ' ', last_name) as 'full name',
gender, 
dept_name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where gender in (select gender 
from employees
where gender = 'F') 
and 
dm.to_date > now();
-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- exercise 5
-- Find all the employees who currently have a higher salary than the companies overall, 
-- historical average salary.

-- show every employee and salary 
select CONCAT(first_name, ' ', last_name) as 'Full_name',
salary 
from employees as e
join salaries as s 
using(emp_no)
where salary > 63810.7448;

select AVG(salary)
from salaries;

select 
	CONCAT(first_name, ' ', last_name) as 'Full_name',
	salary 
from 
	employees as e
join 
	salaries as s 
using
	(emp_no)
join dept_emp as de
on de.emp_no = s.emp_no
where 
	salary > (select AVG(salary)from salaries)
and 
	de.to_date > now();


SELECT
	COUNT(*)
FROM 
	employees e
JOIN dept_emp de
	USING (emp_no)
JOIN salaries s
	USING (emp_no)
WHERE
	de.to_date > NOW()
    AND
    s.to_date > NOW()
	AND
    salary > 
    (
		SELECT 
		AVG(salary)
		FROM salaries
	);
-- returned 154543

-- exercise 6 
-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?

-- gives me the max salary of every employee 

SELECT MAX(salary), STDDEV(salary)
FROM salaries s
WHERE s.to_date > NOW();

SELECT MAX(salary) - STDDEV(salary) one_dev
FROM salaries s
WHERE s.to_date > NOW();


-- all current salaries
SELECT 
	COUNT(*)
FROM salaries
WHERE salaries.to_date > NOW()
AND salary >= (
	SELECT MAX(salary) - STDDEV(salary) one_dev
	FROM salaries s
	WHERE s.to_date > NOW()
	);

-- define first CTE as cur_sals, current salaries
WITH cur_sals AS (
SELECT salary
FROM salaries
WHERE salaries.to_date > NOW())
-- separate with a comma
,
-- second CTE as metrics
metrics AS (
-- metrics grabs max salary and std salary
-- for current salaries
SELECT MAX(salary) max_sal, STDDEV(salary) one_dev
FROM salaries s
WHERE s.to_date > NOW()
)
-- outer query:
-- grab the count from the current salaries
SELECT COUNT(*)
FROM cur_sals
-- under the specific condition
WHERE cur_sals.salary 
-- that the salaries are between
-- inner query 1: max - stddev (from metrics)
-- inner query 2: max (from metrics)
BETWEEN 
	(SELECT max_sal - one_dev FROM metrics) 
    AND 
	(SELECT max_sal FROM metrics);
-- 83

SELECT 
	COUNT(*)
FROM salaries
WHERE salaries.to_date > NOW()
AND salary >= (
	SELECT MAX(salary) - STDDEV(salary) one_dev
	FROM salaries s
	WHERE s.to_date > NOW()
	);
    
SELECT 1 + 1;
SELECT 4 / 5;
-- SELECT (numerator) / (denominator);
SELECT 
	ROUND(
	(
		SELECT 
			COUNT(*)
		FROM salaries
		WHERE salaries.to_date > NOW()
		AND salary >= (
			SELECT 
				MAX(salary) - STDDEV(salary) one_dev
			FROM 
				salaries s
			WHERE s.to_date > NOW()
	)
    )
/
	(
		SELECT 
			COUNT(*)
		FROM 
			salaries
		WHERE
			salaries.to_date > NOW()
    ) 
* 100, 2);
-- 0.03