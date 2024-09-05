-- Write your PostgreSQL query statement below
SELECT 
    S.user_id, 
    CASE 
        WHEN COUNT(C.user_id) = 0 THEN 0.00 
        ELSE ROUND((COUNT(CASE WHEN C.action = 'confirmed' THEN 1 END) / COUNT(C.user_id)::NUMERIC), 2)
        END AS confirmation_rate 
    FROM Signups AS S
    LEFT JOIN Confirmations AS C
        ON S.user_id = C.user_id
    GROUP BY S.user_id
