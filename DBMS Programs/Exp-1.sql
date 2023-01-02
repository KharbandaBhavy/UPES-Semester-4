-- Code by Bhavy Kharbanda
-- Problem Statements
-- 1. Create the tables described below:
-- Table name: CLIENT_MASTER 
-- 2. Insert the following data into their respective tables:
-- 3. Exercise on retrieving records from a table.
-- a. Find out the names of all the clients.
-- b. Retrieve the entire contents of the Client_Master table.
-- c. Retrieve the list of names, city and the state of all the clients.
-- d. List the various products available from the Product_Master table.
-- e. List all the clients who are located in Mumbai.
-- f. Find the names of salesman who have a salary equal to Rs.3000.
-- 4. Exercise on updating records in a table
-- a. Change the city of ClientNo ‘C00005’ to ‘Bangalore’.
-- b. Change the BalDue of ClientNo ‘C00001’ to Rs.1000.
-- c. Change the cost price of ‘Trousers’ to rs.950.00.
-- d. Change the city of the salesman to Pune.
-- 5. Exercise on deleting records in a table
-- a. Delete all salesman from the Salesman_Master whose salaries are equal to 
-- Rs.3500. 
-- b. Delete all products from Product_Master where the quantity on hand is equal to 
-- 100.
-- c. Delete from Client_Master where the column state holds the value ‘Tamil Nadu’.
-- 6. Exercise on altering the table structure
-- a. Add a column called ‘Telephone’ of data type integer to the Client_Master table.
-- b. Change the size off SellPrice column in Product _Master to 10, 2.
-- 7. Exercise on deleting the table structure along with the data
-- a. Destroy the table Client_Master along with its data.
-- 8. Exercise on renaming the table
-- a. Change the name of the Salesman_Master to sman_mast.

-- 1. For Creating the Tables.
CREATE TABLE CLIENT_MASTER (
    CLIENTNO varchar(6),
    NAME varchar(20),
    ADDRESS1 varchar(30),
    ADDRESS2 varchar(30),
    CITY varchar(15),
    PINCODE integer,
    STATE varchar(15),
    BALDUE numeric(10, 2)
);
CREATE TABLE PRODUCT_MASTER (
    PRODUCT_NO varchar(6),
    DESCRIPTION varchar(15),
    PROFIT_PERCENT numeric(4, 2),
    UNIT_MEASURE varchar(10),
    QTY_ON_HAND integer,
    REORDER_LEVEL integer,
    SELL_PRICE numeric(8, 2),
    COST_PRICE numeric(8, 2)
);
CREATE TABLE SALESMAN_MASTER (
    SALESMAN_NO VARCHAR(6),
    SALESMAN_NAME VARCHAR(20),
    ADDRESS1 VARCHAR(30),
    ADDRESS2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE INTEGER,
    STATE VARCHAR(20),
    SALAMT REAL(10, 2),
    TGTTOGET NUMERIC(10, 2),
    YTDSALES DOUBLE(6, 2),
    REMARKS VARCHAR(60)
);
-- 2. For Inserting the Values and Displaying the Tables.
Insert into CLIENT_MASTER
values (
        'C00001',
        'Ivan Bayross',
        null,
        null,
        'Mumbai',
        400054,
        'Maharashtra',
        15000
    );
Insert into CLIENT_MASTER
values (
        'C00002',
        'Mamtamuzumdar',
        null,
        null,
        'Madras',
        780001,
        'Tamil Nadu',
        0
    );
Insert into CLIENT_MASTER
values (
        'C00003',
        'Chhayabankar',
        null,
        null,
        'Mumbai',
        400057,
        'Maharashtra',
        5000
    );
Insert into CLIENT_MASTER
values (
        'C00004',
        'Ashwini joshi',
        null,
        null,
        'Bangalore',
        560001,
        'Karnataka',
        0
    );
Insert into CLIENT_MASTER
values (
        'C00005',
        'Hansel colaco',
        null,
        null,
        'Mumbai',
        400060,
        'Maharashtra',
        2000
    );
Insert into CLIENT_MASTER
values (
        'C00006',
        'Deepak sharma',
        null,
        null,
        'Mangalore',
        560050,
        'Karnataka',
        0
    );
Insert into PRODUCT_MASTER
values (
        'P00001',
        'T-Shirt',
        5,
        'Piece',
        200,
        50,
        350,
        250
    );
Insert into PRODUCT_MASTER
values ('P0345', 'Shirts', 6, 'Piece', 150, 50, 500, 350);
Insert into PRODUCT_MASTER
values (
        'P06734',
        'Cotton jeans',
        5,
        'Piece',
        100,
        20,
        600,
        450
    );
Insert into PRODUCT_MASTER
values ('P07865', 'Jeans', 5, 'Piece', 100, 20, 750, 500);
Page 9 of 92
Insert into PRODUCT_MASTER
values (
        'P07868',
        'Trousers',
        2,
        'Piece',
        150,
        50,
        850,
        550
    );
Insert into PRODUCT_MASTER
values (
        'P07885',
        'Trousers',
        2.5,
        'Piece',
        80,
        30,
        700,
        450
    );
Insert into PRODUCT_MASTER
values (
        'P07965',
        'Denim jeans',
        4,
        'Piece',
        100,
        40,
        350,
        250
    );
Insert into PRODUCT_MASTER
values (
        'P07975',
        'Lycra tops',
        5,
        'Piece',
        70,
        30,
        300,
        175
    );
Insert into PRODUCT_MASTER
values ('P08865', 'Skirts', 5, 'Piece', 75, 30, 450, 300);
Insert into SALESMAN_MASTER
values (
        'S00001',
        'Aman',
        'A/14',
        'Worli',
        'Mumbai',
        400002,
        'Maharashtra',
        5000,
        null,
        null,
        null
    );
Insert into SALESMAN_MASTER
values (
        'S00002',
        'Omkar',
        '65',
        'Nariman',
        'Mumbai',
        400001,
        'Maharashtra',
        3000,
        null,
        null,
        null
    );
Insert into SALESMAN_MASTER
values (
        'S00003',
        'Raj',
        'P-7',
        'Bandra',
        'Mumbai',
        400032,
        'Maharashtra',
        6000,
        null,
        null,
        null
    );
Insert into SALESMAN_MASTER
values (
        'S00004',
        'Ashish',
        'A/5',
        'Juhu',
        'Mumbai',
        400044,
        'Maharashtra',
        4500,
        null,
        null,
        null
    );
SELECT *
FROM CLIENT_MASTER;
SELECT *
FROM PRODUCT_MASTER;
SELECT *
FROM SALESMAN_MASTER;
-- 3. Exercise on retrieving records from a table.
SELECT NAME
FROM CLIENT_MASTER;
/* 3 (a) */
SELECT *
FROM CLIENT_MASTER;
/* 3 (b) */
SELECT NAME,
    CITY,
    STATE
FROM CLIENT_MASTER;
/* 3 (c) */
SELECT DESCRIPTION
FROM PRODUCT_MASTER;
/* 3 (d) */
SELECT NAME
FROM CLIENT_MASTER
where CITY = 'Mumbai';
/* 3 (e) */
SELECT SALESMAN_NAME
FROM SALESMAN_MASTER
where SALAMT = 3000;
/* 3 (f) */
-- 4. Exercise on updating records in a table.
UPDATE CLIENT_MASTER
SET City = 'Bangalore'
WHERE Client_No = 'C00005' ;
    /* 4 (a) */
UPDATE CLIENT_MASTER
SET BALDUE = 1000
WHERE Client_No = 'C00001' ;
    /* 4 (b) */
UPDATE PRODUCT_MASTER
SET COST_PRICE = 950.00
WHERE Description = 'Trousers' ;
    /* 4 (c) */
UPDATE CLIENT_MASTER
SET City = 'Pune' ;
    /* 4 (d) */
    -- 5. Exercise on deleting records in a table.
delete from SALESMAN_MASTER
where SALAMT = 3500;
/* 5 (a) */
delete from PRODUCT_MASTER
where QTY_ON_HAND = 100;
/* 5 (a) */
delete from CLIENT_MASTER
where State = 'Tamil Nadu';
/* 5 (a) */
-- 6. Exercise on altering the table structure.
alter table CLIENT_MASTER
add Telephone int;
/* 6 (a) */
alter table PRODUCT_MASTER
modify SELL_PRICE float(10, 2);
/* 6 (a) */
-- 7. Exercise on deleting the table structure along with the data.
DROP Table CLIENT_MASTER;
/* 7 (a) */
-- 8. Exercise on renaming the table.
alter table SALESMAN_MASTER
    rename to SMAN_MAST;
/* 8 (a) */