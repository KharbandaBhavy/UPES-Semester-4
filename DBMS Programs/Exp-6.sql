-- Code by Bhavy Kharbanda
-- Objective: To understand the use and implementation of SQL views.

-- 1. Create table of table name: EMPLOYEES and add 6 rows
-- Column Name Data Type Width Attributes
-- Employee_id Character 10 PK
-- First_Name Character 30 NN
-- Last_Name Character 30 NN
-- DOB Date
-- Salary Number 25 NN
-- Department_id Character 10
-- 2. Execute the following view related queries:
--     1.Create View of name emp_view and the column would be Employee_id, Last_Name, salary and department_id only.:
--     12.Insert values into view(remove the NOT NULL constraint and then insert values): 
--     3.Modify, delete and drop operations are performed on view.: 
--     4.Creates a view named salary_view. The view shows the employees in department 20 and their annual salary.


-- 1. For Creating the Tables.
/* Experiment - 6 */
/* Bhavy Kharbanda */
/* 500082531 */
USE AIML_B5;
CREATE TABLE EMPLOYEES
(
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
insert into EMPLOYEES values ('E001','Bhavy','Kharbanda', '2001-10-
16', 50000, 'D7001');
insert into EMPLOYEES values ('E002','Anuj','Singh', '2002-12-20', 
45000, 'D7002');
insert into EMPLOYEES values ('E003','Dhruv','Gupta', '2001-07-22', 
30000, 'D7003');
insert into EMPLOYEES values ('E004','Devashish','Agarwal', '1999-04-
18', 40000, 'D7004');
insert into EMPLOYEES values ('E005','Desh','Iyer', '1995-03-11', 47000, 
'D7005');
insert into EMPLOYEES values ('E006','Bharat','Anand', '1997-05-08', 
35000, 'D7006');

-- 3. SQL Statements
/* 1 */
Create view emp_view as select Employee_id EMPID, Last_Name LN, 
Salary SAL,Department_id DEPID from EMPLOYEES;

/* 2 */
alter table EMPLOYEES modify First_Name varchar(30) null;
alter table EMPLOYEES modify Last_Name varchar(30) null;
alter table EMPLOYEES modify Department_id varchar(10) null;
insert into emp_view values ('E011','Kharbanda', 50000, 'D7001');
insert into emp_view values ('E013','Gupta', 30000, 'D7003');
insert into emp_view values ('E014','Agarwal', 40000, 'D7004');
Select * from emp_view;

/* 3 */
Alter view emp_view as select Employee_id EMPID, Salary SAL,Department_id DEPID from EMPLOYEES;
Drop view emp_view;

/* 4 */
Create view salary_view as select First_name FN, Department_id DPTID, Salary SAL from EMPLOYEES where Department_id='D7004';
Select * from salary_view;
