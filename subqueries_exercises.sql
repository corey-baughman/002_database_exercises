-- SUBQUERIES EXERCISES

-- 1. Find all current employees with the same hire date at emp 101010 using a subquery
-- subquery: find hire date of emp 101010
-- outer query: select employee id, CONCAT(first_name, last_name), hire date
-- conditions 	1) Hire date same as employee 101010  AND
-- 				2) employee number not 101010
SELECT * FROM dept_emp LIMIT 10;
SELECT emp_no, CONCAT(first_name, ' ', last_name), hire_date
	FROM employees
    WHERE hire_date = (SELECT hire_date FROM employees WHERE emp_no = 101010)
    AND emp_no != 101010;
    
-- 2. Find all the titles ever held by all current employees with first name Aamod
-- Return list of titles
-- find current employees: to_date in dept_emp table
-- 		filter by first name Aamod
-- 			group by title
-- tables needed: employees, titles, dept_emp. Join on emp_no

SELECT title, COUNT(*) AS 'num_holders_ever_named_Aamod'
	FROM titles
    WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod')
    AND emp_no IN (SELECT emp_no FROM dept_emp WHERE to_date > CURDATE())
GROUP BY title
ORDER BY COUNT(*) DESC;

/* 3. How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.*/

-- Select COUNT(emps NOT currently employed)
-- inner query: dept_emp.emp_no WHERE to_date < NOW()
-- outer query: select count(*) from employees where (subquery)
SELECT emp_no FROM salaries WHERE to_date > CURDATE();

SELECT COUNT(*) (SELECT emp_no FROM salaries WHERE NOT IN (SELECT emp_no FROM to_date > CURDATE()) AS form_emps;
-- 91479 ex-employees

-- 4. Find all the current department managers that are female. 
-- List their names in a comment in your code.

select * from dept_manager;
select * from employees limit 10;

select concat(first_name, ' ', last_name) name, gender from employees
-- conditions:
 		where emp_no IN (select emp_no from dept_manager where to_date > NOW())
 		and gender = 'F';
-- Female Department Managers: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- 5. Find all the employees who currently have a higher salary than the companies overall, 
-- historical average salary.
select avg(salary) from salaries;
select count(emp_no) from employees;
SELECT emp_no FROM salaries WHERE salary > (select avg(salary) from salaries);
SELECT e.first_name, e.last_name, s.salary, (select AVG(salary) from salaries)
	FROM
	(SELECT DISTINCT emp_no FROM salaries WHERE salary > (select AVG(salary) from salaries)) AS above_avg
    JOIN employees as e
    ON above_avg.emp_no = e.emp_no
    JOIN salaries as s
	ON e.emp_no = s.emp_no
    WHERE s.to_date > NOW()
    ORDER BY s.salary DESC;
    
-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?
-- write query to find current salary
select salary from salaries where to_date > now() limit 10; -- works
-- write query to find number of STD of a current salary
select ((abs((select salary from salaries where to_date > now()) - max(select salary from salaries)) /
		std(select salary from salaries)) 
        limit 10;