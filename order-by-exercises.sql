SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE employees;
select * from employees;
select * from employees where first_name in ('Irena', 'Vidya', 'Maya');
-- 2. 709 records returned
select * from employees where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
-- 3. 709 records returned. Matches Q2.
select * from employees where 
(first_name = 'Irena' and gender = 'M') or
(first_name = 'Vidya' and gender = 'M') or
(first_name = 'Maya' and gender = 'M');
-- 4. 441 records returned
select * from employees where last_name like 'e%';
-- 5. 7330 records returned
select * from employees where last_name like 'e%' or last_name like '%e';
-- 6. 30723 records returned
select * from employees where last_name like 'e%' and last_name like '%e';
select * from employees where last_name like '%e';
-- 7. 899 rows returned, 24292 rows returned
select * from employees where hire_date like '199%';
-- 8. 135214 rows returned
select * from employees
where (birth_date like '%12-25');
-- 9. 842 rows returned
select * from employees
where (birth_date like '%12-25') and
(hire_date like '199%');
-- 10. 362 rows returned
select first_name, last_name
from employees
where last_name like '%q%';
-- 1873 rows returned 
select first_name, last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%';
-- 547 rows returned
select * from employees where first_name in ('Irena', 'Vidya', 'Maya') order by first_name;
-- 2. first in list Irena Reutenauer, last in list Vidya Simmen
select * from employees where first_name in ('Irena', 'Vidya', 'Maya') order by first_name, last_name;
-- 3. first in list Irena Acton, last in list Vidya Zweizig
select * from employees where first_name in ('Irena', 'Vidya', 'Maya') order by last_name, first_name;
-- 4. first in list Irena Acton, last in list Maya Zyda
select * from employees where last_name like 'e%e' order by emp_no;
-- 5. 899 results returned; first in list 10021, Ramzi Erde; last in list 499648, Tadahiro Erde
select * from employees where last_name like 'e%e' order by hire_date desc;
select * from employees where last_name like 'e%e' order by birth_date;
-- 6. 899 results returned; newest employee on list Teiji Eldridge; oldest employee on list Piyush Erbe
select * from employees where hire_date like '199%' and hire_date like '%12-25' order by hire_date, birth_date;
-- 346 rows returned; 
-- oldest employee who was hired last, Susanta Gecsei; 
-- youngest employee hired first, Conrado Heijenga