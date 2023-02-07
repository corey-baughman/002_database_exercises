use oneil_2100;
show tables;
select database();
show databases;
use employees;
drop table employees_with_departments;
create temporary table oneil_2100.employees_with_departments as
	select e.first_name, e.last_name, d.dept_name
    from employees e
    join dept_emp using(emp_no)
    join departments d using(dept_no)
    limit 100;
describe oneil_2100.employees_with_departments;
-- 1a) 
alter table employees_with_departments
	add full_name VARCHAR(31);
-- 1b)
update employees_with_departments
	set full_name = concat(first_name, ' ', last_name);
select * from employees_with_departments;
-- 1c)
alter table employees_with_departments
	drop column first_name;
alter table employees_with_departments
	drop column last_name;
select * from employees_with_departments;
-- 1d) Another way to create table? Do the concat in the original select to create the table

-- 2) 
use sakila;
create temporary table oneil_2100.sakila_pay as select * from payment;
use oneil_2100;
select * from sakila_pay limit 10;
describe sakila_pay;
alter table sakila_pay modify amount decimal(10,2);
update sakila_pay set amount = amount * 100;
alter table sakila_pay modify amount int;

/* 3) Find out how the current average pay in each department 
compares to the overall current pay for everyone at the company. 
For this comparison, you will calculate the z-score for each salary. 
In terms of salary, what is the best department right now to work for? The worst?
*/

use employees;
drop table if exists oneil_2100.dept_salary_zscores;
create temporary table oneil_2100.dept_salary_zscores as 
(select dept_name, round(avg(salary), 2) as avg_salary 
	from departments
	join dept_emp
	using (dept_no)
	join salaries
	using (emp_no)
	where salaries.to_date > now()
	and dept_emp.to_date > now()
	group by dept_name);
use oneil_2100;
select * from dept_salary_zscores limit 10;
alter table dept_salary_zscores add overall_avg_salary float;
alter table dept_salary_zscores add overall_std_salary float; 
update dept_salary_zscores
set overall_avg_salary = 
(select round(avg(salary),2) from employees.salaries where to_date > now());
update dept_salary_zscores
set overall_std_salary = 
(select round(std(salary),2) from employees.salaries where to_date > now());
alter table dept_salary_zscores add z_score float;
update dept_salary_zscores
set z_score = (avg_salary - overall_avg_salary) / overall_std_salary;

select * from dept_salary_zscores
order by z_score desc;