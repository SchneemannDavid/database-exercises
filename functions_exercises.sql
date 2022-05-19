use employees;


#2
SELECT concat(first_name,' ', last_name) as full_name
FROM employees
WHERE last_name like 'e%e';

#3
SELECT upper(concat(first_name,' ', last_name)) as full_name
FROM employees
WHERE last_name like 'e%e';