select project_id, employee_id
from(
select project_id, p.employee_id, e.experience_years, dense_rank() over( partition by p.project_id order by experience_years desc ) as rank
from project p
left join employee e
on p.employee_id = e.employee_id) t1
where t1.rank =1