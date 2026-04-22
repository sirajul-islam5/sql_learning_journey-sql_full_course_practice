-- ==========================================
-- 01. DATABASE & TABLE BASICS (DDL & DML)
-- Course: SQL Full Course 
-- Practitioner: Md. Sirajul Islam
-- ==========================================

-- 1. DATABASE CREATION & DELETION
-- Practicing the creation of databases and using conditional checks
CREATE DATABASE IF NOT EXISTS college; 
DROP DATABASE IF EXISTS company;
USE college;

-- 2. BASIC TABLE CREATION & DATA INSERTION
-- Initial practice with primary keys and simple data types
CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student (rollno, name) VALUES (101, "karan"), (102, "arjun"), (103, "ram");
INSERT INTO student (rollno, name) VALUES (104, "shyam");

SELECT * FROM student;

-- 3. WORKING WITH MULTIPLE DATABASES
-- Transitioning between different database contexts
CREATE DATABASE IF NOT EXISTS company1;
USE company1;

CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(50), 
    salary INT
);

INSERT INTO employee (id, name, salary) VALUES 
(101, "adam", 25000), 
(102, "bob", 30000),  
(103, "casey", 40000);

-- 4. CONSTRAINTS PRACTICE (Primary Key, Default, Check)
-- Composite Primary Key example
CREATE TABLE temp2(
    id INT,
    name VARCHAR(50),
    age INT, 
    city VARCHAR(50),
    PRIMARY KEY (id, name)
);

-- Default Values example
CREATE TABLE emp (
    id INT, 
    salary INT DEFAULT 25000
);
INSERT INTO emp (id) VALUES (101);

-- Check Constraints example (Ensuring data integrity)
CREATE TABLE city (
    id INT PRIMARY KEY,
    city VARCHAR(50), 
    age INT,
    CONSTRAINT CHECK (age >= 18 AND city = "Delhi")
);
INSERT INTO city (id, city, age) VALUES (1, "Delhi", 18), (2, "Delhi", 19), (3, "Delhi", 20);

-- 5. THE MASTER DATASET: student1
-- This table serves as the primary dataset for subsequent advanced queries
CREATE DATABASE IF NOT EXISTS college11;
USE college11;

CREATE TABLE student1 (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(50)
);

INSERT INTO student1 (rollno, name, marks, grade, city) VALUES 
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"), 
(103, "chetan", 85, "B", "Mumbai"), 
(104, "dhruv", 96, "A", "Delhi"), 
(105, "emanuel", 12, "F", "Delhi"), 
(106, "farah", 82, "B", "Delhi");

-- 6. FOREIGN KEYS & CASCADING REFERENTIAL INTEGRITY
-- Practicing table relationships and automated updates/deletions
CREATE TABLE dept1(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO dept1 (dept_id, dept_name) VALUES 
(101, "Science"), (102, "English"), (103, "Hindi");

CREATE TABLE teacher1 (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept1(dept_id)
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

INSERT INTO teacher1 (teacher_id, teacher_name, dept_id) VALUES 
(101, "Adam", 101), (102, "Bob", 103), (103, "Casey", 102), (104, "Donald", 102);

-- Final Verification
SELECT * FROM student1;
SELECT * FROM teacher1;
