-- ==========================================
-- 04. JOINS & SUBQUERIES (Relational Logic)
-- Course: SQL Full Course 
-- Practitioner: Md. Sirajul Islam
-- ==========================================

USE college11;

-- 1. INNER JOIN
-- Retrieving overlapping data from two tables (Student & Course)
SELECT * FROM student9 AS s
INNER JOIN course9 AS c
ON s.student_id = c.course_id;

-- 2. LEFT & RIGHT OUTER JOIN
-- Fetching all records from one table and matching records from another
SELECT * FROM student9
LEFT JOIN course9
ON student9.student_id = course9.course_id;

SELECT * FROM student9
RIGHT JOIN course9
ON student9.student_id = course9.course_id;

-- 3. FULL OUTER JOIN (Using UNION)
-- Combining Left and Right join results to simulate a Full Join
SELECT * FROM student9 LEFT JOIN course9 ON student9.student_id = course9.course_id
UNION 
SELECT * FROM student9 RIGHT JOIN course9 ON student9.student_id = course9.course_id;

-- 4. SELF JOIN
-- Joining a table with itself (Example: Employee and their Managers)
SELECT a.name as manager_name, b.name as employee_name
FROM employee as a 
JOIN employee as b
ON a.id = b.manager_id;

-- 5. SUBQUERIES (Nested Queries)
-- Using a query inside another query for dynamic filtering
-- Example A: Find students with marks higher than the average
SELECT full_name, marks
FROM student1
WHERE marks > (SELECT AVG(marks) FROM student1);

-- Example B: Find students with even roll numbers using a subquery
SELECT full_name, rollno
FROM student1
WHERE rollno IN (
  SELECT rollno
  FROM student1
  WHERE rollno % 2 = 0
);

-- 6. VIEWS
-- Creating a virtual table for frequently used complex queries
CREATE VIEW student_marks_view AS 
SELECT rollno, name, marks FROM student1;

SELECT * FROM student_marks_view;
