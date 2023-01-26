use employees;
SHOW TABLES;
DESCRIBE titles;
select distinct title from titles;
select * from employees limit 10;
select distinct last_name from employees order by last_name desc limit 10;
select * from employees 
where hire_date like '199%' 
and birth_date like '%12-25'
order by hire_date
limit 5 offset 45;
-- offset / limit + 1 = page #
-- first five names returned: Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup
