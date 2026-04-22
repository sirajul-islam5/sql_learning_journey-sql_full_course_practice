-- ==========================================
-- 05. ADVANCED OPERATIONS & FINAL EXERCISES
-- Course: SQL Full Course 
-- Practitioner: Md. Sirajul Islam
-- ==========================================

USE college11;

-- 1. DATA UPDATES & MAINTENANCE
-- Practicing safe updates and modifying existing records
SET SQL_SAFE_UPDATES = 0; -- Disabling safe mode for bulk updates

UPDATE student1
SET marks = 82, grade = "B"
WHERE rollno = 105;

UPDATE student1
SET grade = "O"
WHERE grade = "A";

UPDATE student1
SET marks = marks + 1; -- Incrementing all marks by 1

-- 2. SCHEMA MODIFICATIONS (ALTER TABLE)
-- Adding, modifying, and dropping columns to evolve table structure
ALTER TABLE student1 ADD COLUMN age INT DEFAULT 19;
ALTER TABLE student1 MODIFY COLUMN age VARCHAR(2);
ALTER TABLE student1 CHANGE COLUMN age student_age INT; -- Renaming a column
ALTER TABLE student1 DROP COLUMN student_age;
ALTER TABLE student1 RENAME TO stu_table; -- Renaming the table
ALTER TABLE stu_table RENAME TO student1;

-- 3. DATA CLEANING (DELETE & TRUNCATE)
DELETE FROM student1 WHERE marks < 33; -- Removing specific records
-- TRUNCATE TABLE student1; -- Use with caution: removes all data but keeps structure

-- 4. FINAL PRACTICAL CASE STUDIES
-- Applying all learned concepts to solve real-world scenarios

-- Exercise A: Finding cities where the maximum mark is above 90
SELECT city, COUNT(rollno)
FROM student1
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city DESC;

-- Exercise B: Practice with Table Relationships (Cascade Action)
-- Testing ON UPDATE CASCADE from the previously created Dept/Teacher relationship
UPDATE dept1
SET dept_id = 111
WHERE dept_id = 101;

SELECT * FROM teacher1; -- Checking if dept_id updated automatically

-- 5. CLEANUP OPERATIONS
-- Dropping experimental views or temporary tables
DROP VIEW IF EXISTS view1;

-- ==========================================
-- END OF SQL MASTERY SERIES
-- ==========================================
