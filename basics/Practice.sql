CREATE DATABASE sql_practice;
USE sql_practice;

CREATE TABLE students (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO students
(rollno, name, marks, grade, city)
VALUES
(101, 'Ayan', 78, 'C', 'Pune'),
(102, 'Bhumika', 93, 'A', 'Mumbai'),
(103, 'Chetan', 85, 'B', 'Mumbai'),
(104, 'Dhruv', 96, 'A', 'Delhi'),
(105, 'Emanuel', 12, 'F', 'Delhi'),
(106, 'Farah', 82, 'B', 'Delhi'),
(107, 'Gaurav', 91, 'A', 'Pune'),
(108, 'Hina', 67, 'D', 'Mumbai'),
(109, 'Ishaan', 88, 'B', 'Delhi'),
(110, 'Jiya', 74, 'C', 'Pune');

-- 🟢 Level 1 — Basic
select * from students;
select name, marks from students;
select * from students where marks > 80;
select * from students where city = "Delhi";
select * from students where marks between 70 and 90;
select * from students where city = "Mumbai" or "Pune";          -- wrong
select * from students where city = "Mumbai" or city = "Pune";   -- correct
SELECT * FROM students WHERE city IN ("Mumbai", "Pune");         -- more better
select distinct city from students;
select * from students order by marks desc;
select * from students order by marks desc limit 3;  

-- 🟡 Level 2 — Combining clauses
select name,marks from students where marks > 80;
select name,marks from students where marks > 80 and city = "Delhi";
select * from students where city = "Delhi" order by marks desc limit 3;
select name,marks from students where city = "Pune" and marks between 70 and 90; 	
select * from students where city not in ("Mumbai","Delhi");

-- 🟠 Level 3 — Aggregate Functions

select max(marks) from students;
select min(marks) from students;
select avg(marks) from students;
select count(rollno) from students;
select count(rollno) from students where city = "Delhi";
SELECT COUNT(DISTINCT city)
FROM students;

-- 🔵 Level 4 — GROUP BY
select city,count(rollno) from students group by city;
select city, avg(marks) from students group by city;
select city, max(marks) from students group by city;
select grade, count(rollno) from students group by grade;
select grade, avg(marks) from students group by grade;
select city, avg(marks) from students group by city order by marks asc;   	   -- wrong
select city, avg(marks) from students group by city order by avg(marks) asc;   -- Correct

-- 🔴 Level 5 — HAVING
select city,count(rollno) from students group by city having count(rollno) > 3;
select city, max(marks) from students group by city having max(marks) > 90;
select grade, avg(marks) from students group by grade having avg(marks) > 80;
select city, count(rollno) from students group by city having min(rollno) > 3; -- this one was difficult

-- 🧠 Final Challenge — Putting everything together
select name,avg(marks) from students group by name having avg(marks) > 70;
SELECT AVG(marks)
FROM students
WHERE city = "Delhi"
AND marks > 70;
select city, avg(marks) from students group by city having avg(marks) > 75;
select grade, max(marks) from students group by grade having max(marks) > 90;
select name,max(marks) from students where city = "Mumbai" group by city having max(marks) order by max(marks)desc; -- i dont fucking know
select * from students where city = "Mumbai" order by marks desc limit 2; -- simple correct 
select city,count(rollno), avg(marks)from students group by city having avg(marks) > 75; -- yeah this was challenging\


alter table student 
add column age int default 18;

alter table student
modify fullName varchar(30);

alter table student
change  fullName name varchar(30);

alter table students
drop column age;

