-- Write your PostgreSQL query statement below
SELECT 
    P.project_id,
    ROUND(AVG(E.experience_years), 2) AS average_years
    FROM Project AS P
    LEFT JOIN Employee AS E
        ON P.employee_id = E.employee_id
    GROUP BY P.project_id;