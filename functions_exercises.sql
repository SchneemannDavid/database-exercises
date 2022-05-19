use employees;


#2
SELECT concat(first_name,' ', last_name) as full_name
FROM employees
WHERE last_name like 'e%e';

#3
SELECT upper(concat(first_name,' ', last_name)) as full_name
FROM employees
WHERE last_name like 'e%e';

#4
SELECT datediff(curdate(), hire_date) as tenure
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'

#5
