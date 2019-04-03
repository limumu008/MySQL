-- Remember SELECT database FIRST: use database_name;

-- Create courses table with student and class attributes.
CREATE TABLE courses(
    student VARCHAR(255),
    class VARCHAR(255)
);

INSERT INTO courses VALUES ('A','Math'),('B','English'),('C','Math'),
                           ('D','Biology'),('E','Math'),('F','Computer'),
                           ('G','Math'),('H','Math'),('I','Math'),('A','Math');

/*
+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       | 
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
| A      | Math       |
+---------+------------+
*/

-- List class name which is taken by 5 more students. No duplicate records.

SELECT class
FROM (SELECT DISTINCT * FROM courses) AS temp
GROUP BY class
HAVING count(class) >= 5;

/*
+---------+
| class   |
+---------+
| Math    |
+---------+
*/

-- Create a salary table with id, name, sex and salary attributes
CREATE TABLE salary(
    id int AUTO_INCREMENT,
    name VARCHAR(255),
    sex VARCHAR(255),
    salary int,
    PRIMARY KEY (id)
);

INSERT INTO salary (name,sex,salary) VALUES ('A','m',2500),('B','f',1500),
                                            ('C','m',5500),('D','f',500);

/*
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
*/


--Change sex f to m, m to f without any temporary by using update
UPDATE salary SET sex = '' WHERE sex = 'm';
UPDATE salary SET sex = 'm' WHERE sex = 'f';
UPDATE salary SET sex = 'f' WHERE sex = '';

/*
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | f  | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
*/


--Create two tables, Person and Address.

CREATE TABLE Person(
    PersonId int PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255)
);

CREATE TABLE Address(
    AddressId int PRIMARY KEY,
    PersonId int,
    City varchar(255),
    State varchar(255)
);

-- Supply person's FirstName, LastName, City, State based on two tables which has address or not.

SELECT FirstName, LastName, City, State
FROM Person
LEFT JOIN Address
ON Person.PersonId = Address.PersonId;


-- Create Email table with Id and Email.
CREATE TABLE Email(
    Id int AUTO_INCREMENT,
    Email VARCHAR(255),
    PRIMARY KEY (Id)
);

INSERT INTO Email (Email) VALUES ('a@b.com'),('c@d.com'),('a@b.com');

--DELETE DUPLICATE Email, only keep the email from the smallest ID.
DELETE B FROM Email A INNER JOIN Email B ON A.Id < B.Id;
SELECT * FROM Email;

/*
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | a@b.com |
| 2  | c@d.com  |
+----+------------------+
*/