-- Write your PostgreSQL query statement below
SELECT 
    P.product_id, 
    ROUND(COALESCE(SUM(P.price * U.units)::NUMERIC / NULLIF(SUM(U.units), 0), 0), 2) AS average_price
    FROM Prices AS P
    LEFT JOIN UnitsSold AS U
        ON U.product_id = P.product_id 
            AND U.purchase_date 
            BETWEEN P.start_date
            AND P.end_date
    GROUP BY P.product_id
