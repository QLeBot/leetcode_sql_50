select a.machine_id, ROUND(AVG(e.end_time - s.start_time), 3) as processing_time
from Activity a
inner join (
    select machine_id, process_id, timestamp as end_time
    from Activity
    where activity_type = 'end'
) e on a.machine_id = e.machine_id and a.process_id = e.process_id
inner join (
    select machine_id, process_id, timestamp as start_time
    from Activity
    where activity_type = 'start'
) s on a.machine_id = s.machine_id and a.process_id = s.process_id
group by a.machine_id