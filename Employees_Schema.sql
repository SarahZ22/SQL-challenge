--Data Engineering
--Creat tables for each data set
--Import the data from each csv

--Drop Tables if needed
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

--Titles Table
CREATE TABLE titles(
title_id VARCHAR(30) PRIMARY KEY NOT NULL,
title VARCHAR(30) NOT NULL);

--Employees Table
CREATE TABLE employees(
emp_no INT PRIMARY KEY NOT NULL,
emp_title_id VARCHAR(30) NOT NULL,
birth_date VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
gender VARCHAR(5) NOT NULL,
hire_date VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

--Departments Table
CREATE TABLE departments(
dept_no VARCHAR PRIMARY KEY NOT NULL,
dept_name VARCHAR(30) NOT NULL);


--Department Employees Table
CREATE TABLE dept_emp(
emp_no INT NOT NULL,
dept_no VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Department Managers Table
CREATE TABLE dept_manager(
dept_no VARCHAR(30) NOT NULL,
emp_no INT NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Salaries Table
CREATE TABLE salaries(
emp_no INT NOT NULL,
salary VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Check to make sure imports worked ok (change table name as needed)
SELECT * FROM titles;