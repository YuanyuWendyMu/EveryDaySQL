# Write your MySQL query statement below


select ids as id, num_friends as num
from(
select ids, count(*) as num_friends
from
(select requester_id as ids from request_accepted
union all
select accepter_id from request_accepted) t1
group by ids)t2
order by num_friends desc
limit 1
