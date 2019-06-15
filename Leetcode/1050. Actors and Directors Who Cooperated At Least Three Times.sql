select actor_id, director_id
from(
select actor_id, director_id, count(1)as num_cop
from ActorDirector
group by actor_id, director_id
having num_cop >=3)tbl1