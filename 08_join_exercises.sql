SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE departments;
SHOW CREATE TABLE departments;
SHOW CREATE TABLE dept_emp;
SHOW CREATE TABLE dept_manager;
SHOW CREATE TABLE employees;
SHOW CREATE TABLE salaries;
SHOW CREATE TABLE titles;
USE join_example_db;

-- JOIN EXAMPLE DATABASE EXERCISES:

-- 1.
SELECT * FROM roles;
SELECT * FROM users;

-- 2. I anticipate four results
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

-- 3. list of roles and number of users in each role
SELECT COUNT(users.name) AS num_users, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name; 

-- EMPLOYEE DATABASE EXERCISES:

-- 1. 
USE employees;

-- 2. query department names and current manager for each department
SELECT de.dept_name AS dept_name, CONCAT( e.first_name, ' ', e.last_name) AS current_dep_manager
FROM departments AS de
LEFT JOIN dept_manager AS dm 
ON de.dept_no = dm.dept_no
LEFT JOIN employees as e
ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01';

-- 3. Select (department name, mangager name) where managers are women
SELECT de.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name', e.gender AS gender 
FROM departments AS de
LEFT JOIN dept_manager AS dm
ON de.dept_no = dm.dept_no
LEFT JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE e.gender = 'F'
AND dm.to_date = '9999-01-01';

SELECT * FROM departments;

-- 4. COUNT of employees in each current title of customer service department
SELECT t.title AS 'Title', COUNT(t.title) AS 'Count'
FROM employees as e
LEFT JOIN titles AS t
ON e.emp_no = t.emp_no
LEFT JOIN dept_emp AS de
ON t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
AND t.to_date > NOW()
AND de.to_date > NOW()
GROUP BY t.title;

-- 5. Current salaries of all current managers. Return Department Name, Name, and Salary
SELECT de.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM employees AS e
	LEFT JOIN salaries as s
		USING (emp_no)
	LEFT JOIN dept_manager AS dm
		USING (emp_no)
	LEFT JOIN departments AS de
		USING (dept_no)
WHERE dm.to_date > NOW()
	AND s.to_date > NOW()
ORDER BY de.dept_name;

-- 6. Number of current employees in each department
SELECT de.dept_no, d.dept_name, COUNT(e.emp_no) AS num_employees
FROM employees as e
	LEFT JOIN dept_emp as de
		USING (emp_no)
	LEFT JOIN departments as d
		USING (dept_no)
WHERE de.to_date > NOW()
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- 7. Department with highest average salary. dept_name, average_salary
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM employees AS e
	LEFT JOIN salaries AS s
		USING (emp_no)
	LEFT JOIN dept_emp AS de
		USING (emp_no)
	LEFT JOIN departments AS d
		USING (dept_no)
WHERE de.to_date > NOW()
	AND s.to_date > NOW()
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1;


-- 8. Highest paid employee in marketing dept now?
SELECT e.first_name, e.last_name
FROM employees AS e
	LEFT JOIN salaries AS s
		USING (emp_no)
	LEFT JOIN dept_emp AS de
		USING (emp_no)
WHERE de.dept_no = 'd001'
	AND de.to_date > NOW()
    AND s.to_date > NOW()
ORDER BY s.salary DESC
LIMIT 1;

-- 9. Current Department Manager w/ Highest Salary
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
	LEFT JOIN salaries AS s
		USING (emp_no)
	LEFT JOIN dept_manager AS dm
		USING (emp_no)
	LEFT JOIN departments AS d
		USING (dept_no)
WHERE dm.to_date > NOW()
	AND s.to_date > NOW()
ORDER BY s.salary DESC
LIMIT 1;

-- 10. Average salary for each department
SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM salaries AS s
	RIGHT JOIN dept_emp AS de
		USING (emp_no)
	LEFT JOIN departments as d
		USING (dept_no)
GROUP BY de.dept_no
ORDER BY AVG(s.salary) DESC;
	
