DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS students;

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  department VARCHAR(100) NOT NULL,
  hire_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  age INTEGER,
  town VARCHAR(100),
  enrolled_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  code VARCHAR(20) UNIQUE NOT NULL,
  credits INTEGER DEFAULT 3,
  teacher_id INTEGER REFERENCES teachers(id)
);

CREATE TABLE enrollments (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students(id),
  course_id INTEGER REFERENCES courses(id),
  grade INTEGER,
  enrolled_date TIMESTAMP DEFAULT NOW()
);

INSERT INTO teachers (name, email, department) VALUES
  ('Dr. Omondi Ochieng', 'omondi@school.ac.ke', 'Computer Science'),
  ('Prof. Wambui Kamau', 'wambui@school.ac.ke', 'Computer Science'),
  ('Dr. Muthoni Njeri', 'muthoni@school.ac.ke', 'Mathematics'),
  ('Mr. Karanja Mwangi', 'karanja@school.ac.ke', 'Computer Science'),
  ('Dr. Akinyi Otieno', 'akinyi@school.ac.ke', 'Mathematics');

INSERT INTO students (name, email, age, town) VALUES
  ('Wanjiku Kamau', 'wanjiku@student.ac.ke', 22, 'Nairobi'),
  ('Ochieng Otieno', 'ochieng@student.ac.ke', 24, 'Kisumu'),
  ('Akinyi Odhiambo', 'akinyi@student.ac.ke', 21, 'Mombasa'),
  ('Njoroge Mwangi', 'njoroge@student.ac.ke', 23, 'Nakuru'),
  ('Fatuma Hassan', 'fatuma@student.ac.ke', 20, 'Lamu'),
  ('Kipchoge Kiptoo', 'kipchoge@student.ac.ke', 25, 'Eldoret'),
  ('Amina Wafula', 'amina@student.ac.ke', 22, 'Nairobi'),
  ('Mwenda Mutua', 'mwenda@student.ac.ke', 23, 'Machakos'),
  ('Nyambura Wanjiru', 'nyambura@student.ac.ke', 21, 'Thika'),
  ('Otieno Oduor', 'otieno@student.ac.ke', 24, 'Kisumu');

INSERT INTO courses (name, code, credits, teacher_id) VALUES
  ('Introduction to Programming', 'CS101', 4, 1),
  ('Data Structures', 'CS201', 3, 2),
  ('Database Systems', 'CS301', 3, 1),
  ('Web Development', 'CS102', 4, 4),
  ('Machine Learning', 'CS401', 3, 2),
  ('Calculus I', 'MATH101', 4, 3),
  ('Linear Algebra', 'MATH201', 3, 5);

INSERT INTO enrollments (student_id, course_id, grade) VALUES
  (1, 1, 85), (1, 3, 78), (1, 6, 72), (1, 4, 90),
  (2, 1, 70), (2, 2, 82), (2, 5, 68),
  (3, 1, 92), (3, 4, 88), (3, 6, 75),
  (4, 2, 65), (4, 5, 71),
  (5, 4, 83), (5, 7, 79),
  (6, 1, 76), (6, 3, 91), (6, 2, 80), (6, 5, 74),
  (7, 2, 88), (7, 6, 82),
  (8, 1, 73), (8, 4, 67),
  (9, 3, 85), (9, 7, 90), (9, 1, 81),
  (10, 5, 77), (10, 2, 69);
