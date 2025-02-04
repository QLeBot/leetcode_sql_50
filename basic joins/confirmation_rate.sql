select s.user_id, 
CASE
    WHEN sub.number_confirmed / sub2.number_total is null THEN 0
    ELSE ROUND(sub.number_confirmed / sub2.number_total, 2)
END as confirmation_rate
from Signups s
left join Confirmations c on s.user_id = c.user_id
left join (
    select user_id, count(action) as number_confirmed
    from Confirmations
    where action = 'confirmed'
    group by user_id
) sub on c.user_id = sub.user_id
left join (
    select user_id, count(action) as number_total
    from Confirmations
    group by user_id
) sub2 on c.user_id = sub2.user_id
group by user_id

--User submitted solution (92% beat):
select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
from Signups as s left join Confirmations as c on s.user_id= c.user_id group by user_id;