select
case
     when (A+B >C and A+C > B and B+C > A) then
          case
               when A=B and B=C then 'Equilateral'
               when A=B  OR A=C OR B=C then 'Isosceles'
               WHEN A <> B and B <> C THEN 'Scalene' end
     else 'Not A Triangle' end
from TRIANGLES 