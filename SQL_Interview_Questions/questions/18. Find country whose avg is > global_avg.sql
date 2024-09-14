-- A telecommunications company wants to invest in new countries. 
-- The company intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.

-- Write an SQL query to find the countries where this company can invest.


CREATE TABLE Person (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  phone_number VARCHAR(12)
);


CREATE TABLE Country (
  name VARCHAR(255),
  country_code VARCHAR(3) PRIMARY KEY
);

CREATE TABLE Calls (
  caller_id INT,
  callee_id INT,
  duration INT
);



-- solution:

with country_wise as (
select cn.name as country_name,
    avg(duration) over(partition by cn.country_code) as country_avg,
    avg(duration) over() as global_avg
from calls c
join person p on c.caller_id = p.id
join country cn on substr(p.phone_number,1,3) = cn.country_code
    )

select distinct country_name from country_wise

where country_avg > global_avg