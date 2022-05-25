

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


