--find compartment pending count to fit in. 

create table crowd_info (
    crowd_id int,
    crowd_count int,
    compartment_id int,
    compartment_limit int
);


insert into crowd_info (crowd_id, crowd_count, compartment_id, compartment_limit) values
(1, 485, 101, 400),
(2, 358, 102, 300),
(3, 450, 103, 400),
(4, 380, 104, 200),
(5, 520, 105, 450),
(6, 265, 106, 250),
(7, 324, 107, 500),
(8, 203, 108, 150),
(9, 312, 109, 400),
(10, 233, 110, 100);


--first lets find pening_count(crowd_count-cmpartment_lmit)
-- lets find crowd_pending  and the cummulative row wise


select compartment_id, compartment_limit, total_pending, compartment_limit - total_pending  as rems from (
select *, sum(crowdpending) over(order by crowd_id) as total, sum(crowdpending) over() as total_pending
 from(
select *, crowd_count - compartment_limit as crowdpending from crowd_info)a)b



-- +----------+-------------+----------------+-------------------+
-- | crowd_id | crowd_count | compartment_id | compartment_limit |
-- +----------+-------------+----------------+-------------------+
-- |        1 |         485 |            101 |               400 |
-- |        2 |         358 |            102 |               300 |
-- |        3 |         450 |            103 |               400 |
-- |        4 |         380 |            104 |               200 |
-- |        5 |         520 |            105 |               450 |
-- |        6 |         265 |            106 |               250 |
-- |        7 |         324 |            107 |               500 |
-- |        8 |         203 |            108 |               150 |
-- |        9 |         312 |            109 |               400 |
-- |       10 |         233 |            110 |               100 |
-- +----------+-------------+----------------+-------------------+


-- +----------+-------------+----------------+-------------------+--------------+
-- | crowd_id | crowd_count | compartment_id | compartment_limit | crowdpending |
-- +----------+-------------+----------------+-------------------+--------------+
-- |        1 |         485 |            101 |               400 |           85 |
-- |        2 |         358 |            102 |               300 |           58 |
-- |        3 |         450 |            103 |               400 |           50 |
-- |        4 |         380 |            104 |               200 |          180 |
-- |        5 |         520 |            105 |               450 |           70 |
-- |        6 |         265 |            106 |               250 |           15 |
-- |        7 |         324 |            107 |               500 |         -176 |
-- |        8 |         203 |            108 |               150 |           53 |
-- |        9 |         312 |            109 |               400 |          -88 |
-- |       10 |         233 |            110 |               100 |          133 |





-- +----------+-------------+----------------+-------------------+--------------+-------+---------------+
-- | crowd_id | crowd_count | compartment_id | compartment_limit | crowdpending | total | total_pending |
-- +----------+-------------+----------------+-------------------+--------------+-------+---------------+
-- |        1 |         485 |            101 |               400 |           85 |    85 |           380 |
-- |        2 |         358 |            102 |               300 |           58 |   143 |           380 |
-- |        3 |         450 |            103 |               400 |           50 |   193 |           380 |
-- |        4 |         380 |            104 |               200 |          180 |   373 |           380 |
-- |        5 |         520 |            105 |               450 |           70 |   443 |           380 |
-- |        6 |         265 |            106 |               250 |           15 |   458 |           380 |
-- |        7 |         324 |            107 |               500 |         -176 |   282 |           380 |
-- |        8 |         203 |            108 |               150 |           53 |   335 |           380 |
-- |        9 |         312 |            109 |               400 |          -88 |   247 |           380 |
-- |       10 |         233 |            110 |               100 |          133 |   380 |           380 |
-- +----------+-------------+----------------+-------------------+--------------+-------+---------------+