SHOW databases;
USE albums_db;
show tables;
describe albums;
-- primary key for albums_db is "id"
-- name likly represents song names
-- sales likly represents # of albums sold 
select name from albums;
describe albums;
select sales from albums;
describe albums;
select name, release_date
from albums;
describe albums;
select genre, artist, name
from albums 
where name = 'Nevermind';
-- Grunge, Alternitave Rock 
-- Sgt, pepper's lonely hearts club band was relesed in 1976
select * 
from albums
where artist = 'Pink Floyd';
describe albums;
select name, release_date 
from albums
where release_date between '1990' and  '1999';
describe albums;
select name, artist, sales
from albums
where sales < '20';