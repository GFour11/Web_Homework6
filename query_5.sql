SELECT t.teacher, s.subject
FROM subjects s
LEFT JOIN teachers t ON t.id = s.teacher_id
WHERE t.id =1 --- or another id