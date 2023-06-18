DROP TABLE IF EXISTS group_number;
CREATE TABLE group_number (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_number VARCHAR(10) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_surname VARCHAR(50) UNIQUE NOT NULL,
    group_number VARCHAR(10),
    FOREIGN KEY (group_number) REFERENCES group_number (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
     subject VARCHAR(50)UNIQUE NOT NULL,
     teacher_id INTEGER NOT NULL,
     FOREIGN KEY (teacher_id) REFERENCES teachers (id)
       ON DELETE CASCADE
       ON UPDATE CASCADE
);

DROP TABLE IF EXISTS results;
CREATE TABLE results (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id VARCHAR(50),
    subject_id VARCHAR(50),
    result INTEGER NOT NULL,
    date_of DATE NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subjects (id),
    FOREIGN KEY (student_id) REFERENCES students (id)
);