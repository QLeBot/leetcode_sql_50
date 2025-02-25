select p.project_id, ROUND(SUM(e.experience_years)/COUNT(e.name), 2) as average_years
from Project p
left join Employee e
on p.employee_id = e.employee_id
group by project_id