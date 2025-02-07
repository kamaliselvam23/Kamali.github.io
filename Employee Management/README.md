## Employee Management System

### Project Overview
This project involves designing and implementing a *relational database* for managing employee records. The system ensures data integrity and efficient data handling using SQL.

### Tools and Technologies Used
- *MySQL*
- *SQL Queries* (CRUD Operations, JOINS, Aggregate Functions)

### Key Features
1. **Database Design**: Created normalized tables with *PRIMARY KEYS* and *FOREIGN KEYS* to maintain data integrity.
2. **Data Operations**:
   - Inserted, updated, and deleted employee records.
   - Calculated salaries and tracked performance using SQL queries.
3. **Complex Queries**:
   - Used *JOINs* to link multiple tables.
   - Applied *aggregate functions* for summarizing data (e.g., total salaries, performance scores).
   - Generated reports on employee performance and payroll.

### How to Run the Project
1. Open *MySQL Workbench* or any SQL client.
2. Execute the script file: `employee_management.sql`
3. Run the provided queries to interact with the database.

### Sample SQL Queries
```sql
-- Retrieve all employees with their department names
SELECT e.employee_id, e.name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Calculate total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;
```
