select com.company_code, com.founder, lm_count,sm_count,m_count,e_count
from company com
join
(select company_code,count(distinct lead_manager_code) as lm_count
from Lead_manager
group by company_code) a
on com.company_code = a.company_code
join
(select company_code,count(distinct senior_manager_code) as sm_count
from senior_manager
group by company_code) b
on com.company_code = b.company_code
join
(select company_code,count(distinct manager_code) as m_count
from manager
group by company_code) c
on com.company_code = c.company_code
join
(select company_code,count(distinct employee_code) as e_count
from employee
group by company_code) d
on com.company_code = d.company_code
order by substring(com.company_code, 2)