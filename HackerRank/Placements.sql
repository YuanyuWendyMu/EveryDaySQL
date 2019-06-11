select a.name
from
(select s.id, s.name, p.salary
 from students s
 left join packages p
 on s.id = p.id) as a
 join
 (select f.id, f.friend_id, p.salary
  from friends f
  left join packages p
  on f.friend_id = p.id
 )as b
 on a.id = b.id
 where a.salary < b.salary
 order by b.salary