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


--- Queries for data comparison

---no of rows in emp1 not in emp2
select count(*) from Emp1 
left join Emp2 on Emp1.ID=Emp2.Id
where emp2.ID is null;

---no of rows in emp2 not in emp1
select count(*) from Emp1 
right join Emp2 on Emp1.ID=Emp2.Id
where emp1.ID is null;


----matched records
select * from Emp1 
inner join Emp2 on Emp1.ID=Emp2.Id and Emp1.Name=Emp2.Name and
Emp1.Age=Emp2.Age;

--mismatched records
select * from Emp1 
inner join Emp2 on Emp1.ID=Emp2.Id and Emp1.Name=Emp2.Name and
Emp1.Age!=Emp2.Age;



---column level comparison

SELECT 
    'emp1' AS TableName, 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    NUMERIC_PRECISION, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'emp1'
UNION ALL
SELECT 
    'emp2' AS TableName, 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    NUMERIC_PRECISION, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'emp2'
ORDER BY COLUMN_NAME, TableName;




-- Compare data in columns of emp1 and emp2
SELECT 
    COALESCE(e1.id, e2.id) AS id, 
    e1.name AS emp1_name, 
    e2.name AS emp2_name, 
    e1.age AS emp1_age, 
    e2.age AS emp2_age
FROM emp1 e1
FULL OUTER JOIN emp2 e2 ON e1.id = e2.id
WHERE e1.name <> e2.name
   OR e1.age <> e2.age
   OR (e1.name IS NULL AND e2.name IS NOT NULL)
   OR (e1.name IS NOT NULL AND e2.name IS NULL)
   OR (e1.age IS NULL AND e2.age IS NOT NULL)
   OR (e1.age IS NOT NULL AND e2.age IS NULL);
