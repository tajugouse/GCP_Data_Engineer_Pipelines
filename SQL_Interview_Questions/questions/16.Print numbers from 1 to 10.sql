-- print numbers from 1 t0 10 


with recursive cte as (
    select 1 as number

    union all
    
    select number+1 from cte
    where number+1 <=10
)

select * from cte