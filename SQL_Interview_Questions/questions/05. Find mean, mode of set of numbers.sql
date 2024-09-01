-- Find Mean, Mode of the given set of numbers.


create table numbers (
    id int primary key,
    num int
);
insert into numbers values (1, 3),(2, 8),(3, 2),
(4, 10),(5, 14),(6, 3),(7, 20),(8, 15),(9, 4),(10, 8),
(11, 6),(12, 3),(13, 10),(14, 22),(15, 3),(16, 8);

select * from numbers;


------25) Find Mean, Mode, and Median of the given set of numbers.

--mean: sum(num)/count(num)          ========> avg(num)
select (sum(num)/count(num)) as mean_of_numbers, avg(num) as averagre_numbers from numbers

-- --+-----------------+------------------+
-- | mean_of_numbers | averagre_numbers |
-- +-----------------+------------------+
-- |          8.6875 |           8.6875 |
-- +-----------------+------------------+

--- mode: a num that occure most frequest num of times.

select  num, count(*) as number_of_times from numbers group by num order by 2 desc;

-- +------+-----------------+
-- | num  | number_of_times |
-- +------+-----------------+
-- |    3 |               4 |
-- +------+-----------------+



