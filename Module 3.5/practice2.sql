USE employee2;

CREATE TABLE Employee (
    EmpId INT,
    EmpName VARCHAR(255) NOT NULL,
    JoiningYear INT NOT NULL,
    Birthday DATE,
    Designation VARCHAR(50),
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    CONSTRAINT CHK_Salary CHECK (Salary >= 0),
    CONSTRAINT UQ_EmpName UNIQUE (EmpName),
    CONSTRAINT BD_Mismatch CHECK (YEAR(Birthday) <= 2000),
    
    PRIMARY KEY(EmpId, Birthday)
);
INSERT INTO Employee (EmpId, EmpName, JoiningYear, Birthday, Designation, Salary)
VALUES
    (1, 'John Doe', 2020, '1990-05-15', 'Software Engineer', 75000.00),
    (2, 'Jane Smith', 2018, '1985-08-20', 'Project Manager', 90000.00),
    (3, 'Bob Johnson', 2019, '1978-12-10', 'Senior Developer', 80000.00),
    (4, 'Alice Brown', 2021, '1992-02-28', 'QA Analyst', 70000.00),
    (5, 'Charlie Davis', 2017, '1983-11-05', 'System Administrator', 85000.00),
    (6, 'Eva White', 2022, '1995-07-12', 'Data Scientist', 95000.00),
    (7, 'Michael Johnson', 2019, '1988-09-22', 'Marketing Specialist', 78000.00),
    (8, 'Sophia Williams', 2020, '1991-04-18', 'Business Analyst', 82000.00),
    (9, 'Robert Davis', 2018, '1987-06-30', 'Product Manager', 92000.00),
    (10, 'Olivia Miller', 2021, '1993-03-25', 'UX Designer', 89000.00),
    (11, 'Andrew Thompson', 2019, '1986-07-08', 'Database Administrator', 88000.00),
    (12, 'Emily Turner', 2020, '1994-01-12', 'Software Tester', 72000.00),
    (13, 'William Harris', 2017, '1981-09-30', 'Network Engineer', 86000.00),
    (14, 'Grace Parker', 2022, '1996-04-05', 'UX/UI Developer', 91000.00),
    (15, 'Daniel White', 2018, '1984-11-18', 'Technical Writer', 78000.00),
    (16, 'Sophie Martin', 2021, '1990-12-22', 'HR Coordinator', 75000.00),
    (17, 'Jack Davis', 2019, '1987-03-17', 'Business Intelligence Analyst', 93000.00),
    (18, 'Ava Wilson', 2020, '1993-08-27', 'Financial Analyst', 87000.00),
    (19, 'Liam Turner', 2018, '1982-05-03', 'Senior Software Engineer', 100000.00),
    (20, 'Emma Johnson', 2021, '1989-10-15', 'Product Designer', 92000.00),
    (21, 'Mason Taylor', 2019, '1986-07-08', 'Software Engineer', 88000.00),
    (22, 'Sophia Hall', 2020, '1994-01-12', 'Data Analyst', 72000.00),
    (23, 'Ethan Reed', 2017, '1981-09-30', 'DevOps Engineer', 86000.00),
    (24, 'Olivia Wright', 2022, '1996-04-05', 'Business Analyst', 91000.00),
    (25, 'Aiden Lewis', 2018, '1984-11-18', 'UX Designer', 78000.00),
    (26, 'Isabella Foster', 2021, '1990-12-22', 'Marketing Specialist', 75000.00),
    (27, 'Mia Mitchell', 2019, '1987-03-17', 'System Administrator', 93000.00),
    (28, 'Carter Turner', 2020, '1993-08-27', 'Technical Support Specialist', 87000.00),
    (29, 'Henry Brooks', 2018, '1982-05-03', 'Project Manager', 100000.00),
    (30, 'Lily Adams', 2021, '1989-10-15', 'Quality Assurance Analyst', 92000.00);

SELECT *
FROM Employee;

SELECT *
FROM Employee
LIMIT 5
OFFSET 13;

SELECT *
FROM employee
LIMIT 13, 5;

SELECT *
FROM employee
ORDER BY Salary ASC;