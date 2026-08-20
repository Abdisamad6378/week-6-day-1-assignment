# Week 6 Day 1 Assignment — SQL School Database

A hands-on SQL assignment using PostgreSQL: set up a small school database
(students, teachers, courses, enrollments), run 10 practice queries, answer
three business questions, and apply a few data-modification operations.

## What's in this repo

| File | What it is |
|------|------------|
| `assignment` | The full assignment brief, schema, seed data, and expected outputs |
| `setup.sql` | Runs everything to build the DB from scratch (drop, create, insert) |
| `Task1.sql` | The 10 SELECT queries from Task 1 |
| `Task1_output.txt` | Real output captured from running Task 1 against Postgres |
| `Task2.sql` | The 3 business-question queries from Task 2 |
| `Task2_output.txt` | Real output captured from running Task 2 |
| `Task3.sql` | The INSERT / UPDATE / DELETE statements from Task 3 |
| `Task3_output.txt` | Real output captured from running Task 3 |

## The database

Four tables:

- **students** — name, email, age, town
- **teachers** — name, email, department
- **courses** — name, code, credits, `teacher_id` FK to teachers
- **enrollments** — junction table linking students and courses, with a `grade` (percentage)

Seed data is Kenyan-themed (names like Wanjiku Kamau, towns like Nairobi and
Kisumu) and ships with 5 teachers, 10 students, 7 courses, and 27 enrollments.

## Getting started

Run the setup, then the task files, in order:

```bash
psql -h localhost -U postgres -d school_db
```

```sql
-- in psql
\i setup.sql
\i Task1.sql
\i Task2.sql
\i Task3.sql
```

> Tip: `Task3` modifies data, so re-run `setup.sql` first if you want to
> replay it from a clean state.

## What the tasks cover

- **Task 1** — filtering, ordering, JOINs, grouping, aggregates (AVG, MAX/MIN),
  and pattern matching with regular expressions.
- **Task 2** — slightly trickier joins with `COUNT(DISTINCT ...)`, per-course
  averages with `ROUND`, and `HAVING` to filter groups.
- **Task 3** — inserting multiple rows, updating with a cap (`LEAST`), and
  deleting rows that fail a `NOT EXISTS` check.

## A few notes on the expected outputs

While working through this I ran every query for real, and four of the
expected outputs in the assignment don't quite line up with the data:

1. **Task 1 Query 6 (average grade):** the brief says `79.296...` but the seed
   grades sum to `2131 / 27 = 78.926`. The query itself is correct.
2. **Task 1 Query 8 (names starting with a vowel):** `Ochieng Otieno` starts
   with "O", so the real result has 4 rows, not the 3 shown in the brief.
3. **Task 2 Question 1 (teacher with most students):** the brief says
   Prof. Wambui Kamau, but counting distinct students gives Dr. Omondi Ochieng
   with 6 (Wambui's two courses cover only 5 distinct students).
4. **Task 2 Question 2 (average per course):** the brief's table isn't actually
   sorted by average descending; the files here use the requested `ORDER BY avg_grade DESC`.

Everything else matches the expected output exactly.