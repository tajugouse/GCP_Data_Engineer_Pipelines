-- Print numbers same number of times as VALUES

-- exm
-- 1 1
-- 2 2
-- 2 2
-- 3 3
-- 3 3
-- 3 3


create table numbers(
    n int
);

insert into numbers VALUES
(1),
(2),
(3),
(4),
(5),
(7),
(9);


select * from numbers;


with recursive cte as (
    select n as counter from numbers

    union all

    select counter+1 from cte
    where counter+1<=n
)

select * from cte;
