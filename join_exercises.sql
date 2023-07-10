show databases;
use join_example_db;
show tables;
select * from roles;
-- id(pk), name
select * from users;
-- id(pk), name, email, role_id
select roles.name as role_name, users.name as user_name 
FROM roles
LEFT join users 
on roles.id = users.id;
-- only 4 names appeard beacasue we did a left join using roles as our left table
select roles.name as role_name, users.name as user_name 
FROM roles
RIGHT join users 
on roles.id = users.id;
-- we have null values for role table(left table) because this was a right join. 
select roles.name as role_name, users.name as user_name 
FROM roles
RIGHT join users 
on roles.id = users.id
where roles.name 
or users.name
like 'a%';
-- this is an example of how to add agrigate functions 


