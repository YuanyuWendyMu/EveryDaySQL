select Department, Employee, Salary
from(
select e.Name as Employee ,Salary,e.DepartmentId,d.Name as Department , dense_rank() over(partition by DepartmentId order by Salary desc) as rk
from employee e
join department d
on e.DepartmentId  = d.Id) t1
where rk<=3