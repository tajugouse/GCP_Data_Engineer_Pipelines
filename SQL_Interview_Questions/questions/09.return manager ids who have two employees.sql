CREATE TABLE employees_info (
  empid INT PRIMARY KEY,
  empname VARCHAR(50),
  mgrid INT,
  salary DECIMAL(10, 2)
);


INSERT INTO employees_info (empid, empname, mgrid, salary) VALUES
  (1, 'John Smith', NULL, 100000.00),
  (2, 'Jane Doe', 1, 80000.00),
  (3, 'Bob Johnson', 1, 70000.00),
  (4, 'Alice Brown', 2, 60000.00),
  (5, 'Mike Davis', 2, 55000.00),
  (6, 'Emily Chen', 3, 50000.00),
  (7, 'David Lee', 3, 45000.00),
  (8, 'Sarah Taylor', 4, 40000.00),
  (9, 'Kevin White', 5, 35000.00),
  (10, 'Lisa Nguyen', 6, 30000.00),
  (11, 'Tom Harris', 7, 25000.00),
  (12, 'Rachel Kim', 8, 20000.00);

-- solution 

select mgrid,empname,count(empid) as num_of_emplys from employees_info 
group by 1 
having count(empid) >= 2;


-- Find Managers whose salary is higher than the average salaries of their direct reporting employees.


with cte as
(
select a.*, b.empname as manager_name, b.salary as manager_salary 
from employees_info a join employees_info b 
on a.mgrid = b.empid and a.mgrid ! = a.empid
), 
cte2 as (
select manager_name, manager_salary, avg(salary) avg_salary_employees 
from cte group by manager_name, manager_salary
)
select manager_name from cte2 where manager_salary > avg_salary_employees