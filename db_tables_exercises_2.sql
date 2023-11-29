# 3. List all the databases
SHOW DATABASES;

# 4. Write the SQL code necessary to use the albums_db database
USE albums_db;

# 5. Show the currently selected database
SELECT database();

# 6. List all tables in the database
SHOW TABLES;

# 7. Write the SQL code to switch to the employees database
USE employees;

# 8. Show the currently selected database
SELECT database();

# 9. List all tables in the database
SHOW TABLES;

# 10. Explore the employees table. What different data types are present in this table?
DESCRIBE employees;
# Data types: int, date, varchar(14), varchar(16), enum('M','F'), date

# 11. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
# Ans.: probably all of them, at least a key unless they use a compound key of non-numeric fields

# 12. Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
# Ans.: maybe departments, employees, titles

# 13. Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
# Ans.: dept_emp, employees?

# 14. What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
# Ans. The dept_emp table connects employees and departments using dept_no and emp_no

# 15. Show the SQL code that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;

