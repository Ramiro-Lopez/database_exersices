-- Write a query that returns all employees, their department number, their start date, 
-- their end date, and a new column 'is_current_employee' that is a 1 if the employee 
-- is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

use employees;
select 
	dept_no, 
	from_date,
	to_date, 
    IF(to_date > now(), True, False) as 'is_current_employee'
from
dept_emp;


-- write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter 
-- of their last name.

select * from employees;

SELECT
	last_name,
    CASE
       WHEN substr(last_name, 1,1) in ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') THEN 'A-H'
       WHEN substr(last_name, 1,1) in ('I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q') THEN 'I-Q'
       ELSE 'R-Z'
   END AS 'alpha_group'
FROM employees;

-- How many employees (current or previous) were born in each decade?

SELECT
	COUNT(birth_date) as num_of_birthdays,
    CASE
        WHEN birth_date <= '1959-12-31' THEN 50
        WHEN birth_date >= '1960-01-01' THEN 60
        ELSE 'other'
    END AS 'decade'
FROM employees
group by decade;

-- What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

select
    round(avg(salary),2) as avg_salary,
  case 
		when dept_name IN ('research','development') then 'R&D'
        when dept_name IN ('sales','marketing') then 'Sales & Marketing'
        when dept_name IN ('Production', 'Quality Management') then 'Prod & QM'
        when dept_name IN ('Finance', 'human resources') then 'Finance & HR'
        else dept_name
end as dept_group
from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > now() and dept_emp.to_date>now()
group by dept_group;
