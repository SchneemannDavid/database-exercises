### LIMIT Exercises

use employees;

SELECT * FROM employees;

#2
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;
# LIST SHOWS WITH THIS QUERY

#3
SELECT emp_no, first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5;
# Alselm Cappello
# Utz Mandell
# Bouchung Schreiter
# Baocai Kushner
# Petter Stroustrup

#4
SELECT emp_no, first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-30'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;

# OR

SELECT emp_no, first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;

# page n = limit 5 offset = (n-1)*5 = 45^^^