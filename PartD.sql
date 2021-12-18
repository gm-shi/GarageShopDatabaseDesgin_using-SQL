/*(Database, Assignment Part D, Autumn 2021*/
/*First student’s name & ID: Jianyin Xu (13641283)*/
/*Second student’s name & ID: Gongming Shi (13713654)*/
/*Third student’s name & ID: Yuanchen Shi (13809987)*/
/*Script name: PartD.sql*/
/*Purpose: Build PostgreSQL tables for garage shop database*/
/*Date: 22/05/2021*/
/* The URL for the website related to this database is http://www.somewebsite.Com */

--=================================================================================================
-- Drop the tables below
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS APPLICATIVE_PART;
--=================================================================================================
-- Create and insert into the tables below
CREATE TABLE part
(
    partID      numeric(4)      not null,
    partName    varchar(25),
    partPrice   decimal(30, 2),
CONSTRAINT part_pk PRIMARY KEY (partID)
);

INSERT INTO PART 
VALUES (1001, 'Engine', 1000.00);
INSERT INTO PART
VALUES (1002, 'Tire', 250.00);
INSERT INTO PART
VALUES (1003, 'Battery', 500.00);
INSERT INTO PART
VALUES (1004, 'Gear box', 750.00);
INSERT INTO PART
VALUES (1005, 'Head light', 50.00);

CREATE TABLE vehicle
(
    vehicleID       numeric(4)      not null,
    make            varchar(25),
    model           varchar(25),
    year            numeric(4),
    colour          varchar(25),
CONSTRAINT vehicle_pk PRIMARY KEY (vehicleID)
);
INSERT INTO vehicle
VALUES (2001, 'BMW', 'X5', 2019, 'black');
INSERT INTO vehicle
VALUES (2002, 'Ford', 'Sedan', 2018, 'white');
INSERT INTO vehicle
VALUES (2003, 'Audi', 'Q7', 2018, 'silver');
INSERT INTO vehicle
VALUES (2004, 'Benz', 'c300', 2018, 'green');
INSERT INTO vehicle
VALUES (2005, 'Nissan', 'Rogue', 2018, 'pink');

CREATE TABLE applicative_part
(
    partID      numeric(4)      not null,
    vehicleID   numeric(4)      not null,
CONSTRAINT applicative_part_pk PRIMARY KEY (partID, vehicleID),
CONSTRAINT applicative_part_fk1 FOREIGN KEY (partID) REFERENCES  part (partID),
CONSTRAINT applicative_part_fk2 FOREIGN KEY (vehicleID) REFERENCES vehicle (vehicleID)
);

INSERT INTO applicative_part
VALUES (1001, 2001);
INSERT INTO applicative_part
VALUES (1002, 2001);
INSERT INTO applicative_part
VALUES (1002, 2002);
INSERT INTO applicative_part
VALUES (1003, 2003);
INSERT INTO applicative_part
VALUES (1004, 2004);
INSERT INTO applicative_part
VALUES (1005, 2005);


--=================================================================================================
-- Select * from TableName Statements
-- Note: Please write the “select * from TableName” statements in one line.
-- 2.b.1: Question: Get all the information of all parts stored in the database.
-- 2.b.1: SELECT statement: 
SELECT * FROM PART;
-- 2.b.2: Question: Get all the information of all vehicles stored in the database.
-- 2.b.2: SELECT statement:
SELECT * FROM VEHICLE;
-- 2.b.3: Question: Get all the information of all applicative parts stored in the database.
-- 2.b.3: SELECT statement:
SELECT * FROM APPLICATIVE_PART;
--=================================================================================================
-- 3.a: Question: Get the information of the amount of vehicles based on their year. 
-- 3.a: SELECT statement uinsg Group by:
SELECT year, count(*) from vehicle
group by year
order by 1;
-- 3.b: Question: Get the information of partid and partname of all part and their appplicative vehicle's ID
-- 3.b: SELECT statement uisng Inner Join:
select part.partid, partName, vehicleID
from part inner join applicative_part
on part.partid = applicative_part.partid
order by 1;
-- 3.c: Question: Get the make and model of the vehicle(s) which their applicative part has '1002' 
-- 3.c: SELECT statement using Sub Query:
select make, model
from vehicle
where vehicleid in 
    (   
        select vehicleid from applicative_part where partid = 1002
    );


