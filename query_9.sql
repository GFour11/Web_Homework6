SELECT s.name_surname, s2.subject
FROM results r
LEFT JOIN students s ON s.id = r.student_id
LEFT JOIN subjects s2 ON s2.id = r.subject_id
WHERE s.id =4  --- or another id
GROUP BY s2.subject
LIMIT 5
OFFSET 1;