SELECT EMPLOYEES.FIRST_NAME, JOBS.JOB_TITLE 
FROM EMPLOYEES
	JOIN JOBS
		ON EMPLOYEES.JOB_ID = JOBS.JOB_ID
WHERE EMPLOYEES.SALARY = (SELECT MAX(SALARY)
						  FROM EMPLOYEES);