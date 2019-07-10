# Write your MySQL query statement below

select t1.pay_month, t1.department_id,
case when t1.dept_salary > t2.comp_salary then 'higher'
     when t1.dept_salary = t2.comp_salary then 'same'
     else 'lower' end as comparison
from
(select department_id, date_format(pay_date,'%Y-%m') as pay_month, avg(amount) as dept_salary
from salary s
left join employee e
on s.employee_id = e.employee_id
group by department_id, pay_month) t1
join
(select  date_format(pay_date,'%Y-%m') as pay_month, avg(amount) as comp_salary
from salary s
group by pay_month) t2
on t1.pay_month = t2.pay_month
order by t1.department_id, t1.pay_month