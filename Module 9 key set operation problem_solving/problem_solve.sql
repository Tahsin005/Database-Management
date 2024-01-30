/* 
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.
*/

-- Write your MySQL query statement below
-- Problem Link: https://leetcode.com/problems/duplicate-emails/description/?envType=study-plan&id=sql-i
SELECT EMAIL
FROM PERSON
GROUP BY EMAIL
HAVING COUNT(EMAIL) > 1;

/* Employees Earning More Than Their Managers */
/*
 Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
*/

-- Write your MySQL query statement below
-- Problem Link: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
SELECT EMP.NAME AS EMPLOYEE
FROM EMPLOYEE AS EMP, EMPLOYEE AS MGR
WHERE EMP.MANAGERID = MGR.ID AND EMP.SALARY > MGR.SALARY;


/* 
Customers Who Never Order

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
customerId is a foreign key (reference columns) of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/

-- Write your MySQL query statement below

-- Problem Link: https://leetcode.com/problems/customers-who-never-order/description/
SELECT CUSTOMERS.NAME AS CUSTOMERS
FROM CUSTOMERS
    LEFT JOIN ORDERS
        ON CUSTOMERS.ID = ORDERS.CUSTOMERID
GROUP BY CUSTOMERS.ID
HAVING COUNT(ORDERS.CUSTOMERID) = 0;