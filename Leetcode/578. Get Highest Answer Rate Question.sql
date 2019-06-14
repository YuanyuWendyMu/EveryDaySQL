select question_id as survey_log
from(
select tbl1.question_id, tbl2.answered/ tbl1.total as rate
from
(select question_id, count(1)/2 as total
from survey_log
group by question_id) tbl1
join
(select question_id, count(answer_id) as answered
from survey_log
group by question_id
) tbl2
on tbl1.question_id = tbl2.question_id )
tbl3
order by rate desc
limit 1
