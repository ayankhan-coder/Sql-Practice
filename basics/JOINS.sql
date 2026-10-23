/*JOINs are used to combine data from two or more
tables based on a related column between them*/

create database if not exists kct;
use kct;
create table if not exists student(
id int not null,
name varchar(25));

create table if not exists course(
studentid int not null,
course varchar(20));

insert into student values
(101,"adam"),
(102,"bob"),
(103,"casey");

insert into course values
(102,"mechanical"),
(103,"computer ccience"),
(105,"electrical"),
(107,"civil");

-- INNER JOIN --- 
 /*INNER JOIN is used to retrieve only the matching records 
from two tables based on a common column*/

select * 
from student
inner join course
on student.id = course.studentid;

select name from student
inner join course
on student.id = course.studentid;

select * 
from student as s
inner join course as c 
on s.id = c.studentid;

-- LEFT JOIN --
/*Returns all records from the left table,
 and the matched records from the right table*/
 
select * from student-- leftTable
left join course -- rightTable
on student.id =course.studentid;

-- RIGHT JOIN -- 
/*Returns all records from the right table,
and the matched records from the left table*/

select * from student -- rightTable
right join course -- leftTable
on student.id = course.studentid;

-- FULL JOIN -- 
/*Returns all records when there is a match
in either left or right table*/

select *  from student
left join course
on student.id = course.studentid
union
select * from student
right join course
on student.id = course.studentid;	

-- Left Exclusive Join -- 

select * from student
left join course
on student.id = course.studentid
where course.studentid is null;

-- RIGHT EXCLUSIVE JOIN --

select * from student
right join course
on student.id = course.studentid
where student.id is null;

-- FULL EXCLUSIVE JOIN -- 

select * from student as s 
left join course as c
on s.id = c.studentid
where c.studentid is null
union
select * from student as s 
right join course as c 
on s.id = c.studentid
where s.id is null;


-- UNION -- 
/*It is used to combine the result-set of two or more SELECT statements.
Gives UNIQUE records*/

select id from student
union -- it gives unique 	
select studentid from course;

select id from student
union all	-- it allows duplicates/gives all 
select studentid from course;


-- SELF JOIN -- 
/*A SELF JOIN joins a table with itself to compare or connect 
records within that same table.*/

create table employee(
id int,
name varchar(30),
managerId int);

insert into employee
(id,name,managerId) values
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"donald",103);

select a.name as managerName , b.name
from employee as a
join employee as b
on a.id = b.managerId;



-- INNER JOIN 
select student.name , course.course
from student
inner join course
on student.id = course.studentid;


select s.name, c.course
from student as s
inner join course as c
on s.id = c.studentid;


-- practice for innner join

select * 
from student 
inner join course
on student.id = course.studentid;

select student.id , student.name , course.course
from student
inner join course
on student.id = course.studentid;

select student.name, course.course
from student 
inner join course
on student.id = course.studentid
where course.course = "mechanical"; -- you did not taught me about where and asking questions 😅

select s.name , c.course
from student as s
inner join course as c
on s.id = c.studentid;

select student.name , course.course
from student
inner join course
on student.id = course.studentid
order by course.course;  

-- LEFT JOIN 

select * 
from student
left join course
on student.id = course.studentid;

select student.name , course.course
from student
left join course
on student.id = course.studentid;

select * 
from student as s
left join course as c
on s.id = c.studentid;

select student.name, course.course
from student
left join course
on student.id = course.studentid
where course.course = "mechanical";

select *
from student
left join course
on student.id = course.studentid
where course.studentid is null;


select student.name, course.course
from student
left join course
on student.id = course.studentid
order by student.name;

-- RIGHT JOIN 
select * 
from student 
right join course
on student.id = course.studentid;

select student.name,course.course
from student 
right join course
on student.id = course.studentid;

select *
from student 
right join course
on student.id = course.studentid
where student.id is null;


-- FULL OUTER JOIN 

select * 
from student
left join course
on student.id = course.studentid
union 
select * 
from student 
right join course
on student.id = course.studentid;


select 	* from student
left join course
on student.id = course.studentid
where course.studentid is null
union
select * from student
right join course
on student.id = course.studentid
where student.id is null;


-- SELF JOIN 


select e.name as empName, m.name as ManagerName
from employee as e
join employee as m
on e.id = m.Managerid;

SELECT e.name AS employee,
       m.name AS Manager
FROM employee AS e
JOIN employee AS m
ON e.Managerid = m.id
where m.name = "Rahul";

select e.id, e.name , m.name
from employee as e
join employee as m
on e.Managerid = m.id
order by e.id;

