select class
from(
select class, count(distinct student) as num
from courses
group by class
having num>=5) tbl1