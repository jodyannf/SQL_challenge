-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	e.sex, 
	s.salary
FROM "employees" AS e
JOIN "salaries" AS s 
ON e.emp_no = s.emp_no;

-- 2 List first name, last name, and hire date for employees who were hired in 1986
SELECT 
	first_name,
	last_name,
	hire_date 
FROM "employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	d_m.dept_no,
	d.dept_name,
	d_m.emp_no,
	e.last_name,
	e.first_name
FROM "department_manager" AS d_m
JOIN "departments" AS d
ON d_m.dept_no = d.dept_no 
JOIN "employees" AS e
ON d_m.emp_no = e.emp_no;

-- 4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW employee_department AS
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name, 
	d.dept_name
FROM "employees" AS e
JOIN "department_Employee" AS d_e
ON e.emp_no = d_e.emp_no
JOIN "departments" AS d  
ON d_e.dept_no = d.dept_no;

SELECT * FROM employee_department;


-- 5/ List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
	first_name,
	last_name,
	sex
FROM "employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6 List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
	emp_no,
	last_name,
	first_name,
	dept_name 
FROM employee_department
WHERE dept_name = 'Sales';

-- 7 List each employee in the Sales department, including their employee number, last name, and first name
SELECT *
FROM employee_department
WHERE dept_name IN ('Sales','Development');

-- 8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT 
	last_name,
	COUNT(last_name) AS "Frequency count"
FROM "employees"
GROUP BY last_name
ORDER BY "Frequency count" DESC;