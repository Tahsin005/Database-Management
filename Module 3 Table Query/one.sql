USE phitron;

-- CREATE TABLE Student(
-- 	Roll CHAR(4) PRIMARY KEY,
--     Name VARCHAR(50) NOT NULL, 
--     Email VARCHAR(60) UNIQUE,
--     Address VARCHAR(255),
--     Age INT CHECK(AGE > 10)
-- );

-- INSERT INTO Student(Roll, Name, Email, Address, Age) VALUES('0001', 'Tahsin', 'tahsin.ferdous3546@gmail.com', 'Savar, Dhaka', 22);

-- INSERT INTO Student(Roll, Name, Email, Address, Age) VALUES('0002', 'Ferdous', 'mtfferdous35@gmail.com', 'Savar, Dhaka', 11);

-- INSERT INTO Student(Roll, Name, Email, Age) VALUES('0003', 'Cubox', 'cubox@gmail.com', 12);
-- CREATE TABLE Student(
-- 	Roll CHAR(4) ,
--     Name VARCHAR(50) NOT NULL, 
--     Email VARCHAR(60),
--     Address VARCHAR(255),
--     Age INT,
--     PRIMARY KEY(Roll),
--     UNIQUE(Email),
--     CHECK(Age>10)
-- );

-- CREATE TABLE Student(
-- 	Roll CHAR(4) ,
--     Name VARCHAR(50) NOT NULL, 
--     Email VARCHAR(60),
--     Address VARCHAR(255),
--     Age INT,
--     CONSTRAINT PRIMARY KEY(Roll),
--     CONSTRAINT UNIQUE(Email),
--     CONSTRAINT CHECK(Age>10)
-- );

-- CREATE TABLE Student(
-- 	Roll CHAR(4) ,
--     Name VARCHAR(50) NOT NULL, 
--     Email VARCHAR(60),
--     Address VARCHAR(255),
--     Age INT,
--     CONSTRAINT pk_rules PRIMARY KEY(Roll),
--     CONSTRAINT unique_rules UNIQUE(Email),
--     CONSTRAINT checking_rules CHECK(Age>10)
-- );

-- CREATE TABLE Library(
-- 	   BookName CHAR(50) PRIMARY KEY,
--     Who_hired CHAR(4),
--     FOREIGN KEY(Who_hired) REFERENCES Student(Roll)
-- );

-- CREATE TABLE Course(
-- 	CourseName VARCHAR(10),
--     University VARCHAR(10),
--     Credit INT,
--     -- Composit Primary Key
--     PRIMARY KEY(CourseName, University)
-- );

SELECT *
FROM Student 
WHERE Age <> 11;