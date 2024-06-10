-- Create first table
CREATE TABLE Emp1 (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

Truncate table Emp1;
Truncate table Emp2;

-- Create second table
CREATE TABLE Emp2 (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


-- Insert dummy data into Emp1
INSERT INTO Emp1 (ID, Name, Age) VALUES (1, 'David', 40);
INSERT INTO Emp1 (ID, Name, Age) VALUES (2, 'Eve', 28);
INSERT INTO Emp1 (ID, Name, Age) VALUES (3, 'Frank', 35);
INSERT INTO Emp1 (ID, Name, Age) VALUES (4, 'Alice', 30);
INSERT INTO Emp1 (ID, Name, Age) VALUES (5, 'Bob', 25);
INSERT INTO Emp1 (ID, Name, Age) VALUES (6, 'Charlie', 35);
INSERT INTO Emp1 (ID, Name, Age) VALUES (7, 'Mathew', 41);
INSERT INTO Emp1 (ID, Name, Age) VALUES (8, 'Eve', 28);
INSERT INTO Emp1 (ID, Name, Age) VALUES (11, 'Angela', 32);


-- Insert dummy data into Emp2
INSERT INTO Emp2 (ID, Name, Age) VALUES (1, 'David', 40);
INSERT INTO Emp2 (ID, Name, Age) VALUES (2, 'Eve', 28);
INSERT INTO Emp2 (ID, Name, Age) VALUES (3, 'Frank', 33);
INSERT INTO Emp2 (ID, Name, Age) VALUES (4, 'Alice', 30);
INSERT INTO Emp2 (ID, Name, Age) VALUES (5, 'Bob', 25);
INSERT INTO Emp2 (ID, Name, Age) VALUES (6, 'Charlie', 35);
INSERT INTO Emp2 (ID, Name, Age) VALUES (10, 'Jennifer', 37);
INSERT INTO Emp2 (ID, Name, Age) VALUES (12, 'Alice', 30);


select * from Emp1;
select * from Emp2;