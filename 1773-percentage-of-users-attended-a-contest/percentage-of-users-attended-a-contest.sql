-- Write your PostgreSQL query statement below
-- SELECT 
--     contest_id, 
--     ROUND(COUNT(user_id)::NUMERIC / (SELECT COUNT(*) FROM Users) * 100, 2) AS percentage
--     FROM Register
--     GROUP BY contest_id
--     ORDER BY percentage DESC, contest_id ASC
    
WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users FROM Users
)

SELECT contest_id, ROUND(COUNT(user_id)::NUMERIC / total_users * 100, 2) AS percentage
    FROM Register AS R
    CROSS JOIN TotalUsers AS T
    GROUP BY contest_id, total_users
    ORDER BY percentage DESC, contest_id ASC