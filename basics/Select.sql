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










