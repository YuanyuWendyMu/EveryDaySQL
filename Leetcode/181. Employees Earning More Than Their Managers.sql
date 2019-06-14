select e1.name as Employee
from employee e1
left join employee e2
on e1.ManagerId = e2.Id
where e1.salary > e2.salary