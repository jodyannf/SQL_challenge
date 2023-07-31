create table departments (
	dept_no varchar(10) PRIMARY KEY not null,
	dept_name varchar(100) not null
);
select * from departments;

create table employees (
	emp_no int primary key not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	gender varchar(1) not null,
	hire_date date not null
);
select * from employees;

create table dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(10) not null,
	foreign key (dept_no) references departments (dept_no),
	from_date date not null,
	to_date date not null
);
select * from dept_emp;

create table dept_manager (
	dept_no varchar(10) not null,
	foreign key (dept_no) references departments (dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	from_date date not null,
	to_date date not null
);
select * from dept_manager;

create table salaries (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	salary int not null,
	from_date date not null,
	to_date date not null
);
select * from salaries;

create table titles (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	title varchar(30) not null,
	from_date date not null,
	to_date date not null
);
select * from titles;