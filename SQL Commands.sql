create database pg41;
use pg41;
show tables;

create table students(
s_id int,
name varchar(10),
age int,
location varchar(50));

select * from students;

show create table students; 

# CREATE 

create table if not exists student_info(
s_id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20),
email varchar(100) unique,
age int not null check(age>20),
location varchar(25) default "mumbai");

describe student_info;

create table course_details(
id int primary key,
c_id varchar(5) not null,
c_name varchar(30) not null,
foreign key(id) references student_info(s_id)
on delete cascade on update no action);

create table employees(
e_id int primary key auto_increment,
e_name varchar(20) not null,
email varchar(100) unique,
age int not null check(age>21),
city varchar(20) default "Mumbai",
salary int,
department varchar(20) not null);

describe employees;

# INSERT 

select * from student_info; 

insert into student_info(first_name, email, age)
values ("Ria","riya1243@gmail.com", 23);

insert into student_info(first_name, email, age)
values("Rohan", "rohanshah40@gmail.com",32),
("Kshitij","kshitijgupta0@gmail.com", 28),
("Vansh","vanshgupta69",99);

select current_date();

select * from employees;

alter table employees
add bonus varchar(20);

alter table employees
add new_joins varchar(20) default "D1" after e_id;

alter table employees
drop bonus;

alter table employees
rename to employees_info;


truncate table employees_info;
select * from employees_info;

insert into students
 values(101,"Aryan",21,"Mumbai");
 
select * from students;
 
rollback;
select * from students;

select * from students;

insert into students
values(1,"Rohan",32,"Pune"),
(2,"Kshitij",28,"Mumbai"),
(3,"Vansh",99,"Pune");

select * from students;

update students
set age = age + 1;

select * from students;

update students
set location = "Bangalore"
where location = "Hyderabad";

select * from students;

update students
set location = "Gujraat"
where location = "Pune"
limit 1;

select * from students;

alter table employees_info
drop new_joins;

select  * from employees_info; 

insert into employees_info(e_id, e_name, age, city, department)
values(1,"Rohan",32,"Pune", "Malad"),
(2,"Kshitij",28,"Mumbai","Malad"),
(3,"Vansh",99,"Pune","Malad");
	
alter table employees_info
 drop email; 
 
 alter table employees_info
 drop salary;
 
 