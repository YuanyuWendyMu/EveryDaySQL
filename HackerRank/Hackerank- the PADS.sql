select concat(name, '(', substring(occupation, 1, 1), ')') as names
from OCCUPATIONS
order by names;

select concat('There are a total of ',count(1),' ', lower(occupation),'s.')
from occupations
group by occupation
order by count(1), occupation