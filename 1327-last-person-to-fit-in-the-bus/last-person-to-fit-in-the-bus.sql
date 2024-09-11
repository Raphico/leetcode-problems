-- Write your PostgreSQL query statement below
SELECT person_name
    FROM (
        SELECT person_name,
               SUM(weight) OVER (ORDER BY turn) AS running_total
            FROM Queue)
    WHERE running_total <= 1000
    ORDER BY running_total DESC
    LIMIT 1