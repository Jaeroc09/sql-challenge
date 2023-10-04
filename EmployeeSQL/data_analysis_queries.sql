-- List employee number, last name, first name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on e.emp_no = s.emp_no
order by e.emp_no asc;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where date_part('Year', hire_date) = 1986
order by hire_date asc;

-- List the manager of each department along with their department number, department name,
-- employee number, last name, and first name.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from employees as e
inner join dept_manager as m on m.emp_no = e.emp_no
inner join departments as d on d.dept_no = m.dept_no
order by d.dept_no asc, e.last_name asc;

-- List the department number for each employee along with that employee’s employee number, last name,
-- first name, and department name.
select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join departments as d on d.dept_no = de.dept_no
inner join employees as e on e.emp_no = de.emp_no
order by emp_no asc, dept_no asc;

-- List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name asc;

-- List each employee in the Sales department, including their employee number, last name, and first name.
select de.emp_no, e.last_name, e.first_name
from dept_emp as de
inner join employees as e on e.emp_no = de.emp_no
where de.dept_no in
(
	select dept_no from departments
	where dept_name = 'Sales'
);

-- List each employee in the Sales and Development departments, including their employee number, last name,
-- first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join employees as e on e.emp_no = de.emp_no
inner join departments as d on d.dept_no = de.dept_no
where de.dept_no in
(
	select dept_no from departments
	where dept_name = 'Sales'
	or dept_name = 'Development'
);

-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name).
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;