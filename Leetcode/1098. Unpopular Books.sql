with book_sales as(
select book_id, sum(quantity)as sales
from orders
where dispatch_date between dateadd(year,-1,'2019/06/23') and ' 2019/06/23'
group by book_id)

select b.book_id, b.name
from books b
left join book_sales bs
on bs.book_id = b.book_id
where (bs.sales < 10 or bs.sales is null)
and b.book_id not in (select book_id from books where available_from between dateadd(month, -1, '2019/06/23') and '2019/06/23')