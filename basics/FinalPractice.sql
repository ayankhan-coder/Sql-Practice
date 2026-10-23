create database sqlPractice;
use sqlPractice;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT,
    grade CHAR(1)
);

INSERT INTO student (rollno, name, city, marks, grade)
VALUES
(1, 'Ayan', 'Bengaluru', 85, 'A'),
(2, 'Rahul', 'Mysuru', 65, 'C'),
(3, 'Priya', 'Bengaluru', 92, 'A'),
(4, 'Aman', 'Hubli', 55, 'D'),
(5, 'Sara', 'Mysuru', 78, 'B'),
(6, 'Kiran', 'Bengaluru', 72, 'B'),
(7, 'Neha', 'Hubli', 88, 'A'),
(8, 'Arjun', 'Mysuru', 45, 'F'),
(9, 'Meera', 'Bengaluru', 65, 'C'),
(10, 'Dev', 'Hubli', 95, 'A');

CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept (id, name)
VALUES
(1, 'CS'),
(2, 'Mechanical'),
(3, 'Electronics'),
(4, 'Civil');

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    deptid INT,
    FOREIGN KEY (deptid) REFERENCES dept(id)
);

INSERT INTO teacher (id, name, deptid)
VALUES
(101, 'Rahul', 1),
(102, 'Aman', 1),
(103, 'Priya', 2),
(104, 'Sara', 3),
(105, 'Kiran', NULL);




-- Level 1 — Easy: SQL fundamentals
-- Questions 1–12 · Focus: basic queries, filtering and sorting

select * from student;
select name, marks from student;
select distinct city from student;
select * from student where marks > 80;
select * from student where marks <= 65;
select * from student where city = "Bengaluru";
select * from student where city = "Mysuru" and marks > 70;
select * from student where marks between 60 and 90;
select * from student where city = "Bengaluru" or city = "Hubli";
select * from student order by marks desc;
select * from student order by marks desc limit 3;
select * from student order by city; -- i cant do this 😭

-- Level 2 — Easy to medium: Aggregates and grouping
-- Questions 13–22 · Focus: aggregate functions, GROUP BY and HAVING

select max(marks) from student;
select min(marks) from student;
select avg(marks) from student;
select count(rollno) from student;
select count(rollno) from student where city = "Bengaluru";
select count(distinct city) from student;
select city, count(rollno) from student group by city;
select city, avg(marks) from student group by city;
select city from student group by city having count(rollno) > 2;  -- i dont know if it is correct😭
select city, avg(marks) from student group by city having avg(marks) > 75 order by avg(marks) desc; -- this was challenging😵‍💫


-- Level 3 — Medium: Changing data and table structure
-- Questions 23–30 · Use a separate practice table so you don't accidentally damage your main data.

create database sql_practice;
use sql_practice;
create table employee(
id int primary key,
name varchar(50),
salary int,
city varchar(50));

insert into employee 
(id,name,salary,city) values
(101,"Bartosh",20000,"Bengaluru"),
(102,"Jonas",80000,"Mysuru"),
(103,"Martha",30000,"Pune"),
(104,"Mikkel",40000,"Pune");

set sql_safe_updates = 0;
update employee set salary = salary + 500;  
update employee set city = "Hyderabad" where id = 103;
delete from employee where id = 101;
alter table employee add column age int default 18;
alter table employee change name name varchar(100);

delete from employee where id = 101; -- it removes selected rows
truncate table employee;   -- it removes all the rows from the table
alter table employee drop column age; -- removes a column
alter table employee rename allEmployees; -- it renames the table but i have seen the ans bcz i could not recall
drop table allEmployees;  -- it deletes the table completly 

-- Level 4 — Medium: Joins and set operations
-- Questions 31–40 · Use the dept and teacher tables provided above.

select name , deptid from teacher;

select teacher.name ,dept.name
from teacher
inner join dept
on teacher.deptid = dept.id;

select * 
from teacher
left join dept
on teacher.deptid = dept.id;

select dept.name, teacher.name
from teacher
right join dept
on teacher.deptid = dept.id;

select teacher.name
from teacher
left join dept
on teacher.deptid = dept.id
where teacher.deptid is null;

select dept.name
from teacher 
right join dept
on teacher.deptid = dept.id
where teacher.id is null;

select name from teacher union select name from dept;
select name from teacher union all select name from dept;


select teacher.name , dept.name 
from teacher
inner join dept
on teacher.deptid = dept.id;


select dept.name , teacher.name
from dept
left join teacher
on teacher.deptid = dept.id;
select * from teacher;
select * from dept;

select teacher.name
from teacher
left join dept 
on teacher.deptid = dept.id
where teacher.deptid is null;

