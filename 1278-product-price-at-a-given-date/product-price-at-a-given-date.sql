-- Write your PostgreSQL query statement below
WITH ProductWithLastPrices AS (
    SELECT product_id, MAX(change_date) AS change_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
)

SELECT DISTINCT P.product_id, (
        CASE WHEN P.change_date > '2019-08-16'
            THEN 10
            ELSE P.new_price END
    ) AS price
    FROM Products AS P
    LEFT JOIN ProductWithLastPrices AS Pl
        ON P.product_id = Pl.product_id
    WHERE P.change_date = Pl.change_date
        OR (P.product_id NOT IN (SELECT product_id FROM ProductWithLastPrices) 
                AND P.change_date > '2019-08-16') 

-- SELECT 
--         DISTINCT product_id, 
--         CASE
--             WHEN product_id in (SELECT product_id FROM OutsidePrices) THEN 10
--             ELSE new_price END AS price
--     FROM Products AS p
--     WHERE EXISTS (
--             SELECT 1
--                 FROM Lastprices AS Lp
--                 WHERE P.product_id = Lp.product_id
--                     AND P.change_date = Lp.change_date)
--         OR product_id in (SELECT product_id FROM OutsidePrices)
