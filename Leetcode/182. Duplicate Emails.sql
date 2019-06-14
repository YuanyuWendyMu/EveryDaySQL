select Email
from
(select Email, count(1) as num_email
from Person
group by Email) t1
where num_email > 1