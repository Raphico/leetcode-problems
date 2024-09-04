-- Write your PostgreSQL query statement below
SELECT St.student_id, St.student_name, 
       S.subject_name, COUNT(E.subject_name) AS attended_exams
    FROM Students AS St
    CROSS JOIN Subjects AS S
    LEFT JOIN  Examinations AS E
        ON E.student_id = St.student_id
            AND E.subject_name = S.subject_name
    GROUP BY St.student_id, St.student_name, S.subject_name
    ORDER BY St.student_id, S.subject_name;  
