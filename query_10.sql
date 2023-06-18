SELECT s2.subject
FROM results r
JOIN students s ON s.id =r.student_id
JOIN subjects s2 ON s2.id =r.subject_id
JOIN teachers t ON t.id = s2.teacher_id
WHERE s.id =1 AND t.id = 1  ---or another id`s
GROUP BY s2.subject;