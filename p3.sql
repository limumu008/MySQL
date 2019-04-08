--Project 7
--Create Emplyee table include Id, Name, Salary, DepartmentId.
CREATE TABLE Employee(
    Id INT AUTO_INCREMENT,
    Name VARCHAR(255),
    Salary INT,
    DepartmentId INT,
    PRIMARY KEY (Id)
);

INSERT INTO Employee (Name, Salary, DepartmentId)
VALUES ('Joe',70000,1),('Henry',80000,2),('Sam',60000,2),('Max',90000,1);
/*
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
*/
--Create Department table include Id, Name.
CREATE TABLE Department(
    Id INT AUTO_INCREMENT,
    Name VARCHAR(255),
    PRIMARY KEY (Id)
);

INSERT INTO Department (Name)
VALUES ('IT'),('Sales');

/*
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
*/
--Query the employee with highest salary for each department.
DELETE EB 
FROM Employee EA 
INNER JOIN Employee EB 
ON EA.DepatmentId = EB.DepartmentId AND EA.Salary > EB.Salary;


SELECT D.Name AS Department, E.Name AS Employee, Salary
FROM Employee E
INNER JOIN Department D
ON D.Id = E.DepartmentId;

/*
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/


--Project 8
--Create seat tablw with id and student.
CREATE TABLE seat(
    id int AUTO_INCREMENT,
    student VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO seat (student) VALUES ('Abbot'),
('Doris'),('Emerson'),('Green'),('Jeames');

/*
+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+*/

--Swip even seat num with odd seat num before it.
SELECT 
(CASE
    WHEN mod(id,2)=1 AND id = (SELECT COUNT(*) FROM seat) THEN id
    WHEN mod(id,2)=1 THEN id + 1
    ELSE id - 1
END) AS id,student
FROM seat
ORDER BY id;

/*
+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
*/
--Project 9
--Create a score table with Id and Score.
CREATE TABLE scores(
    Id INT AUTO_INCREMENT,
    Score FLOAT,
    PRIMARY KEY (Id)
);

INSERT INTO scores (Score) VALUES (3.50),(3.65),(4.00),(3.85),(4.00),(3.65);
/*
+----+-------+
| Id | Score |
+----+-------+
| 1 | 3.50 |
| 2 | 3.65 |
| 3 | 4.00 |
| 4 | 3.85 |
| 5 | 4.00 |
| 6 | 3.65 |
+----+-------+
*/

SELECT Score, (SELECT COUNT(DISTINCT Score) FROM scores WHERE Score >= s.Score) AS 'Rank'
FROM scores s
ORDER BY Score DESC;

/*
+-------+------+
| Score | Rank |
+-------+------+
| 4.00 | 1 |
| 4.00 | 1 |
| 3.85 | 2 |
| 3.65 | 3 |
| 3.65 | 3 |
| 3.50 | 4 |
+-------+------+
*/

--Project 10
--Create Trips with Id, Client_Id,Driver_Id,City_Id, Status, and Request_at
CREATE TABLE Trips(
    Id INT AUTO_INCREMENT,
    Client_Id Int,
    Driver_Id Int,
    City_Id Int,
    Status VARCHAR(255),
    Request_at DATE,
    PRIMARY KEY (Id)
);

INSERT INTO Trips (Client_Id,Driver_Id,City_Id,Status,Request_at)
    VALUES (1,10,1,'completed','2013-10-01'),
            (2,11,1,'cancelled_by_driver','2013-10-01'),
            (3,12,6,'completed','2013-10-01'),
            (4,13,6,'cancelled_by_client','2013-10-01'),
            (1,10,1,'completed','2013-10-02'),
            (2,11,6,'completed','2013-10-02'),
            (3,12,6,'completed','2013-10-02'),
            (2,12,12,'completed','2013-10-03'),
            (3,10,12,'completed','2013-10-03'),
            (4,13,12,'cancelled_by_driver','2013-10-03');

CREATE TABLE Users(
    Users_Id Int PRIMARY KEY,
    Banned VARCHAR(255),
    Role VARCHAR(255)
);

INSERT INTO Users (Users_Id,Banned,Role)
        VALUES (1,'No','client'),
                (2,'Yes','client'),
                (3,'No','client'),
                (4,'No','client'),
                (10,'No','driver'),
                (11,'No','driver'),
                (12,'No','driver'),
                (13,'No','driver');

--Get the cancellation rate for unbanned user between 2013-10-01 and 2013-10-03, keep 2 decimals.
SELECT T2.Request_at AS 'Day', IFNULL(ROUND((C1/C2),2),0) AS 'Cancellation Rate'
FROM (SELECT COUNT(Status) As C1, Request_at FROM Trips WHERE ClientId in (
    SELECT Users_Id FROM Users WHERE Banned='No') AND Status <> 'completed'
    GROUP BY Request_at) as T1 RIGHT JOIN
    (SELECT COUNT(Id) As C2, Request_at FROM Trips WHERE ClientId in (
        SELECT Users_Id FROM Users WHERE Banned='No')
        GROUP BY Request_at) as T2
    ON T1.Request_at = T2.Request_at;

/*
+------------+-------------------+
|     Day    | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 |       0.33        |
| 2013-10-02 |       0.00        |
| 2013-10-03 |       0.50        |
+------------+-------------------+
*/

--Project 11
--Clear the employee table in project 7, reinsert some data.
DELETE FROM employee;
INSERT INTO employee (Id, Name, Salary, DepartmentId) 
    VALUES (1,'Joe',70000,1),(2,'Henry',80000,2),
    (3,'Sam',60000,2),(4,'Max',90000,1),
    (5,'Janet',69000,1),(6,'Randy',85000,1);

--Find top three employees with highest salary for each department.
SELECT D.Name AS Department, E.Name AS Employee, Salary
FROM employee E
INNER JOIN department D
ON D.Id = E.DepartmentId
WHERE (
    SELECT COUNT(DISTINCT salary)
    FROM employee
    WHERE salary > e.salary AND departmentId = E.DepartmentId
) < 3
ORDER BY E.departmentId, Salary DESC;
/*
+------------+----------+--------+
| Department | Employee | Salary |
+------------+---- ------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
*/

--Project 12
--Rank the score in the scores table with uncontinues order.
SELECT Score, (SELECT COUNT(Score)+1 FROM scores WHERE Score > s.Score) AS 'Rank'
FROM scores
ORDER BY score DESC;

/*
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 3    |
| 3.65  | 4    |
| 3.65  | 4    |
| 3.50  | 6    |
+-------+------
*/