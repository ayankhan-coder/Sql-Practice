/*A foreign key in MySQL is a column (or set of columns)
that creates a relationship between two tables*/

create database sbrclg;
use sbrclg;

create table dept(
id int primary key,
name varchar(50));

create table teacher(
id int primary key,
name varchar(50),
deptid int,
foreign key (deptid)
references dept(id)
on delete cascade
on update cascade);

INSERT INTO dept VALUES
(1, "Computer Science"),
(2, "Mechanical"),
(3, "Electronics");

INSERT INTO teacher VALUES
(101, "Rahul", 1),
(102, "Aman", 1),
(103, "Priya", 2),
(104, "Sara", 3);

insert into teacher values (105,"John",2);
insert into teacher values (106,"David",10); -- wont work because department number 10 doesnot exists
delete from dept where id = 1; -- all the teacher data will be deleted which belongs to department 1
update dept set id = 20 where id = 2; -- priya dept id will be changed to 20

select * from dept;
select * from teacher; 
