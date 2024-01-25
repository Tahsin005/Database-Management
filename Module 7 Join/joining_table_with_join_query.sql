USE dummydb;

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
                
/* WAY - 1 */
SELECT EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

/* WAY - 2 */

/* INSIDE THE USING() FUNCTION, THERE COULD BE ONLY ONE PARAMETER... SO THE FIELD NAME
HAVE TO BE SAME IN THE BOTH TABLE, WHICH IS NOT IN THE CASE OF THE PREVIOUS ONE USING
THE 'ON' KEYWORD */
SELECT EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID);