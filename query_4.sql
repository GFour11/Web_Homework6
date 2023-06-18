SELECT gn.group_number, AVG(r."result") as avg_res
FROM results r
LEFT JOIN students s ON s.id = r.student_id
LEFT JOIN group_number gn ON gn.id = s.group_number
GROUP BY gn.group_number
ORDER BY avg_res DESC;