USE dummydb;

SELECT Department_id, COUNT(Salary)
FROM Employees
GROUP BY Department_id;

/* HAVING is used on GROUP FUNCTION and WHERE is used on whole table*/
SELECT Department_id, MAX(Salary)
FROM Employees
Where Department_id != 20
GROUP BY Department_id
HAVING MAX(SALARY) > 5000;