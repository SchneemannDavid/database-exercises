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


###### END OF WHERE EXERCISES

#### ORDER BY Exercises - BEGIN

#2 
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY first_name;
# first/last name of first row = Irena Reutenauer
# first/last of last person = Vidya Simmen

#3
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY first_name, last_name;
# first/last of first row = Irena Acton
# first/last of last person = Vidya Zweizig

#4
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY last_name, first_name;
# first/last of first row = Irena Acton
# first/last of last person = Maya Zyda

#5
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY emp_no;

Select count(*) as Count
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY emp_no;
# number of employees = 899
# first employee: 10021, Ramzi Erde
# last employee: 499648, Tadahiro Erde

#6
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY hire_date DESC;

SELECT count(*) as Count
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY hire_date DESC;

#can also do...
SELECT count(*) as Count
FROM employees
WHERE last_name like 'e%e'
ORDER BY hire_date;

# number of employees = 899
# newest employee: Teiji Eldridge
# oldest employee: Sergi Erde

#7
SELECT emp_no, first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-30'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC, birth_date ASC;
# number of employees = 362
# oldest employee hired last: Khun Bernini


SELECT emp_no, first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-30'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date DESC, hire_date ASC;
# youngest employee hired first: Douadi Pettis
# '412745','Douadi','Pettis','1990-05-04','1964-12-25'


