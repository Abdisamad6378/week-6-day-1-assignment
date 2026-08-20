-- ============================================================
-- Task 2: Answer Business Questions
-- ============================================================

-- Question 1: Teacher with the most students across all their courses
-- (a student enrolled in two courses taught by the same teacher
--  is counted only once)
SELECT t.name AS teacher_name, COUNT(DISTINCT e.student_id) AS total_students
FROM teachers t
JOIN courses c ON c.teacher_id = t.id
JOIN enrollments e ON e.course_id = c.id
GROUP BY t.name
ORDER BY total_students DESC
LIMIT 1;

-- Question 2: Average grade per course, sorted by average descending
SELECT c.name AS course_name, ROUND(AVG(e.grade)::numeric, 2) AS avg_grade
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.name
ORDER BY avg_grade DESC;

-- Question 3: Students enrolled in more than 3 courses
SELECT s.name AS student_name, COUNT(e.course_id) AS course_count
FROM students s
JOIN enrollments e ON e.student_id = s.id
GROUP BY s.name
HAVING COUNT(e.course_id) > 3;