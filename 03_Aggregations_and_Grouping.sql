-- ==========================================
-- 03. DATA AGGREGATIONS & GROUPING
-- Course: SQL Full Course 
-- Practitioner: Md. Sirajul Islam
-- ==========================================

USE college11;

-- 1. AGGREGATE FUNCTIONS
-- Performing basic calculations on numerical data
SELECT MAX(marks) FROM student1;        -- Finding the highest score
SELECT AVG(marks) FROM student1;        -- Calculating the average marks
SELECT COUNT(rollno) FROM student1;     -- Counting total students
SELECT SUM(marks) FROM student1;        -- Calculating the grand total of marks

-- 2. GROUP BY CLAUSE
-- Summarizing data based on categories (e.g., City, Grade)
SELECT city, COUNT(rollno) 
FROM student1 
GROUP BY city;                          -- Number of students from each city

SELECT city, AVG(marks) 
FROM student1 
GROUP BY city 
ORDER BY AVG(marks) DESC;               -- Finding the city with the highest average score

-- 3. HAVING CLAUSE
-- Filtering grouped data (used when WHERE clause cannot be applied to aggregations)
SELECT city, COUNT(rollno) 
FROM student1 
GROUP BY city 
HAVING MAX(marks) > 90;                 -- Cities where at least one student scored above 90

-- 4. COMPLEX GROUPING & SORTING
-- Combining WHERE, GROUP BY, HAVING, and ORDER BY together
SELECT city, COUNT(rollno)
FROM student1
WHERE grade = "A"                       -- Filtering individual records first
GROUP BY city
HAVING MAX(marks) > 90                  -- Filtering the grouped results
ORDER BY city DESC;

-- 5. PRACTICAL CASE STUDY: Payment Data Analysis
-- Analyzing customer payment modes and frequencies
SELECT mode, COUNT(customer)
FROM payment
GROUP BY mode;                          -- Identifying the most popular payment method
