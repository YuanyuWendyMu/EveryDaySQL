with first_log_in as(
select player_id, min(event_date) as first_log_in
from activity
group by player_id),

logback as(
select count(distinct a1.player_id) num1
from first_log_in a1
join activity a2
on a1.player_id = a2.player_id and datediff(day,a1.first_log_in, a2.event_date) = 1),

total_users as
(select count(distinct player_id) as num2 from activity)

select round(CAST(logback.num1 as float) / CAST(total_users.Num2 as float),2) as fraction
from logback, total_users

