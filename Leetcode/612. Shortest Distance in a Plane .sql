# Write your MySQL query statement below
select round(sqrt(power((p1.x - p2.x),2) + power((p1.y-p2.y),2)),2) as shortest
from point_2d p1
join point_2d p2
on p1.x != p2.x or p1.y != p2.y
order by shortest asc
limit 1