create table students (id int, name varchar(10));

insert into students values (1,'Mahi'),(2,'Mahendra'),(3,'Paresh'),(4,'Sam'),(5,'Rajesh');

create table friends (id int, friend_id int);

insert into friends values (1,2),(2,4),(3,5),(4,1),(5,3);

create table packages (id int, salary float);

insert into packages values (1, 12.5),(2,9.6),(3,16.2),(4,8.4),(5, 10.8);

select * from students;
select * from friends;
select * from packages;


-- return students names whose friends are earning more salary than them.

-- First: lets find student information with first join p.id= f.id
-- second lets find freinds informatuon with self join p1.id = f.firiend_id
-- from cte lets collect all inof and join with student table to fetch student info cte.student_id = s.id

with cte as (
  select p.id as student_id, f.friend_id, p.salary as student_salary, p1.salary as friend_salary
  from packages p
  join friends f on p.id = f.id
  join packages p1 on f.friend_id = p1.id
)
select cte.student_id, cte.friend_id, cte.student_salary, cte.friend_salary, s.*
from cte
join students s on cte.student_id = s.id where friend_salary > student_salary;


