/* SELECT is used to produce or retrieve a result.
The result can come from a table, or it can be calculated directly.*/

use food_delivery;

select * from users;               -- retrieves all columns and rows
select name from users;            -- retrieves specific columns
select email from users;
select name,age from users;

-- where , and , or , not --
-- select using where
select * from users where age > 18;        -- retrieving with specific condition       
select * from users where name = "Ayan";
select name from users where age < 18;
select name from users where age != 18;

select * from users where name = "Jonas" and age > 18;    --  and 

select * from users where age < 15 or name = "Mikkel";    -- or
select name from users where not age = 18;                --  not 
select email from users where not age > 20;

SELECT 10 + 20;           -- select is not only for retrieving data

select name as andachor from users; -- a temporary name of column output 
select age as hello from users;

select distinct age from users;
select * from users;

insert into users 
(name , email, age, id)
values
("Spider","spider@gmail.com",25,8);











