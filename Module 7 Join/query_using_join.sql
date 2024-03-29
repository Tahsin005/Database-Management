/* SELF JOIN */
USE dummydb;

SELECT * FROM EMPLOYEES;

SELECT M.FIRST_NAME, E.FIRST_NAME
FROM EMPLOYEES AS E
	JOIN EMPLOYEES AS M
    ON E.EMPLOYEE_ID = M.MANAGER_ID;


/* DEPARTMENTS WITH NO EMPLOYEES IN THEM */
SELECT DEPARTMENTS.DEPARTMENT_NAME
FROM DEPARTMENTS
	LEFT JOIN EMPLOYEES
		ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
WHERE EMPLOYEES.DEPARTMENT_ID IS NULL;

/* EMPLOYEES FIRST NAME, SALARY AND HOW MUCH LESS MONEY HE GETS COMPARED TO HIS DEPARTMENTS
AVERAGE SALARY */
SELECT
	EMPLOYEES.FIRST_NAME,
    EMPLOYEES.SALARY,
    (EMPLOYEES.SALARY - (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID)) AS RESULT
FROM EMPLOYEES
	JOIN DEPARTMENTS
		ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;


/* DEPARTMENTS WITH MIN SALARY GREATER THAN 5000 */
SELECT DEPARTMENT_NAME, MIN(SALARY)
FROM EMPLOYEES
	JOIN DEPARTMENTS
		ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
HAVING MIN(SALARY) > 5000;
