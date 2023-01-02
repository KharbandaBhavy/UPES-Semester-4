-- Code By Bhavy kharbanda
-- Objective: To understand the concept of SQL Sub-Query in the Database management system. 

-- 1. Create the following table.
-- Supplier-(scode,sname,scity,turnover)
-- Part-(pcode,weigh,color,cost,sellingprice)
-- Supplier_Part-(scode,pcode,qty)
-- Name – Bhavy Kharbanda
-- SAP ID – 500082531
-- Roll Number – R214220342
-- Batch-B5

-- 2. Populate the table

-- 3. Write appropriate SQL Statement for the following:

-- A. Get the supplier number and part number in ascending order of 
-- supplier number.
-- B. Get the details of supplier who operate from Bombay with turnover 
-- 50.
-- C. Get the total number of supplier.
-- D. Get the part numbers weighing between 25 and 35.
-- E. Get the supplier number whose turnover is null.
-- F. Get the part number that cost 20, 30 or 40 rupees.
-- G. Get the total quantity of part 2 that is supplied.
-- H. Get the name of supplier who supply part 2.
-- I. Get the part number whose cost is greater than the average cost.
-- J. Get the supplier number and turnover in descending order of 
-- turnover.

--1. For Creating the Tables.

USE AIML_B5;
/* 1 */
CREATE TABLE Suppliers
(
scode varchar(5),
sname varchar(10),
scity varchar(10),
turnover int,
primary key (scode) 
);

CREATE TABLE Part
(
Pcode varchar(5),
weight int,
colour varchar(10),
cost int,
sellingPrice int,
primary key (pcode)
);

CREATE TABLE Supplier_Part
(
scode varchar(5),
pcode varchar(5),
qty int,
primary key(scode, pcode),
foreign key(scode) references Suppliers(scode),
foreign key(pcode) references Part(pcode) 
);

-- 2. Inserting the data in the Table.
/* 2 */
insert into Suppliers values ('S0001','Bhavy','Gurgaon',50000);
insert into Suppliers values ('S0002','Desh','Bangalore',40000);
insert into Suppliers values ('S0003','Divyam','Dehradun',30000);
insert into Suppliers values ('S0004','Divy','Manipur',35000);
insert into Suppliers values ('S0005','Bharat','Delhi',33000);
insert into Suppliers values ('S0006','Divjot','Meerut',45000);
insert into Suppliers values ('S0007','Rishika','Rajasthan',55000);
insert into Suppliers values ('S0008','Devashish','Muradnagar',43000);
insert into Suppliers values ('S0009','Dhruv','Rishikesh',29000);
insert into Suppliers values ('S0010','Ramesh','Noida',20000);
insert into Part values ('P0001',50,'red',1500,2000);
insert into Part values ('P0002',70,'blue',2000,3000);
insert into Part values ('P0003',30,'black',450,700);
insert into Part values ('P0004',20,'green',900,1200);
insert into Part values ('P0005',25,'white',4500,6000); 
insert into Part values ('P0006',38,'orange',8500,9000); 
insert into Part values ('P0007',40,'purple',7500,8000); 
insert into Part values ('P0008',70,'silver',2200,3000); 
insert into Part values ('P0009',45,'yellow',3700,4000); 
insert into Part values ('P0010',75,'indigo',2900,3500); 
insert into Supplier_Part values ('S0001','P0001',5);
insert into Supplier_Part values ('S0002','P0002',10);
insert into Supplier_Part values ('S0003','P0003',15);
insert into Supplier_Part values ('S0004','P0004',20);
insert into Supplier_Part values ('S0005','P0005',35);
insert into Supplier_Part values ('S0006','P0006',25);
insert into Supplier_Part values ('S0007','P0007',12);
insert into Supplier_Part values ('S0008','P0008',17);
insert into Supplier_Part values ('S0009','P0009',50);
insert into Supplier_Part values ('S0010','P0010',47);

-- 3. SQL Statements
select scode, pcode from Supplier_Part order by scode asc; /* 1 */
select * from Suppliers where scity = 'Bombay' and turnover = 50; /* 2 */
select count(scode) from Suppliers; /* 3 */
select pcode from Part where weight between 25 and 35; /* 4 */
select scode from Suppliers where turnover is null; /* 5 */
select pcode from Part where cost = 20 or cost = 30 or cost = 40; /* 6 */
select qty from Supplier_Part where pcode = 'P0002'; /* 7 */
select sname from Suppliers, Supplier_Part where Suppliers.scode = 
Supplier_Part.scode and Supplier_Part.pcode = 'P0002'; /* 8 */
select pcode from Part where cost>(select avg(Cost) from Part); /* 9 */
select scode, turnover from Suppliers order by turnover desc; /* 10 */

