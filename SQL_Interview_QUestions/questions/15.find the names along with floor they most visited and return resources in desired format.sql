create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values 
    ('A','Bangalore','A@gmail.com',1,'CPU'),
    ('A','Bangalore','A1@gmail.com',1,'CPU'),
    ('A','Bangalore','A2@gmail.com',2,'DESKTOP'),
    ('B','Bangalore','B@gmail.com',2,'DESKTOP'),
    ('B','Bangalore','B1@gmail.com',2,'DESKTOP'),
    ('B','Bangalore','B2@gmail.com',1,'MONITOR');


-- name	address	    email	    floor	resources
-- A	Bangalore	A@gmail.com	    1	CPU
-- A	Bangalore	A1@gmail.com	1	CPU
-- A	Bangalore	A2@gmail.com	2	DESKTOP
-- B	Bangalore	B@gmail.com	    2	DESKTOP
-- B	Bangalore	B1@gmail.com	2	DESKTOP
-- B	Bangalore	B2@gmail.com	1	MONITOR

-- find the names along with floor they most visited and return resources in desired format 

with distinct_records as (
    select distinct name,resources from entries
    ),
grouped_records as (
    select name, GROUP_CONCAT(resources,',') as resources_used from distinct_records group by 1
    ),
total_visists as (
    select name,count(1) as total_visits, group_concat(resources,',') as used_resources from entries group by 1
    ),
most_visits as (
    select name, floor, count(1) as floor_visits,
    dense_rank() over(partition by name order by count(1) desc) as rn from entries 
    group by 1,2
    )
select mv.name,mv.floor,tv.total_visits,mv.floor_visits as most_visits,gr.resources_used
    from most_visits mv
join total_visists tv on mv.name = tv.name
join grouped_records gr on mv.name = gr.name

where mv.rn =1