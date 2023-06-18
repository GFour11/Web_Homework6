SELECT t.teacher, s.subject, AVG(r."result") as res
FROM results r
JOIN subjects s ON s.id =r.subject_id
JOIN teachers t ON t.id = s.teacher_id
WHERE t.id =1  ---or another id
GROUP BY s.subject