/* SELECT is used to produce or retrieve a result.
The result can come from a table, or it can be calculated directly.*/

CREATE DATABASE college;
USE college;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select * from student;               -- retrieves all columns and rows
select name from student;            -- retrieves specific columns
select rollno,name,city from student;

SELECT 10 + 20;           -- select is not only for retrieving data

select name as StudentNames from student;   -- A temporary name of column output 
select city as address from student;

select distinct city from student;   -- DISTINCT is used to remove duplicate values from the result.
select distinct grade from student; 

-- WHERE CLAUSE - is used to filter rows based on a condition.
-- using operators in where

select * from student where marks > 80;
select name from student where city = "Pune";

select * from student where marks + 10 > 100;   -- we can also perform Math operation 

select * from student where marks > 70 and city = "Pune";   -- and operator
select * from student where marks = 10 and city = "Pune";

select * from student where marks > 90 or city = "Mumbai";  -- or operator 

select * from student where not city = "Mumbai";            -- not operator

select * from student where marks between 50 and 80;   -- BETWEEN is used to check whether a value is within a specific range.
select * from student where grade between "A" and "C";

select * from student 
where city in ("Pune","Mumbai","Bangalore");   -- IN is used to check if a value matches any value in a list.

select * from student 
where city not in ("Mumbai","Pune"); -- NOT IN is used to select rows where a value does NOT match any value in a given list.

select * from student limit 3;  -- LIMIT is an SQL clause used to control how many rows are returned.
select * from student where city = "Delhi" limit 2;

select * from student order by marks asc;  -- order by sorts the result in asc,desc order 
select name,marks from student order by marks desc limit 3;

-- ~~~~ AGGREGATE FUNCTIONS ~~~~ -- 
-- Aggregate functions perform a calculation on multiple rows and return one result.

select max(marks) from student;
select min(marks) from student;
select avg(marks) from student;
select count(name) from student;

select count(name) from student where city = "Delhi";
select count(distinct city) from student;

-- GROUP BY CLAUSE -- used to combine rows that have the same value into groups,
select city from student group by city;
select city, count(rollno) from student group by city;
select city, max(marks) from student group by city;
select city, min(marks) from student group by city;

select city,name, count(name)from student group by city,name;

select city, avg(marks) from student
group by city order by city asc;

select city, count(rollno) from student group by city;
select city, avg(marks) from student group by city;
select grade, max(marks) from student group by grade;

select grade,count(rollno)
from student 
group by grade 
order by grade;

-- HAVING CLAUSE -- The HAVING clause in SQL is used to filter groups after GROUP BY.

select city , count(rollno)
from student 
group by city
having max(marks) > 95;

select grade, avg(marks) from students group by grade having avg(marks) > 80;
select city, count(rollno) from students group by city having min(rollno) > 3;
select city from student where grade = "A" group by city having max(marks) > 90;

-- UPDATE -- UPDATE is used to modify existing data in a database table.

set sql_safe_updates = 0;  -- to turn off the safe mode
set sql_safe_updates = 1;  -- to turn on the safe mode

update student
set grade = "o"
where grade = "A";

update student
set name = "Dhruv Rathee"
where rollno = 104;
select * from student;

update student set marks = 82 where rollno = 105;
update student set grade = "B" where marks between 80 and 90;

update student set marks = marks + 1;

-- DELETE -- to delete rows
delete from student where name = "Chetan";
delete from student;  -- deletes all rows


-- Foreign key in another file -- 

-- ALTER -- is used to change the structure of an existing database object, most commonly a table.

alter table student 
add column age int default 18;  -- adds a new column in table

alter table student
drop column age;     -- drops column in table

alter table student
rename to bacche;    -- renames the table 

alter table bacche
rename to student;

alter table student
change name naamyadaam varchar(50);  -- renames the column name

alter table student 
change naamyadaam name varchar(50);

alter table student
modify name varchar(20);          -- modify the datatype 

-- TRUNCATE -- Deletes all the data of Table
truncate table student;






















	









