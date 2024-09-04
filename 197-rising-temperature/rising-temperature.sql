-- Write your PostgreSQL query statement below
SELECT c.id
    FROM Weather AS c
    JOIN Weather AS p
        on c.recordDate = p.recordDate + INTERVAL '1 day'
    WHERE c.temperature > p.temperature;
    