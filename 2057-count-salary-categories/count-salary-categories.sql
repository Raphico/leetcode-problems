-- Write your PostgreSQL query statement below
WITH LowSalary AS (
    SELECT 'Low Salary' AS category, 
            COUNT(*) AS accounts_count
        FROM Accounts
        WHERE income < 20000
), AverageSalary AS (
    SELECT 'Average Salary' AS category, 
            COUNT(*) AS accounts_count
        FROM Accounts
        WHERE income >= 20000 
            AND income <= 50000
), HighSalary AS (
    SELECT 'High Salary' AS category, 
            COUNT(*) AS accounts_count
        FROM Accounts
        WHERE income > 50000
)

SELECT * FROM LowSalary
UNION ALL
SELECT * FROM AverageSalary
UNION ALL
SELECT * FROM HighSalary

