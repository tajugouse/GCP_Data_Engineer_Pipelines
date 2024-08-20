

create table t1 (id int);
create table t2 (id int);

insert into t1 values
(1),
(1),
(2),
(2),
(4),
(null);

insert into t2 values
(1),
(1),
(1),
(3),
(2),
(2),
(null);

select * from t1;
select * from t2;



--solution 

-- inner join: 2*3 + 2*2 = 10
select count(*) from t1 inner join t2 on t1.id=t2.id

-- left join: 2*3 + 2*2 + 1 + 1 = 12
select count(*) from t1 left join t2 on t1.id=t2.id


-- right join: 2*3 + 2*2 + 1 + 1 = 12
select count(*) from t1 right join t2 on t1.id=t2.id


-- Full join: 2*3 + 2*2 + 1 + 1 + 1 + 1 = 14
select count(*) from t1 full join t2 on t1.id=t2.id