select c.Name
from
(
select candidateId, count(id) as votes
from vote
group by candidateId
order by votes desc
limit 1
) as wc
join Candidate c
on wc.candidateId = c.id
