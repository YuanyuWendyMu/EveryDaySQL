# Write your MySQL query statement below

SELECT distinct l1.num  as ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num

#link back to the 603 Consecutive Available Seats
#Find three consecutive number: join three times