select DISTINCT city
from station
where city REGEXP '^[AEIOU].*[AEIOU]$'