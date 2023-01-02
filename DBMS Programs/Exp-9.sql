-- Code by Bhavy Kharbanda
-- Objective: To understand and implement the basics of PL/SQL Programming.
-- 1. Write a PL/SQL code to accept the value of A, B & C display which is greater.
-- 2. Using PL/SQL Statements create a simple loop that display message “Welcome to PL/SQL Programming” 20 times.
-- 3. Write a PL/SQL code block to find the factorial of a number.
-- 4. Write a PL/SQL program to generate Fibonacci series.
-- 5. Write a PL/SQL code to fund the sum of first N numbers.


-- Code 1:
/* 1 */
declare a number := 10;
b number := 15;
c number := 20;
begin if a > b
AND a > c THEN dbms_output.put_line('Greatest number is ' || a);
elsif b > a
AND b > c THEN dbms_output.put_line('Greatest number is ' || b);
else dbms_output.put_line('Greatest number is ' || c);
end if;
end;
/
set serveroutput on;
start Bhavy.sql;


-- Code 2:
/* 2 */
declare a number := 1;
message varchar(50) := 'Welcome to PL/SQL Programming';
begin for a in 0..19 LOOP dbms_output.put_line(message);
END LOOP;
end;
/
set serveroutput on;
start Bhavy.sql;


-- Code 3:
/* 3 */
declare fac number := 1;
n number := 6;
begin while n > 0 loop fac := n * fac;
n := n -1;
end loop;
dbms_output.put_line(fac);
end;
/
set serveroutput on;
start Bhavy.sql;


-- Code 4:
/* 4 */
declare first number := 0;
second number := 1;
temp number;
Page 81 of 92 n number := 12;
i number;
begin dbms_output.put_line(first);
dbms_output.put_line(second);
for i in 2..n loop temp := first + second;
first := second;
second := temp;
dbms_output.put_line(temp);
end loop;
end;
/
set serveroutput on;
start Bhavy.sql;


-- Code 5:
/* 5 */
declare sum number := 0;
num number := & NUM;
beginFOR Iin 1..num LOOP sum := sum + I;
END LOOP;
dbms_output.put_line('Sum = ' || summ);
end;
/
set serveroutput on;
start Bhavy.sql;