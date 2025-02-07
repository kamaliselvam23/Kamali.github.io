# Employees Table
create table Employees(
Employee_Id int primary key,
FirstName varchar (100),
LastName varchar (100),
DOB date,
Gender varchar(50),
Department_Id int
);

# Departments Table 
create table Departments(
Department_Id int primary key,
DepartmentName varchar (100),
Location varchar (100)
);

# Salary Table
create table Salaries(
Employee_Id int primary key,
Basic_salary decimal (10,2),
Bonus decimal (10,2),
Total_salary decimal (10,2),
foreign key (Employee_Id) References Employees(Employee_Id)
);

# performance Table 
create table Performance(
Employee_Id int,
Review_date date,
Rating int,
comments text, 
foreign key (Employee_Id) references Employees(Employee_Id)
);

# Employees Table Values
insert into Employees (Employee_ID, FirstName, LastName, DOB, Gender, Department_ID) VALUES
(101, 'Alice', 'Smith', '1986-01-13', 'Female', 1),
(102, 'John', 'Lee', '1990-08-23', 'Male', 2),
(103, 'Bob', 'Brown', '1993-05-19', 'Male', 3),
(104, 'Emma', 'Davis', '1991-12-28', 'Female', 4);
select * from Employees; 

# Departments Table Values
insert into Departments (Department_Id, DepartmentName, Location) values
(1,'IT','Chennai'),
(2,'HR','Coimbature'),
(3,'Finance','Delhi'),
(4,'sales','Banglore');
select * from Departments;

# Salaries Table values
insert into Salaries (Employee_Id, Basic_salary, Bonus, Total_salary) values
(101, 60000, 5000, 65000),
(102, 55000, 4000, 59000),
(103, 70000, 6000, 76000),
(104, 62000, 4500, 66500);
select * from Salaries;

# Performance Table values
insert into Performance (Employee_Id, Review_date, Rating, Comments) values
(101, '2024-01-10', 5, 'Excellent Performance'),
(102, '2024-01-12', 4, 'Good work'),
(103, '2024-01-15', 3, 'Needs improvement'),
(104, '2024-01-18', 5, 'Outstanding employee');
select * from Performance;

# 1. Retrieve Employee Details with Their Department Names
select Employees.Employee_Id, Employees.FirstName, Employees.LastName, Departments.DepartmentName
from Employees
join Departments ON Employees.Department_Id = Departments.Department_Id;

 # 2. Find the Top 3 Highest-Paid Employees
 select Employees.FirstName, Employees.LastName, Salaries.Total_salary
 from Employees
 join Salaries on Employees.Employee_Id = Salaries.Employee_Id
 order by Salaries.Total_salary desc;
 
 # 3. List Employees with a Performance Rating of 4 or Above
 select Employees.FirstName, Employees.LastName, Performance.Rating
 from Employees
 join Performance on Employees.Employee_Id = Performance.Employee_Id
 where Performance.Rating >=4 ;
 
 # 4. Calculate the Average Salary for Each Department
select Departments.DepartmentName, ROUND(AVG(Salaries.Total_Salary), 2) AS AvgSalary
from Salaries 
JOIN Employees ON Salaries.Employee_Id = Employees.Employee_Id
JOIN Departments ON Employees.Department_Id = Departments.Department_Id
GROUP BY Departments.DepartmentName;