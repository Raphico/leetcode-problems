-- Write your PostgreSQL query statement below
WITH EmployeesWithMultiDept AS (
    SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) > 1
)

SELECT employee_id, department_id
    FROM Employee AS E
    WHERE (employee_id IN (
        SELECT employee_id 
            FROM EmployeesWithMultiDept) 
        AND primary_flag  = 'Y')
        OR employee_id NOT IN (
            SELECT employee_id 
                FROM EmployeesWithMultiDept)
    