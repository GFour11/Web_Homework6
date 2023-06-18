SELECT s.name_surname, AVG(r."result") as avg_result
FROM results r
LEFT JOIN students s ON s.id = r.student_id
LEFT JOIN subjects sbj ON sbj.id = r.subject_id
WHERE sbj.id = 1                 ---or another id
GROUP BY s.id
ORDER BY avg_result DESC
LIMIT 1;