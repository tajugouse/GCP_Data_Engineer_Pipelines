create table students (id int, name varchar(10));

insert into students values (1,'Mahi'),(2,'Mahendra'),(3,'Paresh'),(4,'Sam'),(5,'Rajesh');

create table friends (id int, friend_id int);

insert into friends values (1,2),(2,4),(3,5),(4,1),(5,3);

create table packages (id int, salary float);

insert into packages values (1, 12.5),(2,9.6),(3,16.2),(4,8.4),(5, 10.8);

select * from students;
select * from friends;
select * from packages;


## return students names whose friends are earning more salary than them.
