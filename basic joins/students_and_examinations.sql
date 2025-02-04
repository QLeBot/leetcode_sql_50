select st.student_id, st.student_name, su.subject_name, count(e.student_id) as attended_exams
from Students st
cross join Subjects su
left join Examinations e on e.student_id = st.student_id and e.subject_name = su.subject_name
group by st.student_id, su.subject_name, st.student_name
order by st.student_id, su.subject_name