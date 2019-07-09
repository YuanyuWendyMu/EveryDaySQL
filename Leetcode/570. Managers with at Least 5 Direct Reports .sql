select name
from(
select e2.name,count(e1.id) as report
from employee e1
join employee e2
on e1.managerid = e2.id
group by e2.name) t1
where report >=5