# Write your MySQL query statement below
select a.player_id, device_id
from activity a
join (
select player_id,min(event_date) as first_log_in from activity group by player_id) tbl1
on a.player_id = tbl1.player_id and a.event_date = tbl1.first_log_in

#Shorter code
select player_id, device_id
from activity
where (player_id, event_date) in (
                                select player_id, min(event_date)
                                from activity
                                group by player_id
                                 ) 