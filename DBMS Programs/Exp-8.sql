-- Code by Bhavy Kharbanda
-- Objective: To understand the use and implementation of SQL sequences.

-- 1. Create table of table name: EMP and add 6 rows
-- Column Name Data Type Width Attributes
-- Employee_id Character 10 PK
-- First_Name Character 30 NN
-- Last_Name Character 30 NN
-- DOB Date
-- Salary Number 25 NN
-- Department_id Character 10
-- 2. Execute the following index related queries:
--     1. Create a sequence by name EMPID_SEQ starting with value 100 with an interval of 1.
--     2. Write a SQL command for finding the current and the next status of EMPID_SEQ.
--     3. Change the Cache value of the sequence EMPID_SEQ to 20 and maxvalue to 1000.
--     4. Drop sequence EMPID_SEQ. 
--     5. Create a sequence called REVERSE to generate numbers in the descending order from 10000 to 1000 with a decrement of 5.


-- Query 1
CREATE SEQUENCE EMPID_SEQ
START WITH 100
INCREMENT BY 1
MINVALUE 100
MAXVALUE 200
CYCLE;

-- Query 2
SELECT EMPID_SEQ.NEXTVAL FROM EMP;
SELECT EMPID_SEQ.CURRVAL FROM EMP;

-- Query 3
ALTER SEQUENCE EMPID_SEQ
MAXVALUE 1000
CACHE 20;

-- Query 4
DROP SEQUENCE EMPID_SEQ;

-- Query 5
CREATE SEQUENCE REVERSE
START WITH 10000
INCREMENT BY -5
MINVALUE 1000
MAXVALUE 10000
CYCLE
CACHE 3;


