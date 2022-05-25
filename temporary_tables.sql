## Notes copied for reference ##

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL,
    name VARCHAR(10) NOT NULL
);

CREATE TEMPORARY TABLE kalpana_1813.salary_info AS (
	select emp_no, dept_no, first_name, last_name, salary, title, birth_date, hire_date
	from employees e
	join dept_emp de using (emp_no)
	join salaries s using (emp_no)
	join departments d using (dept_no)
	join titles t using (emp_no)
	where de.to_date > NOW() AND s.to_date > NOW()
	and t.to_date > NOW() and dept_name = 'Customer Service');
    
# add columns
ALTER TABLE kalpana_1813.salary_info ADD avg_salary float;
ALTER TABLE kalpana_1813.salary_info ADD std_salary float;
ALTER TABLE kalpana_1813.salary_info ADD greater_than_average INT;

# update data in columns
UPDATE kalpana_1813.salary_info SET avg_salary = 67000;
UPDATE kalpana_1813.salary_info SET std_salary = 16000;
UPDATE kalpana_1813.salary_info SET greater_than_average = salary > avg_salary;
-------------

use employees;

# 1 

CREATE TEMPORARY TABLE kalpana_1813.employees_with_departments AS
	SELECT first_name, last_name, dept_name
    FROM employees e
    JOIN dept_emp de USING (emp_no)
    JOIN departments d USING (dept_no)
    WHERE de.to_date > NOW();
    
select * from kalpana_1813.employees_with_departments;

# 1a & b
ALTER TABLE kalpana_1813.employees_with_departments DROP COLUMN full_name;
ALTER TABLE kalpana_1813.employees_with_departments ADD full_name VARCHAR(40);
UPDATE kalpana_1813.employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

# 1c & d
ALTER TABLE kalpana_1813.employees_with_departments DROP COLUMN first_name;
ALTER TABLE kalpana_1813.employees_with_departments DROP COLUMN last_name;
## we could have ended up with this same table by editing the initially-created table


# 2
SELECT * FROM sakila.payment;
use sakila;

CREATE TEMPORARY TABLE kalpana_1813.sakila_payment_v2 AS 
	SELECT *
    FROM payment;
    
drop table if exists kalpana_1813.sakila_payment_v2;

ALTER TABLE kalpana_1813.sakila_payment_v2 MODIFY amount INT;
UPDATE kalpana_1813.sakila_payment_v2 SET amount = (amount*100);

SELECT * from kalpana_1813.sakila_payment_v2;


# 3
## Curriculum Note ##
-- Returns the historic z-scores for each salary
-- Notice that there are 2 separate scalar subqueries involved
SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;

use employees;

	SELECT dept_name, dept_no, avg(s.salary)
    FROM departments d 
    JOIN dept_emp de USING (dept_no)
    JOIN salaries s USING (emp_no)
    WHERE de.to_date > NOW()
    GROUP BY dept_name
    ORDER BY dept_name;
    
select * from kalpana_1813.avg_salary;
    
drop table if exists kalpana_1813.salary_zscore;

CREATE TEMPORARY TABLE kalpana_1813.salary_zscore AS
	SELECT distinct dept_name, avg(salary) as 'AVG'
    FROM employees as e
    JOIN salaries s USING (emp_no)
    JOIN dept_emp de USING (emp_no)
    JOIN departments d USING (dept_no)
    JOIN titles t USING (emp_no)
    WHERE de.to_date > NOW()
    AND s.to_date > NOW()
    GROUP BY d.dept_name;

select * from kalpana_1813.salary_zscore;

alter table kalpana_1813.salary_zscore add comp_avg int;
alter table kalpana_1813.salary_zscore add std_dev int;
alter table kalpana_1813.salary_zscore add zscore float;

update kalpana_1813.salary_zscore set comp_avg = (select avg(salary) from salaries);
update kalpana_1813.salary_zscore set std_dev = (select stddev(salary) from salaries);
update kalpana_1813.salary_zscore set zscore = ((AVG - comp_avg) / std_dev);

SELECT * FROM kalpana_1813.salary_zscore
ORDER BY zscore;

-- best department: Sales
-- worst department: Human Resources

