-- Write your PostgreSQL query statement below
WITH TotalProducts AS (
    SELECT COUNT(*) AS total 
        FROM Product
)

SELECT customer_id
    FROM Customer
    CROSS JOIN TotalProducts AS T
    GROUP BY customer_id, T.total
    HAVING COUNT(DISTINCT product_key) = T.total