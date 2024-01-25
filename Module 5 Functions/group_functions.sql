USE dummydb;

SELECT *
FROM Employees;

SELECT MAX(Salary)
FROM Employees;

SELECT MIN(Salary)
FROM Employees;

SELECT SUM(Salary) AS sum_of_salary
FROM Employees;

SELECT AVG(Salary)
FROM Employees;

SELECT COUNT(Salary)
FROM Employees;

SELECT COUNT(Employee_id)
FROM Employees;

SELECT *
FROM Employees;

SELECT COUNT(*)
FROM Employees;

/* Does not count if the value is NULL */
SELECT COUNT(Manager_id)
FROM Employees;