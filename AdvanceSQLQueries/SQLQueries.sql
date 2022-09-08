CREATE DATABASE EMPLOYEEDB;
DROP DATABASE EMPLOYEEDB;

CREATE DATABASE EMPLOYEEDB_SERVICES;

CREATE TABLE EmployeeDB(
EmpID int Primary Key,
FirstName varchar(200),
LastName varchar(200),
Address varchar(1000),
City char(100),
State char(100),
Zip bigint,
PhoneNumber bigint,
Email varchar(200)

);

INSERT INTO EmployeeDB
VALUES(1,'Luv','Sahu','Shan Road','Jaipur','Rajasthan',560065,5243454345,'abc@gmail.com'),
(2,'Deepak','Saini','NEB Road','Dehli','Dehli',560066,1323567775,'duf@gmail.com'),
(3,'Atul','Gupta','Katla Road','Ajmer','Rajasthan',450065,5478908765,'lip@gmail.com'),
(4,'Rohit','katariya','Bhagat Singh Road','Jaipur','Rajasthan',660065,5243458745,'jkl@gmail.com');

select * from EmployeeDB;

UPDATE EmployeeDB set EmpID=3401 where FirstName='Luv';
UPDATE EmployeeDB set EmpID=3402 where FirstName='Deepak';
UPDATE EmployeeDB set EmpID=3403 where FirstName='Atul';
UPDATE EmployeeDB set EmpID=3404 where FirstName='Rohit';

Delete From EmployeeDB where LastName='Gupta';

INSERT INTO EmployeeDB
Values(3405,'Rahul','Raj','9th line Road','Kota','Rajasthan',560087,1234567897,'lkj@gmail.com'),
(3406,'Rishi','Dutt','Main Road','Ajmer','Rajasthan',560097,1234567807,'omn@gmail.com'),
(3407,'Shivam','Raj','145 Block Shan Road','Nuh','Haryana',561237,1653267897,'ytr@gmail.com');

SELECT FirstName From EmployeeDB where  City='Ajmer' or State='Rajasthan';

SELECT COUNT(FirstName) as EmployeeDBCount,State,City from EmployeeDB group by State,City;

SELECT FirstName,City from EmployeeDB ORDER BY FirstName;

SELECT * from EmployeeDB ORDER BY LastName;

SELECT * from EmployeeDB ORDER BY City;

ALTER TABLE EmployeeDB
ADD Type Varchar(200);

ALTER TABLE EmployeeDB
Drop Column Type;

SELECT COUNT(EmpID) as NumberOfPersons from EmployeeDB ;

CREATE TABLE DepartmentDB(
    DepttID int NOT NULL,
    DepttName varchar(200),
    EmpID int,
    PRIMARY KEY (DepttID),
    FOREIGN KEY (EmpID) REFERENCES EmployeeDB(EmpID)
);

select * from DepartmentDB;

INSERT INTO DepartmentDB
Values(101,'IT',3401),
(102,'Finance',3401),
(103,'HR',3406),
(104,'Sales',3406),
(105,'Development',3402),
(106,'Admin',3404),
(107,'Accounts',3407);

SELECT EmployeeDB.EmpID, DepartmentDB.DepttName, EmployeeDB.FirstName
FROM DepartmentDB
INNER JOIN EmployeeDB ON DepartmentDB.EmpID=EmployeeDB.EmpID;

SELECT DepartmentDB.DepttName, EmployeeDB.EmpID
FROM EmployeeDB
LEFT JOIN DepartmentDB ON DepartmentDB.EmpID = EmployeeDB.EmpID
ORDER BY DepartmentDB.DepttName;

SELECT DepartmentDB.DepttID, EmployeeDB.FirstName, EmployeeDB.LastName
FROM DepartmentDB
RIGHT JOIN EmployeeDB ON DepartmentDB.EmpID = EmployeeDB.EmpID
ORDER BY DepartmentDB.DepttID;

SELECT EmployeeDB.FirstName, DepartmentDB.DepttID
FROM EmployeeDB
FULL OUTER JOIN DepartmentDB ON EmployeeDB.EmpID=DepartmentDB.EmpID
ORDER BY EmployeeDB.FirstName;

SELECT A.FirstName AS FirstName1, B.FirstName AS FirstName2, A.City
FROM EmployeeDB A, EmployeeDB B
WHERE A.EmpID <> B.EmpID
AND A.City = B.City
ORDER BY A.City;

select * from EmployeeDB;
