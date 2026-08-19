/*creating database*/

create database food_delivery;   -- creates database
use food_delivery;               -- use this database for next operations
show databases;                  -- display all the databases

/*creating tables*/

create table users(              -- creates table in the database
id int,
name varchar(50),
email varchar(50),
age int
);

/*inserting values*/

insert into users(id,name,email,age)    -- inserts the data after defining how much data we want to store
values (1,"Ayan","ayan123@gmail.com",18);
insert into users(id,name,age)        
values(2,"harry",35);
insert into users values(3,"Jonas",25);  -- Error bcz there is incomplete data 
insert into users values(3,"Jonas","Jonas21@gmail.com",25);

show tables;                -- shows tables in database
DESCRIBE users;