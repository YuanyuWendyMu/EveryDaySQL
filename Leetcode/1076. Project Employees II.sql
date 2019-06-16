# Write your MySQL query statement below
select project_id
from project
group by project_id
having count(distinct employee_id) =
(select count(distinct employee_id) as num_e
from project
group by project_id
order by num_e desc
limit 1)
