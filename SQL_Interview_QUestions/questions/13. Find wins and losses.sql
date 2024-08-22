
-- Find each team how many matches it played, wins and loses as below format

-- team	matches_played	wins	losses
-- IN	    2	         2	        0
-- NZ	    1	         1	        0
-- ENG	    2	         1	        1
-- AUS	    2	         1	        1
-- SL	    2	         0	        2
-- SA	    1	         0	        1

create table icc_world_cup
(
    team_1 varchar(20),
    team_2 varchar(20),
    winner varchar(20)
);
    
insert into icc_world_cup
values 
('IN','SL','IN'),
('SL','AUS','AUS'),
('SA','ENG','ENG'),
('ENG','NZ','NZ'),
('AUS','IN','IN');


select * from icc_world_cup;



SELECT 
  team, 
  COUNT(*) AS matches_played, 
  SUM(CASE WHEN team = winner THEN 1 ELSE 0 END) AS wins, 
  COUNT(*) - SUM(CASE WHEN team = winner THEN 1 ELSE 0 END) AS losses
FROM 
  (
  SELECT team_1 AS team, winner FROM icc_world_cup
  UNION ALL
  SELECT team_2 AS team, winner FROM icc_world_cup
  ) a
GROUP BY team
ORDER BY wins DESC;


