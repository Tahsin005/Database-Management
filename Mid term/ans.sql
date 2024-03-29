USE dummydb;

SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;
SELECT * FROM DEPARTMENTS;

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY)
				FROM EMPLOYEES);

SELECT DEPARTMENTS.DEPARTMENT_NAME, AVG(SALARY)
FROM EMPLOYEES
	JOIN DEPARTMENTS
		ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
GROUP BY EMPLOYEES.DEPARTMENT_ID;


SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE SALARY < (SELECT SALARY
				FROM EMPLOYEES
                WHERE FIRST_NAME = 'STEVEN'
                LIMIT 1);

SELECT JOB_ID, COUNT(JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID;


SELECT DEPARTMENTS.DEPARTMENT_NAME
FROM DEPARTMENTS
	LEFT JOIN EMPLOYEES
		ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE EMPLOYEES.DEPARTMENT_ID IS NULL;