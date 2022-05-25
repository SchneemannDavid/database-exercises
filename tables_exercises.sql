# 3
use employees;

# 4
select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;


# 5
select * from employees;
-- int, date, varchar, & enum

# 6
-- Which tables do you think contain a numeric type column?
-- All of them contain a numeric type column

# 7
-- Which tables do you think contain a string type column?
-- All of them except salaries

# 8 
-- Which tables do you think contain a data type column?
-- All of them contain a data type column

# 9
-- What is the relationship between the employees and departments tables?
-- This relationship is one to many. Unless you count past work history where employees may have worked within multiple departments...

# 10
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- I simply right-click on the table in the schemas tab and select 'Copy to Clipboard' -> 'Create Statement'

