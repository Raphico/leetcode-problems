-- Write your PostgreSQL query statement below
WITH FirstLogins AS (
    SELECT player_id, MIN(event_date) AS first_login_date
        FROM Activity
    GROUP BY player_id
)

SELECT ROUND(
            COUNT(
                CASE WHEN A.event_date = DATE_ADD(F.first_login_date, INTERVAL '1 day' ) THEN 1 END
            ) / COUNT(DISTINCT F.player_id)::NUMERIC, 2
        ) AS fraction
    FROM Activity AS A
    JOIN FirstLogins AS F
        ON F.player_id = A.player_id