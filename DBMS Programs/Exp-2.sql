-- Code by Bhavy Kharbanda
-- Objective: To understand the concept of data constraints that is enforced on data being stored in the table. Focus on Primary Key and the Foreign Key.

-- 1. Create the tables described below:
-- Table name: CLIENT_MASTER_1
-- 2. Reinsert the data in these two tables based upon Lab 1.
-- 3. Display the contents of each table.
-- 4. Create table AUTHOR = {Author_ID ,Lastname, Firstname, Email, City, 
-- Country}
-- Where:
-- Author_ID – text data type, 5 characters, primary key
-- Lastname – text data type, 15 characters, not null
-- Firstname – text data type, 15 characters, not null
-- Email – text data type, 40 characters,
-- City – text data type, 15 characters,
-- Country – text data type, 15 characters,
-- 5. Create Table BOOK={ Book_ID, Book_Title, Copies)
-- Where :
-- Book_ID – text data type, 5 characters Primary Key Start With Character B
-- Book_Title - Text data Type Not Null
-- Copies- No.of copies Data Type int always greater the 2 
-- 6. Create table AUTHOR_LIST = {Author_ID ,Book_ID , Role}
-- Where:
-- Author_ID – text data type, 5 characters, referenced by Author_ID from 
-- AUTHOR
-- table
-- Book_ID – text data type, 5 characters, referenced by Book_ID from Book 
-- Table.
-- Role – text data type, 15 characters
-- and primary key is: Author_ID, Book_ID
-- 7. Add four records in each tables AUTHOR, BOOK, BOOK_LIST.
-- 8. Alter structure of table AUTHOR_LIST add the field Publisher data type of 30 
-- Character.

--1. For Creating the Tables.
CREATE TABLE CLIENT_MASTER1 (
    CLIENTNO varchar(6) NOT NULL PRIMARY KEY,
    CHECK(CLIENTNO LIKE 'C%'),
    NAME varchar(20) NOT NULL,
    ADDRESS1 varchar(30),
    ADDRESS2 varchar(30),
    CITY varchar(15),
    PINCODE integer,
    STATE varchar(15),
    BALDUE numeric(10, 2)
);
CREATE TABLE PRODUCT_MASTER1 (
    PRODUCT_NO varchar(6) NOT NULL PRIMARY KEY,
    CHECK(PRODUCT_NO LIKE 'P%'),
    DESCRIPTION varchar(15) NOT NULL,
    PROFIT_PERCENT numeric(4, 2) NOT NULL,
    UNIT_MEASURE varchar(10) NOT NULL,
    QTY_ON_HAND integer NOT NULL,
    REORDER_LEVEL integer NOT NULL,
    SELL_PRICE numeric(8, 2) NOT NULL,
    COST_PRICE numeric(8, 2) NOT NULL
);
CREATE TABLE SALESMAN_MASTER1 (
    SALESMAN_NO VARCHAR(6) NOT NULL PRIMARY KEY,
    CHECK(SALESMAN_NO LIKE 'S%'),
    SALESMAN_NAME VARCHAR(20) NOT NULL,
    ADDRESS1 VARCHAR(30) NOT NULL,
    ADDRESS2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE INTEGER,
    STATE VARCHAR(20),
    SALAMT REAL(10, 2) NOT NULL,
    CHECK(SALAMT > 0),
    TGTTOGET NUMERIC(10, 2) NOT NULL,
    CHECK(TGTTOGET > 0),
    YTDSALES DOUBLE(6, 2) NOT NULL,
    REMARKS VARCHAR(60)
);
--2. Re-inserting the data in the Tables.
Insert into CLIENT_MASTER1
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
Insert into CLIENT_MASTER1
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
Insert into CLIENT_MASTER1
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
Insert into CLIENT_MASTER1
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
Insert into CLIENT_MASTER1
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
Insert into CLIENT_MASTER1
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
Insert into PRODUCT_MASTER1
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
Insert into PRODUCT_MASTER1
values (
        'P0345',
        'Shirts',
        6,
        'Piece',
        150,
        50,
        500,
        350
    );
Insert into PRODUCT_MASTER1
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
Insert into PRODUCT_MASTER1
values (
        'P07865',
        'Jeans',
        5,
        'Piece',
        100,
        20,
        750,
        500
    );
Insert into PRODUCT_MASTER1
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
Insert into PRODUCT_MASTER1
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
Insert into PRODUCT_MASTER1
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
Insert into PRODUCT_MASTER1
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
Insert into PRODUCT_MASTER1
values (
        'P08865',
        'Skirts',
        5,
        'Piece',
        75,
        30,
        450,
        300
    );
Insert into SALESMAN_MASTER1
values (
        'S00001',
        'Aman',
        'A/14',
        'Worli',
        'Mumbai',
        400002,
        'Maharashtra',
        5000,
        6000,
        50,
        null
    );
Insert into SALESMAN_MASTER1
values (
        'S00002',
        'Omkar',
        '65',
        'Nariman',
        'Mumbai',
        400001,
        'Maharashtra',
        3000,
        4000,
        60,
        null
    );
Insert into SALESMAN_MASTER1
values (
        'S00003',
        'Raj',
        'P-7',
        'Bandra',
        'Mumbai',
        400032,
        'Maharashtra',
        6000,
        7000,
        30,
        null
    );
Insert into SALESMAN_MASTER1
values (
        'S00004',
        'Ashish',
        'A/5',
        'Juhu',
        'Mumbai',
        400044,
        'Maharashtra',
        4500,
        5500,
        40,
        null
    );
--3. Display the contents of each table.
SELECT *
FROM CLIENT_MASTER1;
SELECT *
FROM PRODUCT_MASTER1;
SELECT *
FROM SALESMAN_MASTER1;
-- 4. Creating the Table Author.
CREATE TABLE AUTHOR (
    AUTHOR_ID VARCHAR(5) NOT NULL PRIMARY KEY,
    LASTNAME VARCHAR(15),
    FIRSTNAME VARCHAR(15),
    EMAIL VARCHAR(40),
    CITY VARCHAR(15),
    COUNTRY VARCHAR(15)
);
-- 5. Creating the Table Book.
CREATE TABLE BOOK (
    BOOK_ID VARCHAR(5) NOT NULL PRIMARY KEY,
    CHECK(BOOK_ID LIKE 'B%'),
    BOOK_TITLE VARCHAR(40) NOT NULL,
    COPIES INTEGER NOT NULL,
    CHECK(COPIES > 2)
);

-- 6. Creating the Table Author_list.
CREATE TABLE AUTHOR_LIST (
    AUTHOR_ID varchar(5) references AUTHOR,
    BOOK_ID varchar(5) references BOOK,
    role varchar(10),
    Primary Key (Author_id, Book_id)
);

-- 7. Add four records in each tables Author, Book.
Insert into AUTHOR
values (
        'A0001',
        'Rowling',
        'J.K.',
        'rowling@gmail.com',
        'Yate',
        'England'
    );
Insert into AUTHOR
values (
        'A0002',
        'Shakespeare',
        'William',
        'williams@gmail.com',
        'Warwickshire',
        'England'
    );
Insert into AUTHOR
values (
        'A0003',
        'Steel',
        'Daniele',
        'Dsteel@gmail.com',
        'New 
York',
        'United States'
    );
Insert into AUTHOR
values (
        'A0004',
        'King',
        'Stephen',
        'Sking@gmail.com',
        'Portland',
        'Oregon'
    );
Insert into BOOK
values ('B0001', 'Harry Potter', 5000);
Insert into BOOK
values ('B0002', 'Hamlet', 2300);
Insert into BOOK
values ('B0003', 'The Affair', 2000);
Insert into BOOK
values ('B0004', 'The Stand', 800);

-- 8. Alter structure of table Author_list add the field Publisher 
data type of 30 Character.
alter table AUTHOR_LIST
add PUBLISHER varchar(30);