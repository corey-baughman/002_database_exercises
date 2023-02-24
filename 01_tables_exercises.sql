SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE employees;
-- 5. data types: int, date, varchar(14), varchar(16), enum('M','F')
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE salaries;
DESCRIBE titles;
/* 6. Which table(s) do you think contain a numberic type column? 
I think all tables would have a numeric field, at least a key.
After checking, the departments table doesn't have a num type field, but uses a char(4) as key*/
/* 7. Which table(s) do you think contain a string type column?
It appears that all tables except for salaries have a string type column. 
(employees, departments, dept_emp, dept_manager, and titles) */
/* 8. Which table(s) do you think contain a date type column?
All tables except for departments have a date type column. */
/* 9. What is the relationship between the employees and the departments tables?
They don't have a direct relationship, but the dept_manager table have keys from both tables. */
SHOW CREATE TABLE dept_manager;



