-- ============================================================
-- Task 3: Data Modifications
-- Run these in order on a fresh database.
-- ============================================================

-- 3a: Insert 5 new students with Kenyan names and towns
INSERT INTO students (name, email, age, town) VALUES
  ('Njeri Maina', 'njeri@student.ac.ke', 20, 'Nyeri'),
  ('Kamau Githuku', 'kamau.g@student.ac.ke', 22, 'Kiambu'),
  ('Atieno Owino', 'atieno@student.ac.ke', 21, 'Homa Bay'),
  ('Baraka Mwiti', 'baraka@student.ac.ke', 23, 'Meru'),
  ('Zawadi Chebet', 'zawadi@student.ac.ke', 19, 'Kericho');

-- Verify insert
SELECT name, email, town FROM students WHERE id > 10 ORDER BY id;

-- 3b: Increase grades for course_id 1 by 5 points, capped at 100
UPDATE enrollments
SET grade = LEAST(grade + 5, 100)
WHERE course_id = 1;

-- Verify update
SELECT s.name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
WHERE e.course_id = 1
ORDER BY s.name;

-- 3c: Delete all students with no enrollments
DELETE FROM students s
WHERE NOT EXISTS (SELECT 1 FROM enrollments e WHERE e.student_id = s.id);

-- Verify delete
SELECT COUNT(*) AS remaining_students FROM students;