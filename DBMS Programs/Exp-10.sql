-- Code by Bhavy Kharbanda
-- Objective: To understand and implement the basics of functions and procedure in PL/SQL Programming.

-- 1. Write a PL/SQL code to accept the value of A, B & C display which is greater.
-- 2. Using PL/SQL Statements create a simple loop that display message “Welcome to PL/SQL Programming” 20 times.
-- 3. Write a PL/SQL code block to find the factorial of a number.
-- 4. Write a PL/SQL program to generate Fibonacci series.
-- 5. Write a PL/SQL code to fund the sum of first N numbers.


-- Code 1:
/* 1 */
DECLARE
x number := 12;
y number := 18;
z number := 24;
maximum number;
FUNCTION find_max(x IN number, y IN number, z IN number)
RETURN number
IS
 largest number;
BEGIN
 if x>y and x>z then
largest := x;
else 
 if y>x and y>z then
largest := y;
 else 
largest := z;
 end if;
end if;
 RETURN largest;
END;
begin
dbms_output.put_line('X = '||x||', Y = '||y||', Z = '||z);
maximum := find_max(12, 18, 24);
 IF maximum = x then
dbms_output.put_line('X is the greatest');
 end if;
 if maximum = y then
dbms_output.put_line('Y is the greatest');
 end if;
 if maximum = z then
dbms_output.put_line('Z is the greatest');
 end if;
end;
/
set serveroutput on;
start Bhavy.sql;


-- Code 2:
/* 2 */
DECLARE 
counter number:=1;
FUNCTION Print(count IN number)
RETURN number
IS 
 c number;
BEGIN
c := 1;
 WHILE c <= 20
 LOOP
dbms_output.put_line(c || ' Welcome to PL/SQL Programming');
c := c+1;
 END LOOP;
 RETURN c;
END;
BEGIN
counter := Print(counter);
END;
/
set serveroutput on;
start Bhavy.sql;


-- Code 3:
/* 3 */
DECLARE 
 x number; 
factorial_store number;
FUNCTION find_factorial(x number) 
RETURN number
IS 
 fact number; 
BEGIN 
 IF x = 0 THEN 
fact := 1; 
 ELSE 
fact := x * find_factorial(x-1); 
 END IF; 
RETURN fact; 
END;
BEGIN 
x := 5; 
factorial_store := find_factorial(x); 
dbms_output.put_line(' Factorial of '|| x || ' is ' || factorial_store); 
END;
/
set serveroutput on;
start Bhavy.sql;


-- Code 4:
/* 4 */
DECLARE
 x number := 0;
 y number := 1;
 z number := 0;
 initialize number := 1;
 n number := 10;
temp_store number;
temp_return number:=0;
FUNCTION Fibonacci_Generator(first_term IN OUT number, second_term IN OUT 
number, add_counter IN OUT number, count_var IN OUT number, limithead IN OUT 
number)
RETURN number
IS
temp_return number;
BEGIN
 while count_var<= limithead
 loop
dbms_output.put_line(first_term || ' ');
add_counter := second_term;
second_term := first_term + second_term;
first_term := add_counter;
count_var := count_var+1;
 END LOOP;
 RETURN temp_return;
END;
BEGIN
temp_store := Fibonacci_Generator(x, y, z, initialize, n);
END;
/
set serveroutput on;
start Bhavy.sql;


-- Code 5:
/* 5 */
DECLARE 
 x NUMBER;
 n NUMBER;
i NUMBER;
FUNCTION find_sum(n IN NUMBER)
 RETURN NUMBER
 IS 
 summation NUMBER := 0;
 BEGIN 
 FOR i IN 1..n
 LOOP
summation := i*(i+1)/2;
 END LOOP;
RETURN summation;
END;
BEGIN 
n := 10;
x := find_sum(n);
dbms_output.Put_line('Sum of first 10 numbers is: ' || x);
END;
/
set serveroutput on;
start Bhavy.sql;
