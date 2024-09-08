-- Write your PostgreSQL query statement below
SELECT 
        DISTINCT M.employee_id, 
        M.name, 
        COUNT(*) AS reports_count,
        ROUND(AVG(E.age), 0) AS average_age
    FROM Employees AS M
    JOIN Employees AS E
        ON M.employee_id = E.reports_to
    GROUP BY M.employee_id, M.name
    ORDER BY M.employee_id