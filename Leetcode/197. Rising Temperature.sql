select w1.Id
from weather w1
join weather w2
on w1.RecordDate = date_add(w2.RecordDate, interval 1 day)
where w1.Temperature > w2.Temperature