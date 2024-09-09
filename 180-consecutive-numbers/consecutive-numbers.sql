-- Write your PostgreSQL query statement below
WITH Consectives AS (
    SELECT 
            num,
            LAG(num, 1) OVER (ORDER BY id) AS prev_num,
            LAG(num, 2) OVER (ORDER BY id) AS prev_prev_num
        FROM Logs
)


SELECT DISTINCT num AS ConsecutiveNums
    FROM Consectives
    WHERE num = prev_num
        AND prev_num = prev_prev_num
        