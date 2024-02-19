CREATE DATABASE Employee_Management;

 CREATE TABLE Departments (
   Code INTEGER PRIMARY KEY NOT NULL,
   Name VARCHAR(100) NOT NULL ,
   Budget REAL NOT NULL);

INSERT INTO Departments(Code,Name,Budget) 
VALUES(14,'IT',65000),
(37,'Accounting',15000),
(59,'Human Resources',240000),
(77,'Research',55000);

 
 CREATE TABLE Employees (
   SSN INTEGER PRIMARY KEY NOT NULL,
   Name TEXT NOT NULL ,
   LastName VARCHAR(100) NOT NULL ,
   Department INTEGER NOT NULL , 
   CONSTRAINT fk_Departments_Code FOREIGN KEY(Department) 
   REFERENCES Departments(Code)); 
 
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','O''Donnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

select * from departments;

select * from employees;
-- Questions
-- 1. Select the last name of all employees.
select lastname from employees;

-- 2. Select the last name of all employees, without duplicates.
select distinct(lastname) from employees;

-- 3. Select all the data of employees whose last name is "Smith".
select * from employees
where LastName = 'smith';

-- 4. Select all the data of employees whose last name is "Smith" or "Doe".
select * from employees
where LastName = 'smith'
or LastName = 'doe';

-- 5. Select all the data of employees that work in department 14.
select * from employees
where Department = 14;

-- 6. Select all the data of employees that work in department 37 or department 77.
select * from employees
where Department = 37
or Department = 77;

-- 7. Select all the data of employees whose last name begins with an "S".
select * from employees
where LastName like 's%';

-- 8. Select the sum of all the departments' budgets.
select *, sum(budget)
from departments
group by 1;

select * from departments;


-- 9. Select the number of employees in each department (you only need to show the department code and the number of employees).
select *
from departments
right join employees
on departments.name = employees.name;

select Department from employees
where department = all
(select * from employees
where Department = 37);