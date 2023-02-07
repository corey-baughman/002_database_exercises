use employees;
SHOW TABLES; 
describe employees;
describe dept_emp;
describe salaries;
/* 1. Write a query that returns all employees, 
their department number, their start date, 
their end date, and a new column 'is_current_employee' 
that is a 1 if the employee is still with the company and 0 if not.*/

-- how to select end date? 
select emp_no, max(to_date) from salaries
group by emp_no;

select e.emp_no, concat(e.first_name, ' ', e.last_name) as 'full_name',
	de.dept_no, e.hire_date, de.to_date,
if(de.to_date > curdate(), 1, 0) as 'is_current_employee'
from employees as e
join dept_emp as de
using (emp_no)
;

/* Write a query that returns all employee names (previous and current), 
and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending 
on the first letter of their last name.
*/

select first_name, last_name, 
	case
		when last_name like 'a%' or last_name like 'b%' or last_name like 'c%' 
			or last_name like 'd%' or last_name like 'e%' or last_name like 'f%' 
			or last_name like 'g%' or last_name like 'h%' then 'A-H'
		when last_name like 'i%' or last_name like 'j%' or last_name like 'k%' 
			or last_name like 'l%' or last_name like 'm%' or last_name like 'n%' 
			or last_name like 'o%' or last_name like 'p%' or last_name like 'q%' then 'I-Q'
		else 'R-Z'
	end as 'alpha_group'
from employees;

-- or...
select first_name, last_name, 
case
	when substr(first_name, 1, 1) < 'h' then 'A-H'
    when substr(first_name, 1, 1) between 'i' and 'q' then 'I-Q'
    else 'R-Z'
end as alpha_group
from employees;
    
-- 3. How many employees (current or previous) were born in each decade? 50s 182886, 60s 117138

select 
	count(case when birth_date like '195%' then 1 else null end) as 'born_1950s',
    count(if(birth_date like '196%', 1, null)) as 'born_1960s'
    -- used one if and one case when. could've used two of either.
from employees;

/* 4. What is the current average salary for each of the following department groups: 
R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? */

select
    case
        when d.dept_name in ('Research', 'Development') then 'R&D'
        when d.dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
        when d.dept_name in ('Production', 'Quality Management') then 'Prod & QM'
        when d.dept_name in ('Finance', 'Human Resources') then 'Finanace & HR'
        else d.dept_name
    end as dept_group,
    round(avg(s.salary)) as avg_salary
from departments d
join dept_emp de using (dept_no)
join salaries s using (emp_no)
where s.to_date > NOW() and de.to_date > NOW()
group by dept_group;
