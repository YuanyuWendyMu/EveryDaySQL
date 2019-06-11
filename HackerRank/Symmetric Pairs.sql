select f1.x, f1.y
from functions f1, functions f2
where (f1.x = f2.y and f1.y = f2.x)
group by f1.x, f1.y
having (f1.x <f1.y or count(f1.x)>1)
order by f1.x asc