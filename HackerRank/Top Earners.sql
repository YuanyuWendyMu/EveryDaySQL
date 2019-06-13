select salary*months as earnings,count(name)
from employee
group by 1
having earnings = (select max(salary*months)from employee)