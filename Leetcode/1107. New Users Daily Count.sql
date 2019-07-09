with login_rank as(
select *, rank() over (partition by user_id order by activity_date asc) as rn
from traffic
where activity = 'login'),

first_log_in as(
select *
from login_rank
where rn = 1),

recent_days as(
select *
from first_log_in
where activity_date >= '2019-04-01')


select activity_date as login_date,  count(distinct user_id) as user_count
from recent_days
group by activity_date
order by login_date