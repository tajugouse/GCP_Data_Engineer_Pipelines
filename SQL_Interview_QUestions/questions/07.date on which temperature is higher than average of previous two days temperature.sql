--date on which temperature is higher than average of previous two days temperature


create table weather_data (
    date date,
    temperature int
);

insert into weather_data values ('2024-04-15', 40),('2024-04-16', 42),('2024-04-17', 38),
('2024-04-18', 36),('2024-04-19', 38), ('2024-04-20', 45),('2024-04-21', 46),('2024-04-22', 40),
('2024-04-23', 41),('2024-04-24', 43),('2024-04-25', 39),('2024-04-26', 37), ('2024-04-27', 42);




--using lag

--find 2 lags as lag1 and lag2 
-- (lag1+lag2)/2 as average
-- find dates where tem > average.

 with cte as(
 select *, lag(temperature, 1)  over(order by date) as one_day_pre_temp, 
 lag(temperature, 2) over(order by date) as two_day_pre_temp from 
 weather_data)
 select date from cte where temperature > (one_day_pre_temp + two_day_pre_temp)/2



