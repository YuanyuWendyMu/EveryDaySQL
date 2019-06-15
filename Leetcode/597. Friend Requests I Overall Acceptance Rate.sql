# Write your MySQL query statement below
select round(ifnull(
(select count(1) as accepted
from(
select count(1)
from request_accepted
group by requester_id ,accepter_id )tbl2
)
/
(select count(1) as send
from(
select count(1)
from friend_request
group by sender_id, send_to_id)tbl1),0),2)
as accept_rate