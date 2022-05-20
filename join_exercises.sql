### JOIN EXAMPLE DATABASE
use join_example_db;
select * from users;
select * from roles;

SELECT *
FROM ;


#### EMPLOYEES DATABASE EXERCISES
use employees;

select * from employees;
select * from dept_emp;
select * from departments
ORDER BY dept_no;
select * from dept_manager;

#2
SELECT d.dept_name, CONCAT(e.first_name, '_', e.last_name) as department_manager
FROM departments AS d
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
	ON de.emp_no = dm.emp_no
JOIN employees as e
	ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01';

#3
SELECT d.dept_name, CONCAT(e.first_name, '_', e.last_name) as department_manager
FROM departments AS d
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
	ON de.emp_no = dm.emp_no
JOIN employees as e
	ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';

select * from titles;
select* from dept_emp;

#4
SELECT title, count(*) AS Count
FROM titles AS t
JOIN dept_emp AS de
	ON t.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE t.to_date > NOW() 
	AND de.to_date > NOW()
	AND d.dept_no = 'd009'
GROUP BY t.title
ORDER BY t.title;


select * from salaries
LIMIT 100;
#5
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, '_', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM departments AS d
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
AND s.to_date > NOW()
ORDER BY d.dept_name;

#6

