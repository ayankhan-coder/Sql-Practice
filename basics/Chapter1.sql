/*creating database*/

create database if not exists food_delivery;   -- creates database
use food_delivery;               -- use this database for next operations
show databases;                  -- display all the databases

/*creating tables*/

create table users(              -- creates table in the database
id int,
name varchar(50),
email varchar(50),
age int
);
show tables;                    -- shows tables in database
drop table if exists tableName; -- drops the table

/*inserting values*/

insert into users(id,name,email,age)    -- inserts the data after defining how much data we want to store
values (1,"Ayan","ayan123@gmail.com",18);

insert into users(id,name,age)        
values(2,"harry",35);

insert into users values(3,"Jonas",25);  -- Error bcz there is incomplete data 
insert into users values(3,"Jonas","Jonas21@gmail.com",25);

insert into users values
(4,"Martha","martha2@gmail.com",20),
(5,"Adam","adam96@gmail.com",50),
(6,"Mikkel","mikkel@gmail.com",12);

insert into users(name,age,id,email)
values("Claudia",85,7,"claudia8@gmail.com");

select * from users;        -- retrieves all the data from the users table

DESCRIBE users;             -- describes the structure of table


