USE dummydb;



SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
				FROM EMPLOYEES
				WHERE SALARY < (SELECT MAX(SALARY)
								FROM EMPLOYEES
								WHERE SALARY < (SELECT MAX(SALARY)
												FROM EMPLOYEES)));
                                                
SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC;