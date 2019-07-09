select sum(TIV_2016) as TIV_2016
from insurance
where PID not in(
select s1.PID
from insurance s1 join insurance s2 on s1.PID != s2.PID
where s1.LAT = s2.LAT AND s1.LON  = s2.LON )
and PID in (
select s1.PID
from insurance s1 join insurance s2 on s1.PID != s2.PID
where s1.TIV_2015  = s2.TIV_2015)