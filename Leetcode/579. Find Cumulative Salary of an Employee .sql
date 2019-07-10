with salary_rk as(
select *, rank() over(partition by Id order by month desc) as rk
from employee),

selected_month as(
select *
from salary_rk
where rk<=4 and rk <> 1)

select Id as id, Month as month, sum(Salary) over(partition by Id order by Month) as Salary
from selected_month
order by Id, Month desc