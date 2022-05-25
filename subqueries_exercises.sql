
#1
SELECT hire_date
FROM employees
WHERE emp_no = '101010';

SELECT first_name, last_name
FROM employees as e
JOIN dept_emp as de
	ON e.emp_no = de.emp_no
WHERE hire_date = (SELECT hire_date
FROM employees WHERE emp_no = '101010')
AND de.to_date > NOW();



#2
SELECT emp_no
FROM employees
WHERE first_name = 'Aamod';

SELECT DISTINCT(title), first_name, last_name
FROM titles
JOIN dept_emp
	USING (emp_no)
JOIN employees	
	USING (emp_no)
WHERE emp_no IN (SELECT emp_no
FROM employees
WHERE first_name = 'Aamod') AND dept_emp.to_date > NOW();


#3
/* SELECT emp_no
FROM dept_emp 
WHERE to_date < CURDATE();

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no
FROM dept_emp 
WHERE to_date < CURDATE());
*/
-- 85108 employees are no longer working for the company
## ^THIS IS INCORRECT... includes employees who are still actually working for the company.

## CORRECT SOLUTION:

SELECT COUNT(*) 
FROM employees
WHERE emp_no NOT IN
	(SELECT emp_no FROM dept_emp
    WHERE to_date > NOW());
-- 59900 employees are no longer working for the companny


#4
Select emp_no
FROM dept_manager
WHERE to_date > NOW();

SELECT CONCAT(first_name, ' ', last_name) AS 'Department Managers'
FROM employees
WHERE emp_no IN 
	(Select emp_no
	FROM dept_manager
	WHERE to_date > NOW())
AND gender = 'F';

-- Isamu Legleitner
-- Karsten Sigstam
-- Leon DasSarma
-- Hilary Kambil

#5
SELECT AVG(salary)
FROM salaries;

SELECT first_name, last_name
FROM employees
JOIN salaries USING (emp_no)
WHERE to_date > NOW() AND salary > (SELECT AVG(salary)
FROM salaries);


#6
SELECT MAX(salary)
FROM salaries
WHERE to_date > NOW();
-- 158220

SELECT std(salary)
FROM salaries
WHERE to_date > NOW();
-- 17309.9593

SELECT COUNT(*)
FROM salaries
WHERE salary >= (SELECT MAX(salary)
				FROM salaries
				WHERE to_date > NOW()) 
                - 
                (SELECT std(salary)
				FROM salaries
				WHERE to_date > NOW())
AND to_date > NOW();
-- 83 current salaries

SELECT (83 / COUNT(*))*100
FROM salaries
WHERE to_date > NOW();
-- Percentage of all salaries = .03%


-- ----BONUS----
## Find all department names that currently have female managers

-- copied down from Q4
Select emp_no
FROM dept_manager
WHERE to_date > NOW();

SELECT CONCAT(first_name, ' ', last_name) AS 'Department Managers'
FROM employees
WHERE emp_no IN 
	(Select emp_no
	FROM dept_manager
	WHERE to_date > NOW())
AND gender = 'F';

## B1
SELECT dept_name AS 'Departments'
FROM departments
JOIN dept_emp USING (dept_no)
WHERE emp_no 
IN (SELECT emp_no
	FROM employees
	WHERE emp_no IN 
		(Select emp_no
		FROM dept_manager
		WHERE to_date > NOW())
	AND gender = 'F');
-- Finance, HR, Development, Research
    

## B2
SELECT MAX(salary)
FROM salaries
WHERE to_date > NOW();

SELECT emp_no
FROM salaries
WHERE salary = (SELECT MAX(salary)
FROM salaries
WHERE to_date > NOW());

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE emp_no = (SELECT emp_no
FROM salaries
WHERE salary = (SELECT MAX(salary)
FROM salaries
WHERE to_date > NOW()));
-- Tokuyasu Pesch

## B3
SELECT dept_name AS 'Department Name'
FROM departments
JOIN dept_emp USING (dept_no)
WHERE emp_no = (SELECT emp_no
FROM salaries
WHERE salary = (SELECT MAX(salary)
FROM salaries
WHERE to_date > NOW()));
-- Sales






