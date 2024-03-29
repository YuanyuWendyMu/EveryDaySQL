set @r1=0, @r2=0, @r3=0, @r4=0;
/*set local variables*/
select min(Doctor), min(Professor), min(Singer), min(Actor)
from
(select case when Occupation = 'Doctor' then Name end as Doctor,
       case when Occupation = 'Professor' then Name end as Professor,
       case when Occupation = 'Singer' then Name end as Singer,
       case when Occupation = 'Actor' then Name end as Actor,
       /*Assign names to occupations*/
       case when Occupation = 'Doctor' then @r1 :=@r1+1
            when Occupation = 'Professor' then @r2 :=@r2+1
            when Occupation = 'Singer' then @r3 :=@r3+1
            when Occupation = 'Actor' then @r4 :=@r4+1 end as RowNumber
from occupations
order by name) as t
group by RowNumber