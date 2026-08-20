-- ============================================================
-- Task 1: Write 10 SQL Queries
-- ============================================================

-- Query 1: Select all students from Nairobi
SELECT id, name, email, age, town
FROM students
WHERE town = 'Nairobi';

-- Query 2: Select all courses with more than 3 credits, ordered by name
SELECT id, name, code, credits
FROM courses
WHERE credits > 3
ORDER BY name;

-- Query 3: Student names and their enrolled course names using JOIN
SELECT s.name AS student_name, c.name AS course_name
FROM students s
JOIN enrollments e ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id;

-- Query 4: Count students per course, order by count descending
SELECT c.name AS course_name, COUNT(e.id) AS student_count
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.name
ORDER BY student_count DESC;

-- Query 5: Students older than 22, sorted by age descending
SELECT name, age, town
FROM students
WHERE age > 22
ORDER BY age DESC;

-- Query 6: Average grade across all enrollments
SELECT AVG(grade) AS avg_grade
FROM enrollments;

-- Query 7: Highest and lowest grade
SELECT MAX(grade) AS highest_grade, MIN(grade) AS lowest_grade
FROM enrollments;

-- Query 8: Students whose names start with a vowel
SELECT name
FROM students
WHERE name ~* '^[aeiou]';

-- Query 9: Courses in the Computer Science department
SELECT c.name AS course_name, t.name AS teacher_name
FROM courses c
JOIN teachers t ON c.teacher_id = t.id
WHERE t.department = 'Computer Science';

-- Query 10: Count students per town, only towns with more than 1
SELECT town, COUNT(*) AS student_count
FROM students
GROUP BY town
HAVING COUNT(*) > 1;