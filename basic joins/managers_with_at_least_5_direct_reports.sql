select e.name
from Employee e
where id in (
    select managerId
    from Employee e
    group by managerId
    having count(managerId) >= 5
)