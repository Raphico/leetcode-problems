-- Write your PostgreSQL query statement below
SELECT M.name
    FROM Employee AS M
    JOIN Employee AS E
        ON M.id = E.managerId
    GROUP BY M.id, M.name
    HAVING COUNT(E.id) >= 5;
    