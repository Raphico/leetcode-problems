-- Write your PostgreSQL query statement below
WITH EarliestDates AS (
    SELECT customer_id, MIN(order_date) AS earliest_date
        FROM Delivery
        GROUP BY customer_id
)

SELECT 
        ROUND(
            COUNT(
                CASE WHEN D.customer_pref_delivery_date = E.earliest_date THEN 1 END
            ) / COUNT(DISTINCT D.customer_id)::NUMERIC * 100, 2
        ) AS immediate_percentage
    FROM Delivery AS D
    JOIN EarliestDates AS E
        ON D.customer_id = E.customer_id
