SELECT g.group_number, AVG(r.result) as avg_res
FROM results r
JOIN students stdnts ON stdnts.id =r.student_id
JOIN subjects s ON s.id =r.subject_id
JOIN group_number g ON g.id = stdnts.group_number
WHERE s.id = 1   ---or another id
GROUP BY g.group_number
ORDER BY avg_res DESC;