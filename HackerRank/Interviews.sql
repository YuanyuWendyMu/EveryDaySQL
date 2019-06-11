select
con.contest_id,
con.hacker_id,
con.name,
sum(total_submissions),
sum(total_accepted_submissions),
sum(total_views),
sum(total_unique_views)
from Contests con
LEFT JOIN colleges col on con.contest_id = col.contest_id
LEFT JOIN Challenges cha on col.college_id = cha. college_id
LEFT JOIN
(select challenge_id,
        sum(total_views) as total_views,
        sum(total_unique_views) as total_unique_views
 from view_stats V
 group by challenge_id) temp1
on cha.challenge_id = temp1.challenge_id
LEFT JOIN
(select challenge_id,
        sum(total_submissions) as total_submissions,
        sum(total_accepted_submissions) as total_accepted_submissions
 from Submission_Stats S
 group by challenge_id) temp2
on cha.challenge_id = temp2.challenge_id
group by con.contest_id,con.hacker_id,con.name
having sum(total_views) != 0 or
       sum(total_unique_views) != 0 or
       sum(total_submissions) != 0 or
       sum(total_accepted_submissions) != 0
order by con.contest_id
