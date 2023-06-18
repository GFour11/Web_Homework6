SELECT gn.group_number, subject, s.name_surname, AVG(r."result") as res
FROM results r
LEFT JOIN students s ON s.id = r.student_id
LEFT JOIN subjects s2 ON s2.id = r.subject_id
LEFT JOIN group_number gn ON gn.id = s.group_number
WHERE gn.id = 1 AND s2.id =2   ---or another id`s
GROUP BY s.id
ORDER BY res DESC;