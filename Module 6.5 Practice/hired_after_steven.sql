/* HIRED AFTER STEVEN */
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE
				   FROM EMPLOYEES
                   WHERE FIRST_NAME = 'STEVEN'
                   LIMIT 1);