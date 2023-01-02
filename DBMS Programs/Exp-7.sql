-- Code by Bhavy Kharbanda
-- Objective: To understand the use and implementation of SQL indexes.

-- 1. Create table of table name: EMPLOYEES and add 6 rows
-- Column Name Data Type Width Attributes
-- Employee_id Character 10 PK
-- First_Name Character 30 NN
-- Last_Name Character 30 NN
-- DOB Date
-- Salary Number 25 NN
-- Department_id Character 10
-- 2. Execute the following index related queries:
--     1.Create an index of name employee_idx on EMPLOYEES with column Last_Name, Department_id
--     2. Find the ROWID for the above table and create a unique index on employee_id column of the EMPLOYEES.
--     3.Create a reverse index on employee_id column of the EMPLOYEES.
--     4.Create a unique and composite index on employee_id and check whether there is duplicity of tuples or not.
--     5.Create Function-based indexes defined on the SQL functions UPPER(column_name) or LOWER(column_name) to facilitate case-insensitive searches(on column Last_Name).
--     6.Drop the function based index on column Last_Name.

-- 1. For Creating the Tables.
/* Experiment - 7 */
/* Bhavy Kharbanda */
/* 500082531 */
USE AIML_B5;
CREATE TABLE EMPLOYEES (
    Employee_id varchar(10),
    First_name varchar(30) not null,
    Last_name varchar(30) not null,
    DOB date,
    Salary int,
    Department_id varchar(10) not null,
    primary key (Employee_id)
);

-- 2. Inserting the data in the Table.
/* 2 */
insert into EMPLOYEES
values (
        'E001',
        'Bhavy',
        'Kharbanda',
        '16-OCT-2001',
        50000,
        'D7001'
    );
insert into EMPLOYEES
values (
        'E002',
        'Anuj',
        'Singh',
        '20-DEC-2002',
        45000,
        'D7002'
    );
insert into EMPLOYEES
values (
        'E003',
        'Dhruv',
        'Gupta',
        '22-JUL-2001',
        30000,
        'D7003'
    );
insert into EMPLOYEES
values (
        'E004',
        'Devashish',
        'Agarwal',
        '18-APR-1994',
        40000,
        'D7004'
    );
insert into EMPLOYEES
values (
        'E005',
        'Desh',
        'Iyer',
        '11-MAR-1995',
        47000,
        'D7005'
    );
insert into EMPLOYEES
values (
        'E006',
        'Bharat',
        'Anand',
        '08-MAY-1997',
        35000,
        'D7006'
    );

-- 3. SQL Statements
/* 1 */
CREATE INDEX EMPLOYEE_IDX ON EMPLOYEES (LAST_NAME, DEPARTMENT_ID);
/* 2 */
SELECT ROW_NUMBER() OVER(
        ORDER BY DEPARTMENT_ID
    ) AS ID,
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    DEPARTMENT_ID
FROM EMPLOYEES;
CREATE UNIQUE INDEX EMPLOYEE_UNI_IDX ON EMPLOYEES (EMPLOYEE_ID);

/* 3 */
CREATE INDEX EMP_REVERSE ON EMPLOYEES (EMPLOYEE_ID) REVERSE;

/* 4 */
CREATE UNIQUE INDEX EMPLOYEE_UNI_COMP ON EMPLOYEES (EMPLOYEE_ID, DEPARTMENT_ID);
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 'E001'
    AND DEPARTMENT_ID = 'D7001';

/* 5 */
CREATE INDEX LAST_NAME_IDX ON EMPLOYEES (UPPER(LAST_NAME));
CREATE INDEX LAST_NAME_IDX2 ON EMPLOYEES (lower(LAST_NAME));

/* 6 */
DROP INDEX LAST_NAME_IDX;
DROP INDEX LAST_NAME_IDX2;