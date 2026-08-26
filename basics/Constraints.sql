/* Constraints are rules that we apply to a table's columns to
control what kind of data can be stored.*/

use school;

create table temp1(
id int not null,       	   -- not null/ Prevents NULL values
rollNum int,
mobileNum bigint unique,   -- unique/ Prevents duplicate value
salary int default 30000,  -- default/ Gives a column a default value
age int,
constraint age_check check (age >= 18),   -- Ensures a condition is true
primary key(rollNum)       -- primary key unique/notnull Uniquely identifies a row
);

insert into temp1 values(10,9,9620868617,2000,20);
insert into temp1 values(20,8,4567891254,1000,23);
insert into temp1 (id,rollNum,mobileNum) values (30,7,4578214569);  -- salary not entered so it takes default value
insert into temp1 (id,rollNum,mobileNum,age) values (30,7,4578214569,15); -- error because of check constraint age is below 18
select * from temp1;

-- show tables;
-- drop table temp1;

