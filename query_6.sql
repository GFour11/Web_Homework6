SELECT s.name_surname, s.group_number
FROM group_number gn
LEFT JOIN students s ON s.group_number = gn.id
WHERE gn.id = 3 ---or another id