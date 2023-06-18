import sqlite3
from random import randint
from faker import Faker
from datetime import datetime, date, timedelta

fake = Faker('uk-UA')


subjects = ['PE','Physic', 'Chemistry', 'Law','Journalistic']
groups=['F-11', 'K34-13','AA-58']


connection = sqlite3.connect('students.db')
cur = connection.cursor()





def seed_teachers():
    sql = "INSERT INTO teachers (teacher) VALUES (?)"
    teachers = [fake.name() for _ in range(1,6)]
    cur.executemany(sql, zip(teachers, ))

def seed_group():
    sql = "INSERT INTO group_number(group_number) VALUES(?)"
    cur.executemany(sql, zip(groups, ))

def seed_students():
    sql = "INSERT INTO students(name_surname, group_number) VALUES(?,?)"
    student=[fake.name() for _ in range(1, 31)]
    group_id = [randint(1, len(groups)) for _ in range(1, 31)]
    cur.executemany(sql, zip(student,group_id))

def seed_subjects():
    sql = "INSERT INTO subjects(subject,teacher_id) VALUES(?,?)"
    teacher_id = [randint(1,5) for _ in range(1,6)]
    cur.executemany(sql, zip(subjects, teacher_id))

def seed_results():
    start_studying = datetime.strptime('2022-09-01','%Y-%m-%d')
    finish_studying = datetime.strptime('2023-06-30', '%Y-%m-%d')
    sql = "INSERT INTO results (student_id, subject_id, result, date_of) VALUES(?,?,?,?)"

    def get_date(start_studying, finish_studying):
        result=[]
        start: date = start_studying
        while start<finish_studying:
            if start.isoweekday()<6:
                result.append(start)
            start+=timedelta(1)
        return result

    dates=get_date(start_studying,finish_studying)
    results = []
    for day in dates:
        student = [randint(1,31) for _ in range(5)]
        subject=randint(1,6)
        for i in student:
            results.append((i,subject, randint(1,12), day.date()))
    cur.executemany(sql, results)


if __name__ == '__main__':
    seed_teachers()
    seed_group()
    seed_students()
    seed_subjects()
    seed_results()
    connection.commit()
    connection.close()