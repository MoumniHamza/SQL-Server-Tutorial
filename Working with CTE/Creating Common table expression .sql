USE sample2
Go



CREATE TABLE department( departmentID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
department_name nvarchar(20) NOT NULL)
Alter table department alter column department_name nvarchar(20) Not null

CREATE TABLE employee ( ID int Not Null Primary key IDENTITY(1,1),
first_name nvarchar(40) NOT NULL,
last_name nvarchar(50) NOT NULL,
age int check( age>0 and age<100),
departmentID int NOT NULL,
constraint  fk_employee_departmentID foreign key (departmentID) references department(departmentID))


INSERT INTO department values ('IT'),('HR'),('Sales'),('Management')
INSERT INTO employee values ('hamza','moumni', 20, 10),('hamza','moumni', 20, 11),('hamza','moumni', 20, 12),('hamza','moumni', 20, 13)

select * from department 
select * from employee



; with TABLE_NAME
as
	(
		select first_name , last_name, department_name
		from employee inner join department
		on employee.departmentID = department.departmentID
	)

select first_name , last_name
from TABLE_NAME
where department_name = 'Sales'