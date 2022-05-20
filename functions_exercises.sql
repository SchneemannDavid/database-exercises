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
AND birth_date LIKE '%-12-25';

#5
select * from salaries;

select max(salary) from salaries;
select min(salary) from salaries;

# max = $158220
# min = $38623

#6
select * from employees;
SELECT lower(concat(substr(first_name,1,1), substr(last_name,1,4), '_', substr(birth_date,6,2), substr(birth_date,3,2))) as username
FROM employees;

# yay :D

