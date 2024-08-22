

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

INSERT INTO customer_orders 
VALUES
    (1, 100, '2022-01-01', 2000),
    (2, 200, '2022-01-01', 2500),
    (3, 300, '2022-01-01', 2100),
    (4, 100, '2022-01-02', 2000),
    (5, 400, '2022-01-02', 2200),
    (6, 500, '2022-01-02', 2700),
    (7, 100, '2022-01-03', 3000),
    (8, 400, '2022-01-03', 1000),
    (9, 600, '2022-01-03', 3000);


select * from customer_orders;

-- order_id	customer_id	order_date	order_amount
-- 1	        100	    2022-01-01	    2000
-- 2	        200	    2022-01-01	    2500
-- 3	        300	    2022-01-01	    2100
-- 4	        100	    2022-01-02	    2000
-- 5	        400	    2022-01-02	    2200
-- 6	        500	    2022-01-02	    2700
-- 7	        100	    2022-01-03	    3000
-- 8	        400	    2022-01-03	    1000
-- 9	        600	    2022-01-03	    3000



-- solution:

with first_visit as (
    select customer_id, min(order_date) as first_visit_flag from customer_orders
    group by 1)
select co.order_date, 
    sum (case when co.order_date = f.first_visit_flag then 1 else 0 end ) as first_visits,
    sum(case when co.order_date != f.first_visit_flag then 1 else 0 end) as repeated_visits 
    from customer_orders as co
    join first_visit f on 
    co.customer_id= f.customer_id
group by 1


-- order_date	first_visits	repeated_visits
-- 2022-01-01	    3	                0
-- 2022-01-02	    2	                1
-- 2022-01-03	    1	                2
