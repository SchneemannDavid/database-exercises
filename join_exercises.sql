
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

select * from employees;
select * from dept_emp;
#6
SELECT d.dept_no AS Dept_No, d.dept_name AS Dept_Name, COUNT(*) AS num_employees
FROM departments AS d
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY d.dept_no;


select * from employees.employees;
select * from employees.dept_emp;
select * from employees.salaries
LIMIT 1000;
#7
SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN salaries as s
	ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY de.dept_no
ORDER BY AVG(s.salary) DESC
LIMIT 1;


select * from departments;
#8
SELECT e.first_name, e.last_name, MAX(s.salary)
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
JOIN salaries as s
	ON de.emp_no = s.emp_no
WHERE de.dept_no = 'd001' AND s.to_date = '9999-01-01'
GROUP BY e.first_name, e.last_name
ORDER BY MAX(s.salary) DESC
LIMIT 1;


#9
SELECT e.first_name, e.last_name, MAX(s.salary), d.dept_name
FROM employees as e
JOIN dept_manager as dm
	ON e.emp_no = dm.emp_no
JOIN dept_emp as de
	ON dm.emp_no = de.emp_no
JOIN departments as d
	ON de.dept_no = d.dept_no
JOIN salaries as s
	ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
GROUP BY e.first_name, e.last_name, d.dept_name
ORDER BY MAX(s.salary) DESC
LIMIT 1;


#10
SELECT d.dept_name, AVG(s.salary) as average_salary
FROM departments as d
JOIN dept_emp as de
	ON d.dept_no = de.dept_no
JOIN salaries as s
	ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;

#11
SELECT CONCAT(e.first_name, ' ', e.last_name) as 'Employee Name', d.dept_name as 'Department Name', CONCAT(e2.first_name, ' ', e2.last_name) as 'Manager Name'
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e2
	ON dm.emp_no = e2.emp_no
WHERE dm.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
ORDER BY dept_name;



#12

