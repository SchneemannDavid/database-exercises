### WHERE Exercises
# 

use employees;

#2 
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya');

SELECT Count(*) AS count
FROM employees WHERE first_name IN ('Irena','Vidya', 'Maya');
# number of records returned: 709

#3
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT count(*) AS count
FROM employees
Where first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
# number of records returned: 300024

SELECT * FROM employees;

#4
SELECT count(*) AS Count
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
	AND gender = 'M';
    
#5
SELECT count(*) AS Count
FROM employees
WHERE last_name LIKE 'e%';
# number of employees = 7330

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'e%';

#6 
SELECT count(*) AS Count
FROM employees
WHERE (last_name LIKE 'e%') OR (last_name LIKE '%e');
# number of employees whose last name starts or ends with E = 30723

SELECT count(*) AS Count
FROM employees
WHERE last_name LIKE '%e';
# number of employees whose last name ends with E = 24292

#7 
SELECT count(*) AS Count
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE 'e%';
# number of emp, starts and ends with E = 7330


SELECT * FROM employees;

#8
SELECT count(*) AS Count
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-30';
# number of employees hired in the 90s = 135212

#9
SELECT count(*) AS Count
FROM employees
WHERE birth_date LIKE '%-12-25';
# number of employees born on Xmas = 842

SELECT emp_no, first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25';

#10
SELECT count(*) AS Count
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-30'
AND birth_date LIKE '%-12-25';
# number of employees hired in 90s and born on Xmas = 362

#11
SELECT count(*) AS Count
FROM employees
WHERE last_name like '%q%';
# number of employees with 'q' in their last name = 1873

#12
SELECT count(*) AS Count
FROM employees
WHERE last_name like '%q%' AND last_name not like '%qu%';
# number of employees with 'q' in their last name but NOT 'qu' = 547




