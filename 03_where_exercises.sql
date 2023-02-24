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


