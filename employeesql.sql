--Create the departments table
/*CREATE TABLE departments (
	dept_no TEXT,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no TEXT,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE dept_manager (
	dept_no TEXT,
	emp_no INT,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE employees (
	emp_no INT,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);*/


--1) Join employee table and salary table to retrieve emp no, last name, first name, gender, and salary
/*SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;*/

--2) List employees hired in 1986
/*SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';*/

--3) List the manager of each dept including dept no, dept name, manager employee no, last name, first name, and start end date
/*CREATE VIEW dept_info AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no
FROM departments
INNER JOIN dept_manager ON
dept_manager.dept_no=departments.dept_no;*/

/*CREATE VIEW dept_mngtitle AS
SELECT dept_info.dept_no, dept_info.dept_name, dept_info.emp_no, titles.title, titles.from_date, titles.to_date
FROM titles
INNER JOIN dept_info ON
dept_info.emp_no=titles.emp_no
WHERE title = 'Manager'*/

/*SELECT dept_mngtitle.dept_no, dept_mngtitle.dept_name, dept_mngtitle.emp_no, dept_mngtitle.title, employees.last_name, employees.first_name, dept_mngtitle.from_date, dept_mngtitle.to_date
FROM employees
INNER JOIN dept_mngtitle ON
dept_mngtitle.emp_no=employees.emp_no;*/

--4) List the department of each employee with the following information: employee number, last name, first name, and department name
/*SELECT dept_info.emp_no, employees.last_name, employees.first_name, dept_info.dept_name
FROM employees
INNER JOIN dept_info ON
dept_info.emp_no=employees.emp_no;*/

--5) List all employees whose first name is "Hercules" and last names begin with "B"
/*SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';*/

--6) List all employees in the Sales department, including their employee number, last name, first name, and department name
/*SELECT dept_info.emp_no, employees.last_name, employees.first_name, dept_info.dept_name
FROM employees
INNER JOIN dept_info ON
dept_info.emp_no=employees.emp_no
WHERE dept_name = 'Sales'*/

--7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
/*SELECT dept_info.emp_no, employees.last_name, employees.first_name, dept_info.dept_name
FROM employees
INNER JOIN dept_info ON
dept_info.emp_no=employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';*/

--8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
/*SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name 
ORDER BY count DESC;*/




