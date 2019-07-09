select t1.product_id, t1.first_year,quantity, price
from sales s join (select product_id, min(year) as first_year from sales
group by product_id) t1
on t1.product_id = s.product_id and t1.first_year = s.year
