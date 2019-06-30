# Write your MySQL query statement below
SELECT
(case when mod(id,2) = 1 and counts != id then id+1
     when mod(id,2)= 1 and counts =id then id
     else id-1 end) as id,
     student

FROM
    seat,
    (SELECT
        COUNT(*) AS counts
    FROM
        seat) AS seat_counts
order by id asc