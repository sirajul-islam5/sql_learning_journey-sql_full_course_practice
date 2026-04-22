-- ==========================================
-- 02. QUERY FUNDAMENTALS (Filtering & Sorting)
-- Course: SQL Full Course 
-- Practitioner: Md. Sirajul Islam
-- ==========================================

USE college11;

-- 1. BASIC SELECT OPERATIONS
-- Retrieving specific columns and overall data structure
SELECT * FROM student1;
SELECT name, marks FROM student1;
SELECT DISTINCT city FROM student1; -- Identifying unique locations

-- 2. FILTERING DATA WITH WHERE CLALUSE
-- Practicing comparison operators (>, =, !=)
SELECT * FROM student1 WHERE marks > 80;
SELECT * FROM student1 WHERE city = "Mumbai";
SELECT * FROM student1 WHERE marks + 10 > 100; -- Arithmetic in WHERE clause

-- 3. LOGICAL OPERATORS (AND, OR)
-- Combining multiple conditions for precise results
SELECT * FROM student1 WHERE marks > 90 AND city = "Mumbai";
SELECT * FROM student1 WHERE marks > 90 OR city = "Mumbai";

-- 4. RANGE AND SET OPERATORS (BETWEEN, IN, NOT IN)
-- Filtering within a range or specific sets of values
SELECT * FROM student1 WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student1 WHERE city IN ("Delhi", "Mumbai", "Gurgaon");
SELECT * FROM student1 WHERE city NOT IN ("Delhi", "Mumbai");

-- 5. LIMITING RESULTS
-- Fetching a specific number of records
SELECT * FROM student1 LIMIT 3;
SELECT * FROM student1 WHERE marks > 80 LIMIT 3;

-- 6. SORTING DATA (ORDER BY)
-- Arranging data in Ascending (ASC) and Descending (DESC) order
SELECT * FROM student1 ORDER BY city ASC;
SELECT * FROM student1 ORDER BY marks DESC LIMIT 3; -- Fetching Top 3 scorers

-- 7. METADATA INSPECTION
-- Checking table schema and column properties
DESCRIBE student1;
