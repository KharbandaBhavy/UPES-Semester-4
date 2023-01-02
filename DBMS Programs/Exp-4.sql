-- Code By Bhavy Kharbanda
-- Objective: To understand the use of inbuilt function and relational algebra with sql query.

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


-- 2. Write the Nested Queries for the following queries.

--     1. List the details of the emps whose Salaries more than the employee BLAKE. 
--     2. List the emps whose Jobs are same as ALLEN. 
--     3. List the Emps whose Sal is same as FORD or SMITH in desc order of Names. 
--     4. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN. 
--     5. Find the highest paid employee of sales department. 
--     6. List the employees who are senior to most recently hired employee working 
--     under king. 
--     7. List the names of the emps who are getting the highest sal dept wise. 
--     8. List the emps whose sal is equal to the average of max and minimum 
--     9. List the emps who joined in the company on the same date.
--     10. Find out the emps who joined in the company before their Managers.



--1. For Creating the Tables.
/* Experiment - 4 */
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
Hiredate varchar(20),
Sal int,
Comm int,
Deptno int,
primary key(Empno),
foreign key(Deptno) references DEPT(Deptno)
);

--2. Inserting the data in the Table.
/* 2 */
insert into DEPT values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT values (20, 'RESEARCH', 'DALLAS');
insert into DEPT values (30, 'SALES', 'CHICAGO');
insert into DEPT values (40, 'OPERATIONS', 'BOSTON');
insert into EMP values ('7369','SMITH','CLERK',7902, '17-DEC-80', 500, 
800, 20);
insert into EMP values ('7499','ALLEN','SALESMAN',7698, '20-FEB-81', 
1600, 300, 30);
insert into EMP values ('7521','WARD','SALESMAN',7698, '22-FEB-81', 
1250, 500, 30);
insert into EMP values ('7566','JONES','MANAGER',7839, '02-APR-81', 
2975, null, 20);
insert into EMP values ('7654','MARTIN','SALESMAN',7698, '28-SEP81', 1250, 1400, 30);
insert into EMP values ('7698','BLAKE','MANAGER',7839, '01-MAY-81', 
2850, null, 30);
insert into EMP values ('7782','CLARK','MANAGER',7839, '09-JUN-81', 
2450, null, 10);
insert into EMP values ('7788','SCOTT','ANALYST',7566, '09-DEC-82', 
3000, null, 20);
insert into EMP values ('7839','KING','PRESIDENT',null, '17-NOV-81', 
5000, null, 10);
insert into EMP values ('7844','TURNER','SALESMAN',7698, '08-SEP81', 1500, 0, 30);
insert into EMP values ('7876','ADAMS','CLERK',7788, '12-JAN-83', 
1100, null, 20);
insert into EMP values ('7900','JAMES','CLERK',7698, '03-DEC-81', 950, 
null, 30);
insert into EMP values ('7902','FORD','ANALYST',7566, '03-DEC-81', 
3000, null, 20);
insert into EMP values ('7934','MILLER','CLERK',7782, '23-JAN-82', 
1300, null, 10);

-- 3. SQL Statements
/* 1 */
Select ename from EMP where Sal > (Select Sal from EMP where ename = 'BLAKE');
/* 2 */
Select ename from EMP where Job = (Select Job from EMP where ename = 'ALLEN');
/* 3 */
Select ename from EMP where sal in (Select sal from EMP where ename = 'FORD' or 
ename = 'SMITH') order by ename desc;
/* 4 */
Select ename from EMP where Job = (Select Job from EMP where ename = 'MILLER') 
or Sal >(Select Sal where ename = 'ALLEN');
/* 5 */
Select ename from EMP where sal in (select max(sal) from EMP); 
/* 6 */
Select ename from EMP where Hiredate < (select max(Hiredate) from EMP where Mgr 
in (select Empno from EMP where ename = 'KING')) ;
/* 7 */
Select ename,Deptno from EMP where sal in (select max(sal) from EMP group by 
Deptno) ; 
/* 8 */
Select ename from EMP where sal > (select (max(sal)+min(sal))/2 from EMP); 
/* 9 */
Select ename from EMP e where Hiredate in (select Hiredate from EMP where e.empno 
<> empno); 
/* 10 */
Select ename from EMP e where hiredate < (select hiredate from emp where empno = 
e.mgr);

