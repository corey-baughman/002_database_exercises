-- Group By exercises
SHOW TABLES;
DESCRIBE titles;

-- 2. There have been only 7 unique titles

SELECT DISTINCT title, COUNT(*) AS n_employees_ever_with_title FROM titles
	GROUP BY title
    ORDER BY COUNT(*) DESC;
    
-- 3.
SELECT last_name FROM employees WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- 4. 
SELECT last_name, first_name FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name
ORDER BY last_name, first_name;

-- 5. Chieq, Lindqvist, Qiwen
SELECT last_name FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 6. Lindqvist 190, Chieq 189, Qiwen 168
SELECT last_name, COUNT(last_name) FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

-- 7. 
SELECT first_name, gender, COUNT(gender) AS number_by_gender 
FROM employees 
WHERE first_name IN('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY first_name, number_by_gender;

-- 8. 
SELECT LOWER(
	CONCAT(
		SUBSTR(first_name, 1, 1),
        SUBSTR(last_name, 1, 4),
        '_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2))) 
AS username, 
COUNT(*) AS users_per_username 
FROM employees
GROUP BY username
HAVING users_per_username > 1
ORDER BY users_per_username DESC;




/* 9. Duplicate usernames? Yes
	  Highest number of incidences of any give username: 6
      Total number of unique usernames with duplicates = 13251 */

SELECT LOWER(
	CONCAT(
		SUBSTR(first_name, 1, 1),
        SUBSTR(last_name, 1, 4),
        '_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2))) 
AS username, 
COUNT(*) AS users_per_username 
FROM employees;

	  
-- Bonus #1 Historic Average Salary for each employee
SHOW TABLES;
DESCRIBE salaries;
SELECT * FROM salaries LIMIT 10;

SELECT emp_no, ROUND(AVG(salary), 2) AS Historical_Avg_Salary FROM salaries
GROUP BY emp_no;

