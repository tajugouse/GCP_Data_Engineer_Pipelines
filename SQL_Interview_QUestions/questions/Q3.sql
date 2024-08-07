--Given employee details with their ID, name, department, and respective salaries and department table with ID and name. Then find the employees who earn the lowest salaries in each department and return their department names also.


create table emp(emp_id int, emp_name varchar(30), dept_id int, salary int);

insert into emp values(1210, 'Venkatesh', 10, 25000),
(1218, 'Mohan', 12, 40000),(1250, 'Yogesh',18,55000),
(1245,'Mahesh',10,30000),(1301,'Sam',12,18000),
(1288,'Hemanth',10,42000),(1340,'Yashod',18,50000),
(1265,'Hazarath',16,40500),(1290,'Mahendra',16,24000);


create table dept (id int,dept_name varchar(30));

insert into dept values(10,'Data_Analyst'),(12,'Data_Engineering'),(16,'HR'),(18,'Software');


select emp_id, emp_name,id as dept_id, dept_name, salary from (
select e.emp_id, e.emp_name, d.id,d.dept_name, e.salary, dense_rank() over(
partition by d.dept_name order by e.salary asc) as rank from emp e join dept d
 on e.dept_id=d.id ) a where rnk=1 order by salary desc;


-- Find cummulative salary department wise


select e.emp_id, e.emp_name, d.id,d.dept_name, e.salary, sum(e.salary) over(
partition by d.dept_name order by e.salary asc) as cumilative_salary from emp e join dept d
on e.dept_id=d.id ;
