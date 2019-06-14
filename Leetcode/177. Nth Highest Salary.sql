CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
      select distinct Salary
      from
      (select Salary, dense_rank() over (order by Salary desc) as r
      from Employee) tbl1
      where r = @N

    );
END