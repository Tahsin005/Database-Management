USE dummydb;

SELECT *
FROM Employees
WHERE Salary < (SELECT Salary
				FROM Employees
                WHERE Employee_id = 144);
                
SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary)
				FROM Employees);
                

SELECT *
FROM Employees
WHERE Department_id = (SELECT Department_id
					   FROM Departments
                       WHERE Department_name = 'Marketing');
                       
SELECT AVG(Salary)
FROM Employees
WHERE Department_id = (SELECT Department_id
					   FROM Departments
                       WHERE Department_name = 'Marketing');
                       
SELECT COUNT(*) AS Members
FROM Employees
WHERE Department_id = (SELECT Department_id
					   FROM Departments
                       WHERE Department_name = 'IT');    
                       
SELECT SUM(Salary)
FROM Employees
WHERE Job_id = (SELECT Job_id
			    FROM Jobs
                WHERE Job_title = 'Programmer');