USE programminghero;

CREATE TABLE Student(
	Roll CHAR(4) PRIMARY KEY,
    Name VARCHAR(50), 
    MARKS DOUBLE
);

INSERT INTO Student
(Roll, Name, Marks) VALUES(1, 'Tahsin', 96);

INSERT INTO Student
(Roll, Name, Marks) VALUES(2, 'Ferdous', 90);

SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET Name = 'MD. Tahsin'
WHERE Roll = 1;
SET SQL_SAFE_UPDATES= 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Student
WHERE Roll = 1;
SET SQL_SAFE_UPDATES = 1;