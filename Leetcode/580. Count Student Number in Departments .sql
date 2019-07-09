select dept_name, student_number
from department de
join
(
select d.dept_id, ifnull(num_student, 0) as student_number
from department d
left join(
select dept_id, count(student_id) as num_student
from student
group by dept_id) t1
on d.dept_id = t1.dept_id) t2
on de.dept_id = t2.dept_id
order by student_number desc, dept_name