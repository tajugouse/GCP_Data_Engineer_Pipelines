-- write a query to find the second highest avg of (emp & manager) and print in pair format as below output

-- +----------------------------------+------------+
-- | concat(empname,':',manager_name) | average    |
-- +----------------------------------+------------+
-- | dash:sam                         | 71000.0000 |
-- +----------------------------------+------------+


CREATE TABLE employee (
  empid INT,
  empname VARCHAR(255),
  mgrid INT,
  salary INT
);

INSERT INTO employee (empid, empname, mgrid, salary) VALUES
  (1, 'mahendra', 2, 25000),
  (2, 'mahi', 5, 20000),
  (3, 'sam', NULL, 45000),
  (4, 'dev', 1, 20000),
  (5, 'dash', 3, 97000),
  (6, 'Pratik', 6, 30000),
  (7, 'singh', 2, 40000),
  (8, 'Rao', 5, 80000);


-- Solution:

with cte as (select e.*,e1.empname as manager_name,e1.salary as manager_salary,((e.salary+e1.salary)/2) as average from employee e join employee e1 on e.mgrid = e1.empid)

select concat(empname,':',manager_name), average from cte order by average desc limit 1,1;

-- or 

-- we can use dense_rank() over(order by average) as cte 2 and select all where rn = 2;
