-- Code by Bhavy Kharbanda
-- Objective: To understand the use of group by and having clause and execute the SQL commands using JOIN.

-- 1. Create the following two tables (EMP and DEPT)
-- EMP TABLE
--  EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO
--  ---------- ---------- --------- ---------- --------- ---------- ---------- ----------
--  7369 SMITH CLERK 7902 17-DEC-80 500 800 20
--  7499 ALLEN SALESMAN 7698 20-FEB-81 1600 300 30
--  7521 WARD SALESMAN 7698 22-FEB-81 1250 500 30
--  7566 JONES MANAGER 7839 02-APR-81 2975 20
--  7654 MARTIN SALESMAN 7698 28-SEP-81 1250 1400 30
--  7698 BLAKE MANAGER 7839 01-MAY-81 2850 30
--  7782 CLARK MANAGER 7839 09-JUN-81 2450 10
--  7788 SCOTT ANALYST 7566 09-DEC-82 3000 20
--  7839 KING PRESIDENT 17-NOV-81 5000 10
--  7844 TURNER SALESMAN 7698 08-SEP-81 1500 0 30
--  7876 ADAMS CLERK 7788 12-JAN-83 1100 20
--  7900 JAMES CLERK 7698 03-DEC-81 950 30
--  7902 FORD ANALYST 7566 03-DEC-81 3000 20
--  7934 MILLER CLERK 7782 23-JAN-82 1300 10

-- DEPT TABLE
--  DEPTNO DNAME LOC
--  ---------- -------------- -------------
--  10 ACCOUNTING NEW YORK
--  20 RESEARCH DALLAS
--  30 SALES CHICAGO
--  40 OPERATIONS BOSTON

-- 2. Write the SQL Queries for the following queries (use emp_table and dept_table of Experiment 4).
--     1.List the Deptno where there are no emps. 
--     2.List the No.of emp’s and Avg salary within each department for each job. 
--     3. Find the maximum average salary drawn for each job except for ‘President’. 
--     4.List the department details where at least two emps are working. 
--     5.List the no. of emps in each department where the no. is more than 3. 
--     6.List the names of the emps who are getting the highest sal dept wise. 
--     7.List the Deptno and their average salaries for dept with the average salary less than the averages for all departments. 

-- 3. Execute the experiment 4 using sql join.


--1. For Creating the Tables.
/* Experiment - 5 */
/* Bhavy Kharbanda */
/* 500082531 */
USE AIML_B5;
CREATE TABLE DEPT
(
Deptno int,
Dname varchar(20),
Loc varchar(20),
primary key (Deptno) 
);

CREATE TABLE EMP
(
Empno varchar(5),
ename varchar(20),
Job varchar(20),
Mgr int,
Hiredate date,
Sal int,
Comm int,
Deptno int,
primary key(Empno),
foreign key(Deptno) references DEPT(Deptno)
);


-- 2. Inserting the data in the Table.
/* 2 */
insert into DEPT values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT values (20, 'RESEARCH', 'DALLAS');
insert into DEPT values (30, 'SALES', 'CHICAGO');
insert into DEPT values (40, 'OPERATIONS', 'BOSTON');
insert into EMP values ('7369','SMITH','CLERK',7902, '1980-12-17', 500, 
800, 20);
insert into EMP values ('7499','ALLEN','SALESMAN',7698, '1981-02-20',
1600, 300, 30);
insert into EMP values ('7521','WARD','SALESMAN',7698, '1981-02-22', 
1250, 500, 30);
insert into EMP values ('7566','JONES','MANAGER',7839, '1981-04-02', 
2975, null, 20);
insert into EMP values ('7654','MARTIN','SALESMAN',7698, '1981-09-
28', 1250, 1400, 30);
insert into EMP values ('7698','BLAKE','MANAGER',7839, '1981-05-01', 
2850, null, 30);
insert into EMP values ('7782','CLARK','MANAGER',7839, '1981-06-09', 
2450, null, 10);
insert into EMP values ('7788','SCOTT','ANALYST',7566, '1982-12-09', 
3000, null, 20);
insert into EMP values ('7839','KING','PRESIDENT',null, '1981-11-17', 
5000, null, 10);
insert into EMP values ('7844','TURNER','SALESMAN',7698, '1981-09-
08', 1500, 0, 30);
insert into EMP values ('7876','ADAMS','CLERK',7788, '1983-01-12', 
1100, null, 20);
insert into EMP values ('7900','JAMES','CLERK',7698, '1981-12-03', 950, 
null, 30);
insert into EMP values ('7902','FORD','ANALYST',7566, '1981-12-03', 
3000, null, 20);
insert into EMP values ('7934','MILLER','CLERK',7782, '1982-01-23', 
1300, null, 10);

-- 3. SQL Statements
/* 1: SQL Clauses */
/* 1 */
Select * from DEPT where Deptno not in (select DEPTNO from EMP);
/* 2 */
Select count(ename), avg(SAL), Deptno, Job from EMP group by Deptno, Job;
/* 3 */
Select MAX(AvgSal) from ( Select avg(Sal) AvgSal from EMP where Job != 
'PRESIDENT' group by Job) EMP;
/* 4 */
Select Deptno, count(*) from EMP group by Deptno having count(*) >= 2;
/* 5 */
Select Deptno, count(*) from EMP group by Deptno having count(*) > 3;
/* 6 */
Select ename, Deptno, Sal from EMP where Sal in (Select Max(Sal) from EMP group by 
Deptno) order by Deptno;
/* 7 */
Select Deptno, avg(Sal) from EMP group by Deptno having avg(Sal) < (Select avg(Sal) 
from EMP);

/* 2: SQL Joins */
Select EMP.Sal from (DEPT inner join EMP on DEPT.Deptno = EMP.Deptno) where 
Sal in( Select Max(Sal) where DEPT.Dname = 'SALES');
