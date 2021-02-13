create database chicago_crime;

use  chicago_crime;

create table tb_user(
  username VARCHAR(50) primary key,
  `password` VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL
);

-- deletes table crimes
DROP TABLE crimes;

-- create table for crimes
create table crimes(
crimeID int primary key,
crimeType varchar(50),
crimeLocation varchar(50),
policeID int,
criminalID int
);

-- create table for crimes AUOTINCREMENT 
create table crimes(
crimeID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
crimeType varchar(50),
crimeLocation varchar(50),
policeID int,
criminalID int
);
-- populate 3 rows in crimes table AUTOINCREMENT
insert into crimes(crimeType, crimeLocation, policeID, criminalID)
values
('theft', 'West Loop', 1414, 9999), 
('murder', 'Michigan Avenue', 1313, 9989),
('public intoxication', 'Linkin Park', 1212, 9949);

-- populate 3 rows in crimes table
insert into crimes(crimeID, crimeType, crimeLocation, policeID, criminalID)
values
-- (1010, 'murder', 'West Chicago', 1414, 7878);
(1111, 'theft', 'West Loop', 1414, 9999), 
(2222, 'murder', 'Michigan Avenue', 1313, 9989),
(3333, 'public intoxication', 'Linkin Park', 1212, 9949);

-- create table for policeRegister
create table policeRegister(
policeID int primary key,
age int,
gender varchar(10),
policeRank varchar(50)
);

-- populate 3 rows in policeRefister
insert into policeRegister(policeID,age,gender,policeRank)
values
(1414, 30, 'male', 'officer'),
(1313, 39, 'male', 'chief'),
(1212, 26, 'female', 'officer');

-- create table for criminal
create table  criminal(
criminalID int primary key,
criminalName varchar(50),
age int,
gender varchar(10),
arrested varchar(10)
);

-- populate criminal table
insert into criminal(criminalID, criminalName, age, gender, arrested)
values
-- (7878, 'Hash Slinger', 19, 'male', 'yes');
(9999, 'John Dillinger', 30, 'male', 'yes'),
(9989, 'Jack Ripper', 20, 'male', 'yes'),
(9949, 'Mary Jane', 25, 'female', 'no');

-- create table for peopleReports
create table peopleReports(
reportID int primary key,
reporterName varchar(50),
reportDate  datetime not null default now(),
gender varchar(10)
);

-- populate peopleReoprts table
insert into peopleReports(reportID, reporterName, gender)
values
(1111, 'Bruce Wayne','male'),
(2222, 'Sherlock Homes','male'),
(3333, 'Karen Smith','female');


-- EXTRA QUERY

-- select number of cops who stopped someone who is male
select count(p.gender)
from policeRegister p
join crimes c
on p.policeID = c.policeID
join criminal cr
on c.criminalID = cr.criminalID
where cr.gender = 'male';

-- select number of cops who stopped someone who is female
select count(p.gender)
from policeRegister p
join crimes c
on p.policeID = c.policeID
join criminal cr
on c.criminalID = cr.criminalID
where cr.gender = 'female';

select * from criminal;

-- select criminalName and criminalID who is less than 20years old in West Chicago
select cr.criminalName, cr.criminalID
from criminal cr 
join crimes c
on cr.criminalID = c.criminalID
where cr.age < '20' and c.crimeLocation = 'West Chicago';

-- select crime location with the number arrest
select c.crimeLocation, count(cr.arrested) as totalArrests
from crimes c
join criminal cr
on c.criminalID = cr.criminalID
where cr.arrested = 'yes'
group by crimeLocation;

-- select avg(age) of criminal who been arrested in west chiago
select avg(cr.age) as averageAge
from criminal cr
join crimes c
on cr.criminalID = c.criminalID
where c.crimeLocation = 'West Chicago';

SELECT AVG(age) as AveragePoliceAge from policeRegister;

SELECT MAX(age) as OldestCriminalAge from criminal;

-- count the number total of crimeTypes
SELECT distinct crimeType, count(distinct crimeType) as Total
from crimes 
group by crimeType;