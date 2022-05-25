use employees;

select * from titles;

#2
SELECT title, COUNT(DISTINCT(title))
FROM titles
GROUP BY title;
# how many distinct titles: 6

#3
SELECT emp_no, last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY emp_no, last_name;

#4
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

#5
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
# last_names: Chleq, Lindqvist, Qiwen

#6
SELECT last_name, first_name, count(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name, first_name;

#7
SELECT gender, first_name, COUNT(*)
FROM employees
WHERE first_name = 'Irena'
	or first_name = 'Vidya'
    or first_name = 'Maya'
GROUP BY gender, first_name;
### easier method:
SELECT gender, first_name, COUNT(gender)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;

#8
SELECT lower(concat(substr(first_name,1,1), 
substr(last_name,1,4), 
'_', 
substr(birth_date,6,2), 
substr(birth_date,3,2))) 
as username,
COUNT(*) as number_with_unique_username
FROM employees
GROUP BY username;

-- to find number of duplicate usernames:
SELECT lower(concat(substr(first_name,1,1), 
substr(last_name,1,4), 
'_', 
substr(birth_date,6,2), 
substr(birth_date,3,2))) 
as username,
COUNT(*) as number_with_unique_username
FROM employees
GROUP BY username
HAVING number_with_unique_username >1;
# duplicates: 13251

#9. BONUS




