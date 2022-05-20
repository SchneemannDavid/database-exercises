select first_name, count(DISTINCT(first_name))
from employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT last_name, count(*) AS n_same_last_name
FROM employees
GROUP BY last_name
HAVING n_same_last_name < 150;

SELECT concat(first_name, " ", last_name) AS full_name, count(*) AS n_same_full_name
FROM employees
GROUP BY full_name
HAVING n_same_full_name >= 5;
