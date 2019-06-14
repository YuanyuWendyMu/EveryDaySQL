# Write your MySQL query statement below
select min(nullif(distance,0)) as shortest
from
(select abs(p1.x-p2.x) as distance
from point p1, point p2) tbl1

#There are better ways to do this
#Leetcode solution
SELECT
    MIN(ABS(p1.x - p2.x)) AS shortest
FROM
    point p1
        JOIN
    point p2 ON p1.x != p2.x