SELECT s.name_surname, AVG(r."result") as avg_result
FROM results r
LEFT JOIN students s ON s.id = r.student_id
GROUP BY s.id
ORDER BY avg_result DESC
LIMIT 5;