create database bank;

use bank;

-- branch table
create table branch
(branch_name varchar(50) primary key,
 branch_city varchar(50),
 assets int
 );

-- insert to branch table
insert into branch(branch_name, branch_city, assets)
values('Brighton', 'Brooklyn', 7100000), 
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000);

-- customer table
create table customer
(customer_name varchar(50) primary key,
customer_street varchar(50),
customer_city varchar(50)
);

-- insert into customer table
insert into customer (customer_name, customer_street, customer_city)
values('Adams', 'Spring', 'Pittsfield'),
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sand Hill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassau', 'Princeton');

-- depositor table
create table depositor
(customer_name varchar(50),
account_number varchar(50)
);

-- insert into depositor table
insert into depositor (customer_name, account_number)
values('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Johnson', 'A-201'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305');


-- borrower table
create table borrower
(customer_name varchar(50),
loan_number varchar(50)
);

-- insert into borrower table
insert into borrower (customer_name, loan_number)
values('Adams', 'L-16'),
('Curry', 'L-93'),
('Hayes', 'L-15'),
('Jackson', 'L-14'),
('Jones', 'L-17'),
('Smith', 'L-11'),
('Smith', 'L-23'),
('Williams', 'L-17');


-- account table
create table account
(account_number varchar(50) primary key,
branch_name varchar(50),
balance int
);

-- insert into account table
insert into account (account_number, branch_name, balance)
values('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350);


-- loan table
create table loan
(loan_number varchar(50) primary key,
branch_name varchar(50),
amount int
);

-- insert into loan table
insert into loan (loan_number, branch_name, amount)
values('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500);

