use employees;

-- Copied Notes
SELECT
	dept_name,
    dept_name = 'Research' AS is_research
FROM departments;


SELECT
	dept_name,
    dept_name LIKE '%Research%' AS is_research
FROM departments;

SELECT dept_name,
	CASE
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
        WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('production', 'quality management') THEN 'Prod & QM'
        ELSE dept_name
	END AS dept_group
FROM departments;


-- Exercises
# 1
SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name', dept_no, hire_date, de.to_date,
de.to_date > CURDATE() AS is_current_employee
FROM employees
JOIN dept_emp de USING (emp_no)
ORDER BY hire_date;


# 2
select * from employees;

SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name', 
	CASE
		WHEN last_name BETWEEN 'a%' AND 'h%' THEN 'A-H'
        WHEN last_name BETWEEN 'i%' AND 'q%' THEN 'I-Q'
        WHEN last_name BETWEEN 'r%' AND 'z%' THEN 'R-Z'
	END AS alpha_group
FROM employees;


# 3
SELECT emp_no, birth_date,
	CASE WHEN birth_date BETWEEN '1940-01-01' AND '1949-12-31' THEN '40s' ELSE NULL END AS '40s',
    CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s' ELSE NULL END AS '50s',
	CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s' ELSE NULL END AS '60s',
	CASE WHEN birth_date BETWEEN '1970-01-01' AND '1979-12-31' THEN '70s' ELSE NULL END AS '70s'
FROM employees;

-- add count fct
SELECT de.dept_no,
	COUNT(CASE WHEN birth_date BETWEEN '1940-01-01' AND '1949-12-31' THEN '40s' ELSE NULL END) AS '40s',
    COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s' ELSE NULL END) AS '50s',
	COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s' ELSE NULL END) AS '60s',
	COUNT(CASE WHEN birth_date BETWEEN '1970-01-01' AND '1979-12-31' THEN '70s' ELSE NULL END) AS '70s'
FROM employees
JOIN dept_emp de USING (emp_no)
GROUP BY de.dept_no;

-- .. ^cute... but no..
-- below is the correct solution:

SELECT 
	CASE 
		WHEN birth_date like '195%' then '50s'
		WHEN birth_date like '196%' then '60s'
        ELSE 'n/a'
	END AS Decade, count(*) AS 'Born in each Decade'
FROM employees
GROUP BY decade;


# 4
select * from departments;

drop table if exists kalpana_1813.dept_groups;


CREATE TEMPORARY TABLE kalpana_1813.dept_groups AS
	SELECT dept_name,
		CASE
			WHEN dept_name IN ('research', 'development') THEN 'R&D'
			WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
			WHEN dept_name IN ('production', 'quality management') THEN 'Prod & QM'
            WHEN dept_name IN ('finance', 'human resources') THEN 'Finance & HR'
			ELSE dept_name
		END AS dept_group
	FROM departments;
    
select * from kalpana_1813.dept_groups;

SELECT dept_group, avg(salary)
FROM salaries
JOIN dept_emp 
ON salaries.emp_no = dept_emp.emp_no AND dept_emp.to_date > NOW()
JOIN departments d USING (dept_no)
JOIN kalpana_1813.dept_groups ON d.dept_name = kalpana_1813.dept_groups.dept_name
GROUP BY dept_group;



