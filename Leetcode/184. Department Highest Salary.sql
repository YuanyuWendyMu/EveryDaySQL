# Write your MySQL query statement below
select department.name as Department , employee.name as Employee,employee.Salary
from department
join employee
on employee.departmentid = department.id
join
(select departmentid,max(salary) as m
from employee
group by departmentid) maxsalary
on employee.salary = maxsalary.m and employee.DepartmentId = maxsalary.departmentid