-- Write your PostgreSQL query statement below
WITH AccountCategories AS (
    SELECT 'Low Salary' AS category
    UNION ALL 
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category
), AccountSalaries AS (
    SELECT 
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END AS category,
        COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY category
)

SELECT A.category,
       COALESCE(accounts_count, 0) AS accounts_count
    FROM AccountCategories AS A
    LEFT JOIN AccountSalaries AS S
        ON A.category = S.category

-- WITH LowSalary AS (
--     SELECT 'Low Salary' AS category, 
--             COUNT(*) AS accounts_count
--         FROM Accounts
--         WHERE income < 20000
-- ), AverageSalary AS (
--     SELECT 'Average Salary' AS category, 
--             COUNT(*) AS accounts_count
--         FROM Accounts
--         WHERE income >= 20000 
--             AND income <= 50000
-- ), HighSalary AS (
--     SELECT 'High Salary' AS category, 
--             COUNT(*) AS accounts_count
--         FROM Accounts
--         WHERE income > 50000
-- )

-- SELECT * FROM LowSalary
-- UNION ALL
-- SELECT * FROM AverageSalary
-- UNION ALL
-- SELECT * FROM HighSalary

