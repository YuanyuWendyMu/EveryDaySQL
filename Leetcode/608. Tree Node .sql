select id,
       case when ifnull(p_id,0) = 0 then 'Root'
            when id in (select p_id from tree)then 'Inner'
            else 'Leaf' end as type
from tree
