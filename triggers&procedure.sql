1 Create a table called “Employee Details” with the following attributes : Emp-ID, Emp-Name, Gender,
DOB, SALARY, Age (Age limit 21years) . Insert 10 rows into it. Create a Trigger for before insert &amp;after
insert, before delete &amp; after delete, before update &amp; after update.
a)Use Procedures to insert the records and list it as well.
b)i) if they try to insert age less than 21 years give a message
ii) delete the record in which Emp-Name is started with &#39;a&#39;, &#39;b&#39;, &#39;c&#39;
iii)Give a bonus amount to the Employees based on their salary.







// CREATING TABLE AND INSERTING VALUES //
mysql&gt; create database lab9;
mysql&gt; use lab9;
Database changed
mysql&gt; create table EMPLOYEE(
emp_id varchar(5),
emp_name varchar(20),
gender varchar(2),
dob date,
salary int(10),
age int(2)
);
mysql&gt; insert into EMPLOYEE values
-&gt; (&#39;I001&#39;,&#39;MARK&#39;,&#39;M&#39;,&#39;2003-12-10&#39;,100000,19),
-&gt; (&#39;I002&#39;,&#39;RACHEL&#39;,&#39;F&#39;,&#39;2002-05-23&#39;,50000,20),
-&gt; (&#39;I003&#39;,&#39;JANICE&#39;,&#39;F&#39;,&#39;2001-06-12&#39;,40000,21),
-&gt; (&#39;I004&#39;,&#39;RICHARD&#39;,&#39;M&#39;,&#39;2005_12_05&#39;,30000,17);

// USING A TRIGGER TO APPLY CONDITION WHILE ADDING VALUES USING
PROCEDURES//
mysql&gt; CREATE TRIGGER PERSON_AGE3
-&gt; BEFORE INSERT
-&gt; ON EMPLOYEE
-&gt; FOR EACH ROW
-&gt; IF NEW.AGE&lt;18 THEN
-&gt; SIGNAL SQLSTATE &#39;50001&#39; SET MESSAGE_TEXT= &#39; AGE LESS THAN 18. PERSON
NOT ELIGIBLE !&#39;;
-&gt; END IF;
-&gt; END &amp;&amp;
Query OK, 0 rows affected (0.03 sec)
mysql&gt; INSERT INTO EMPLOYEE VALUES
-&gt; (&#39;I005&#39;,&#39;SUZAN&#39;,&#39;F&#39;,&#39;2005-08-09&#39;,70000,17);
-&gt; END &amp;&amp;
ERROR 1644 (50001): AGE LESS THAN 18. PERSON NOT ELIGIBLE !

mysql&gt; CREATE PROCEDURE INEMPL(IN EMP_ID VARCHAR(5),IN EMP_NAME
VARCHAR(20),IN GENDER VARCHAR(2),IN DOB DATE,IN SALARY INT(10),IN AGE INT(2))
-&gt; BEGIN
-&gt; INSERT INTO EMPLOYEE(EMP_ID,EMP_NAME,GENDER,DOB,SALARY,AGE) VALUES
(EMP_ID,EMP_NAME,GENDER,DOB,SALARY,AGE);
-&gt; END &amp;&amp;
Query OK, 0 rows affected, 2 warnings (0.03 sec)
mysql&gt; CALL INEMPL(&#39;I006&#39;,&#39;MONICA&#39;,&#39;F&#39;,&#39;2001-09-05&#39;,75000,21);
-&gt; END &amp;&amp;
—-----------------------------------------------------------------------------
Query OK, 1 row affected (0.02 sec)
mysql&gt; CALL INEMPL(&#39;I007&#39;,&#39;GUNTHER&#39;,&#39;M&#39;,&#39;2005-01-22&#39;,45000,17);
-&gt; END &amp;&amp;
ERROR 1644 (50001): AGE LESS THAN 18. PERSON NOT ELIGIBLE !

// DELETING ROWS AND STORING THEM IN TABLES EMPLOYEE_ARCHIVE1 AND
EMPLOYEE_ARCHIVE 2 USING TRIGGERS //
mysql&gt; create table employee_archive1(
-&gt; id varchar(5),
-&gt; name varchar(20),
-&gt; dob date);
-&gt; end &amp;&amp;
Query OK, 0 rows affected (0.03 sec)

mysql&gt; delimiter &amp;&amp;
mysql&gt; create trigger D1 before delete
-&gt; on employee
-&gt; for each row
-&gt; insert into employee_archive1(id,name,dob)
-&gt; values(old.emp_id,old.emp_name,old.dob);
-&gt; end &amp;&amp;
Query OK, 0 rows affected (0.01 sec)
mysql&gt; delete from employee
-&gt; where emp_name like &#39;A%&#39;;
-&gt; END &amp;&amp;
Query OK, 0 rows affected (0.01 sec)
mysql&gt; DELETE FROM EMPLOYEE
-&gt; WHERE EMP_NAME LIKE &#39;B%&#39;;
-&gt; END &amp;&amp;

Query OK, 0 rows affected (0.00 sec)
mysql&gt; DELETE FROM EMPLOYEE
-&gt; WHERE EMP_NAME LIKE &#39;C%&#39;;
-&gt; END &amp;&amp;
Query OK, 1 row affected (0.01 sec)

mysql&gt; CREATE TRIGGER D3 AFTER DELETE
-&gt; ON EMPLOYEE
-&gt; FOR EACH ROW
-&gt; INSERT INTO EMPLOYEE_ARCHIVE1(ID,NAME,DOB)
-&gt; VALUES(&#39;I_DEL&#39;,OLD.EMP_NAME,OLD.DOB);
-&gt; END &amp;&amp;
Query OK, 0 rows affected (0.01 sec)
mysql&gt; DELETE FROM EMPLOYEE
-&gt; WHERE EMP_NAME LIKE &#39;P%&#39;;

-&gt; END &amp;&amp;
Query OK, 1 row affected (0.01 sec)

// CREATING A TRIGGER TO SET SALARY VALUE AFTER BONUS BY APPLYING
CERTAIN CONDITION //

mysql&gt; CREATE TRIGGER SALARYT BEFORE UPDATE
-&gt; ON EMPLOYEE
-&gt; FOR EACH ROW
-&gt; IF NEW.SALARY&lt;50000 THEN
-&gt; SIGNAL SQLSTATE &#39;50002&#39; SET MESSAGE_TEXT=&#39;NOT ELIGIBLE FOR BONUS&#39;;
-&gt; END IF;
-&gt; END &amp;&amp;
Query OK, 0 rows affected (0.01 sec)

mysql&gt; create trigger t2 after update on employee
-&gt; for each row
-&gt; begin
-&gt; if new.salary&lt;&gt; old.salary then
-&gt; insert into answer(id,name,salary)
-&gt; values(old.emp_id,old.emp_name,new.salary);
-&gt; end if;
-&gt; end &amp;&amp;
Query OK, 0 rows affected (0.01 sec)
mysql&gt; UPDATE EMPLOYEE
-&gt; SET SALARY=SALARY+5000
-&gt; WHERE SALARY&gt;50000;
-&gt; END &amp;&amp;
Query OK, 6 rows affected (0.01 sec)
