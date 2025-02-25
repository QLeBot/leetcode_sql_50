select r.contest_id, round((COUNT(r.user_id) / (select COUNT(*) from Users))*100,2) as percentage
from Register as r
join Users as u
on r.user_id = u.user_id
group by r.contest_id
order by percentage desc, contest_id asc