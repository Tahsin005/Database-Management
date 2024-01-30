USE STUDENT_LIBRARY_MANAGEMENT;
DROP TABLE STUDENT;
DROP TABLE BOOK;
DROP TABLE BORROWING;
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL
);

CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ISBN VARCHAR(13),
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

INSERT INTO Student(StudentID, Name, Email, Phone, Address) VALUES(1, 'MD. TAHSIN FERDOUS', 'tahsin_ferdous@gmail.com', '10343376239', 'Wayne Manor');
INSERT INTO Student(StudentID, Name, Email, Phone, Address) VALUES(2, 'NILOY', 'niloy@gmail.com', '10269756342', 'Stark Mansion');
INSERT INTO Student(StudentID, Name, Email, Phone, Address) VALUES(3, 'RIDWAN', 'ridwan@gmail.com', '10235475847', 'forest hills');

INSERT INTO Book(ISBN, Title, Author, Genre, TotalCopies, AvailableCopies) 
VALUES("9780140430721", "Pride and Prejudice", "Jane Austen", "Romance", 2000, 250);
INSERT INTO Book(ISBN, Title, Author, Genre, TotalCopies, AvailableCopies) 
VALUES("9780192823786", "The Adventures of Sherlock Holmes", "Arthur Conan Doyle", "Mystery", 5000, 670);
INSERT INTO Book(ISBN, Title, Author, Genre, TotalCopies, AvailableCopies) 
VALUES("9780545791878", "Hunger Games", "Suzanne Collins", "Thriller", 10000, 150);



INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate) 
VALUES(1, 3, '9780192823786', CURRENT_DATE(), '2023-11-17','2023-11-15');
INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate) 
VALUES(2, 3, '9780545791878', CURRENT_DATE(), '2023-11-17','2023-11-15');
INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate) 
VALUES(3, 3, '9780140430721', CURRENT_DATE(), '2023-11-17','2023-11-15');
INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate) 
VALUES(4, 1, '9780140430721', '2023-11-16', '2023-11-23','2023-11-19');
INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate) 
VALUES(5, 2, '9780192823786', '2023-11-16', '2023-11-23','2023-11-19');
INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate) 
VALUES(6, 1, '9780545791878', '2023-11-16', '2023-11-23','2023-11-19');

SELECT * FROM STUDENT;
SELECT * FROM BOOK;
SELECT * FROM BORROWING;

-- SET @ISBN :=(
-- 	SELECT ISBN 
-- 	FROM BOOK
-- 	ORDER BY AvailableCopies DESC
-- 	LIMIT 1
-- );

-- 2 NO -- 
INSERT INTO Borrowing(BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES (7, 3,
	(SELECT ISBN FROM Book ORDER BY AvailableCopies DESC LIMIT 1),
    CURRENT_DATE(), '2024-02-19','2023-02-14');
    
    
-- 3 NO -- 
UPDATE BOOK
SET AvailableCopies = AvailableCopies - 1
WHERE ISBN = (
			SELECT ISBN
            FROM BORROWING
            ORDER BY BorrowID DESC
            LIMIT 1);


-- TESTING --
			-- SELECT COUNT(*)
			-- FROM BORROWING
			-- GROUP BY StudentID;


			-- SELECT MAX(CNT)
			--         FROM (
			-- 			  SELECT COUNT(*) AS CNT
			--               FROM BORROWING
			--               GROUP BY StudentID) AS BORROW;
-- 4 NO -- 
SELECT STD.NAME
FROM STUDENT AS STD
	JOIN BORROWING AS BOR
    ON STD.StudentID = BOR.StudentID
GROUP BY STD.NAME 
HAVING COUNT(*) = (
		SELECT MAX(CNT)
        FROM (
			  SELECT COUNT(*) AS CNT
              FROM BORROWING
              GROUP BY StudentID) AS BORROW
);


-- 5 NO --
SELECT B.Title, BR.StudentID
FROM BOOK AS B
	JOIN BORROWING AS BR
		ON B.ISBN = BR.ISBN
WHERE BR.ReturnDate < CURRENT_DATE();

-- 8 --
SELECT MIN(SALARY) 
FROM EMPLOYEES
WHERE SALARY > (SELECT MIN(SALARY)
				FROM EMPLOYEES);
                
-- 9 -- 
CREATE TABLE DEPARTMENT(
    DEP_ID CHAR(4) PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(50)
);

CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID CHAR(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR(50),
    DEPARTMENT_ID CHAR(4),

    FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENT(DEP_ID) 
    ON DELETE SET NULL
);

CREATE TABLE JOB_HISTORY(
    EMPLOYEEID char(4),
    JOINING_DATE date,
    REGISTRATION_DATE date,

    FOREIGN KEY(EMPLOYEEID) REFERENCES EMPLOYEES(EMPLOYEE_ID) 
    ON DELETE CASCADE
);