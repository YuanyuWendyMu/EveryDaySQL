select t1.Request_at as Day, round(cast(count(t2.Id) as float)/ cast(count(t1.Id) as float),2) as [Cancellation Rate]
from
(select *
from trips
where Client_Id in (select users_id from users where Banned = 'No' and Role = 'client')
      and Driver_Id in (select users_id from users where Banned = 'No' and Role = 'driver')
      and Request_at between '2013-10-01' and '2013-10-03') t1
left join (
    select * from trips
    where status = 'cancelled_by_driver' or status = 'cancelled_by_client' ) t2 on t1.Id = t2.Id
group by t1.Request_at