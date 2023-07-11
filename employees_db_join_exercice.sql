show databases;
use employees;
show tables;
-- exercise 2 we want a new table displaying dpartment name and departmant manager
-- department name from dept_name
-- department manager from titles (current)
-- department manager name from employees
select dept_name as department_name,
CONCAT(e.first_name, ' ', e.last_name) as department_manager
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no
and dm.to_date > now()
join employees as e
on e.emp_no = dm.emp_no
order by dept_name;

-- exercise 3 
-- Find the name of all departments currently managed by women.
select dept_name as department_name,
CONCAT(e.first_name, ' ', e.last_name) as department_manager
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no
and dm.to_date > now()
join employees as e
on e.emp_no = dm.emp_no
where e.gender
= 'F'
order by dept_name;

-- exercise 4
-- Find the current titles of employees currently working in the Customer Service department.
select title as Title, 
count(dept_name) as 'Count'
from titles as t
join dept_emp as de
on t.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where dept_name
= 'Customer Service'
and de.to_date > now()
and t.to_date > now()
group by title
order by title;

-- exercise 5 
-- Find the current salary of all current managers.
select dept_name as department_name,
CONCAT(e.first_name, ' ', e.last_name) as department_manager,
salary as Salary
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no
join employees as e
on e.emp_no = dm.emp_no
join salaries as s
on s.emp_no = e.emp_no
where s.to_date > now()
and dm.to_date > now()
order by dept_name;

-- exercise 6 
-- Find the number of current employees in each department.
use employees;
select de.dept_no,
d.dept_name, 
count(e.emp_no) as num_employees
from departments as d
join dept_emp as de
on d.dept_no = de.dept_no
join employees as e
on e.emp_no = de.emp_no
where de.to_date > now()
group by dept_name
order by dept_no;

-- exercise 7 
-- Which department has the highest average salary? Hint: Use current not historic information. 
select d.dept_name, 
AVG(s.salary) as average_salary 
from departments as d
join dept_emp as de
using(dept_no)
join salaries as s 
using(emp_no) 
where s.to_date > now()
and de.to_date > now()
group by dept_name
order by average_salary desc
limit 1;
-- Answer 
-- Sales, 88852.9695

-- exercise 8 
-- Who is the highest paid employee in the Marketing department?
select e.first_name, 
e.last_name 
from employees as e
join salaries as s
on e.emp_no = s.emp_no 
join dept_emp as de
on de.emp_no = s.emp_no
join departments as d
on de.dept_no = d.dept_no
where dept_name
= 'Marketing'
and de.to_date > now() 
and s.to_date > now()
order by s.salary desc
limit 1;

-- exercise 9 highest paid manager 
-- Which current department manager has the highest salary?
select e.first_name, 
e.last_name,
s.salary, 
d.dept_name
from employees as e
join salaries as s 
on s.emp_no = e.emp_no
join dept_manager as dm
on dm.emp_no = s.emp_no
join departments as d
on d.dept_no = dm.dept_no
where s.to_date > now()
and dm.to_date > now()
order by s.salary desc
limit 1;

-- exercise 10 
-- Determine the average salary for each department. Use all salary information and round your results.
select d.dept_name, 
round(avg(s.salary)) as average_salary 
from departments as d
join dept_emp as de
on d.dept_no = de.dept_no
join salaries as s 
on s.emp_no = de.emp_no 
group by dept_name
order by average_salary desc;

-- exercise 11 
-- Find the names of all current employees, their department name, and their current manager's name.
select CONCAT(e.first_name, ' ', e.last_name) as 'employee name',
d.dept_name, 
CONCAT(yees.first_name, ' ', yees.last_name) as 'manager name'
from employees as e
join dept_emp as de 
on de.emp_no = e.emp_no 
and de.to_date > now()
join departments as d
using (dept_no)
join dept_manager as dm
using (dept_no)
join employees as yees
on yees.emp_no = dm.emp_no
and dm.to_date > now();
