a) Consider the following tables and
write the corelated queries

Employee(emp_number,emp_name)

Game(Gnumber,dept_no,emp_no,won,lost)

Payments(pay_no,emp_no,pay_date,amount)
Find
all employees who have won a minimum of two games.

Find all employees who have
received payment which has been already paid at least twice earlier





// CREATING DATABASE ,TABLES AND INSERTING VALUES//
create database lab6_1st;
Query OK, 1 row affected (0.01 sec)
mysql&gt; use lab6_1st;
Database changed
mysql&gt; create table EMPLOYEE(
-&gt; emp_number varchar(12),
-&gt; emp_name varchar(25)
-&gt; );
Query OK, 0 rows affected (0.04 sec)
mysql&gt; create table GAME(
-&gt; gnumber varchar(10),
-&gt; dept_no varchar(6),
-&gt; emp_no varchar(12),
-&gt; won varchar(5),
-&gt; lost varchar(5)
-&gt; );
Query OK, 0 rows affected (0.04 sec)
mysql&gt; create table PAYMENTS(
-&gt; pay_no varchar(12),
-&gt; emp_no varchar(12),
-&gt; pay_date date,
-&gt; amount varchar(6)

-&gt; );
Query OK, 0 rows affected (0.03 sec)

alter table EMPLOYEE
-&gt; ADD PRIMARY KEY(emp_number);
INSERT INTO EMPLOYEE VALUES
-&gt; (&#39;E069&#39;,&#39;STEVE ROGERS&#39;),
-&gt; (&#39;E007&#39;,&#39;NATASHA&#39;),
-&gt; (&#39;E688&#39;,&#39;BUCKY&#39;),
-&gt; (&#39;E981&#39;,&#39;GROOT&#39;),
-&gt; (&#39;E174&#39;,&#39;KORG&#39;),
-&gt; (&#39;E532&#39;,&#39;ODIN&#39;);
Query OK, 6 rows affected (0.01 sec)
mysql&gt; INSERT INTO GAME VALUES
-&gt; (&#39;OH322&#39;,&#39;3&#39;,&#39;E069&#39;,&#39;4&#39;,&#39;1&#39;),
-&gt; (&#39;UB124&#39;,&#39;4&#39;,&#39;E007&#39;,&#39;7&#39;,&#39;0&#39;),
-&gt; (&#39;GO665&#39;,&#39;3&#39;,&#39;E688&#39;,&#39;12&#39;,&#39;4&#39;),
-&gt; (&#39;SS876&#39;,&#39;1&#39;,&#39;E981&#39;,&#39;3&#39;,&#39;11&#39;),
-&gt; (&#39;QYY44&#39;,&#39;2&#39;,&#39;E174&#39;,&#39;12&#39;,&#39;1&#39;),
-&gt; (&#39;ES984&#39;,&#39;1&#39;,&#39;E532&#39;,&#39;6&#39;,&#39;9&#39;);
Query OK, 6 rows affected (0.01 sec)
Records: 6 Duplicates: 0 Warnings: 0
mysql&gt; INSERT INTO PAYMENTS VALUES
-&gt; (&#39;PAY02&#39;,&#39;E069&#39;,&#39;2022-09-30&#39;,&#39;15000&#39;),
-&gt; (&#39;PAY03&#39;,&#39;E007&#39;,&#39;2022-09-30&#39;,&#39;20000&#39;),
-&gt; (&#39;PAY04&#39;,&#39;E688&#39;,&#39;2022-08-31&#39;,&#39;45000&#39;),
-&gt; (&#39;PAY05&#39;,&#39;E981&#39;,&#39;2022-10-12&#39;,&#39;25000&#39;),
-&gt; (&#39;PAY06&#39;,&#39;E174&#39;,&#39;2022-10-12&#39;,&#39;12000&#39;),
-&gt; (&#39;PAY07&#39;,&#39;E532&#39;,&#39;2022-07-23&#39;,&#39;19000&#39;);
Query OK, 6 rows affected (0.01 sec)

// EMPLOYEE NAME WHO WON MORE THAN 2 GAMES//
select EMPLOYEE.emp_name,GAME.won from EMPLOYEE JOIN GAME on EMPLOYEE.emp_number
= GAME.emp_no
-&gt; where GAME.won&gt;=2;
+--------------+------+
| emp_name | won |
+--------------+------+
| TONY STARK | 2 |
| STEVE ROGERS | 4 |
| NATASHA | 7 |
| BUCKY | 12 |
| GROOT | 3 |
| KORG | 12 |
| ODIN | 6 |
+--------------+------+
7 rows in set (0.01 sec)

// EMPLOYEE NAME WHO HAVE RECEIVED PAYMENT MORE THAN ONCE//
mysql&gt; select count(PAYMENTS.AMOUNT) as count,EMPLOYEE.emp_name
-&gt; from EMPLOYEE JOIN PAYMENTS
-&gt; on EMPLOYEE.emp_number=PAYMENTS.emp_no
-&gt; GROUP BY EMPLOYEE.emp_name
-&gt; having count&gt;=2;
+-------+------------+
| count | emp_name |
+-------+------------+
| 2 | NATASHA |
| 2 | ODIN |
| 2 | BUCKY |
| 2 | TONY STARK |
+-------+------------+
