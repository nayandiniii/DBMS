You are a successful entrepreneur and have a committed set of employees in your
organization. But lately you have observed that the deadlines are not being met by most
of the departments. You release that the number of hours clocked in by employees is an
important criterion in identifying the reason behind the problem. An avid coder
yourself, you take up the responsibility of writing a query to retrieve the total number
of hours clocked by each department.
Consider the following tables and write the query to retrieve how many hours are
clocked in by each department in a month. Assume that you have only one-month
records in the Timesheet table.
Timesheet:
Id primary key,
Employee_id,
Department_id
Login,
Logout
Department:
Department_id,
Department_name
NOTE: Login, Logout are of type DATETIME.








1. CREATING DATABASE AND TABLES:
create database lab5;
mysql&gt; use lab5;
Database changed
mysql&gt; create table timesheet(
-&gt; id varchar(5) NOT NULL PRIMARY KEY,
-&gt; employee_id varchar(5),
-&gt; department_id varchar(5),
-&gt; login datetime,
-&gt; logout datetime);
Query OK, 0 rows affected (0.10 sec)
mysql&gt; create table department(
-&gt; department_id varchar(5),
-&gt; department_name varchar(20));
2. ADDING KEYS:
mysql&gt; alter table department
-&gt; add primary key(department_id);

Query OK, 0 rows affected (0.07 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql&gt; alter table timesheet
-&gt; add foreign key(department_id) references department(department_id);
Query OK, 0 rows affected (0.10 sec)

3. INSERTING VALUES:
mysql&gt; insert into department values
-&gt; (&#39;C0178&#39;,&#39;IT&#39;),
-&gt; (&#39;C9831&#39;,&#39;IT&#39;),
-&gt; (&#39;HR163&#39;,&#39;HR&#39;),
-&gt; (&#39;S7636&#39;,&#39;SALES&#39;),
-&gt; (&#39;S0135&#39;,&#39;SALES&#39;),
-&gt; (&#39;HR776&#39;,&#39;HR&#39;),
-&gt; (&#39;C7452&#39;,&#39;IT&#39;),
-&gt; (&#39;S1646&#39;,&#39;SALES&#39;),
-&gt; (&#39;HR412&#39;,&#39;HR&#39;),
-&gt; (&#39;S0157&#39;,&#39;SALES&#39;),
-&gt; (&#39;C8143&#39;,&#39;IT&#39;);
mysql&gt; INSERT INTO timesheet values
-&gt; (&#39;6481&#39;,&#39;E98&#39;,&#39;S0135&#39;,&#39;2022-11-19 10:23:56&#39;,&#39;2022-11-19 16:43:59&#39;),
-&gt; (&#39;5714&#39;,&#39;E43&#39;,&#39;HR163&#39;,&#39;2022-11-19 11:42:12&#39;,&#39;2022-11-19 14:12:54&#39;),
-&gt; (&#39;0143&#39;,&#39;E80&#39;,&#39;C0178&#39;,&#39;2022-11-19 09:12:33&#39;,&#39;2022-11-19 17:43:12&#39;);
4. DISPLAYING TABLES:
mysql&gt; SELECT*FROM department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
| C0178 | IT |
| C7452 | IT |
| C8143 | IT |
| C9831 | IT |
| HR163 | HR |
| HR412 | HR |
| HR776 | HR |
| S0135 | SALES |
| S0157 | SALES |
| S1646 | SALES |

| S7636 | SALES |
+---------------+-----------------+

mysql&gt; SELECT*FROM timesheet;
+------+-------------+---------------+---------------------+---------------------+
| id | employee_id | department_id | login | logout |
+------+-------------+---------------+---------------------+---------------------+
| 0143 | E80 | C0178 | 2022-11-19 09:12:33 | 2022-11-19 17:43:12 |
| 1098 | E87 | S7636 | 2022-11-01 11:32:13 | 2022-11-01 16:12:43 |
| 4413 | E65 | C8143 | 2022-11-04 08:12:43 | 2022-11-05 16:19:33 |
| 4483 | E69 | C9831 | 2022-11-01 09:12:33 | 2022-11-01 14:45:43 |
| 5714 | E43 | HR163 | 2022-11-19 11:42:12 | 2022-11-19 14:12:54 |
| 5937 | E81 | C7452 | 2022-11-07 08:12:54 | 2022-11-10 15:22:11 |
| 6481 | E98 | S0135 | 2022-11-19 10:23:56 | 2022-11-19 16:43:59 |
| 7153 | E09 | S0157 | 2022-11-07 09:54:33 | 2022-11-10 19:55:33 |
| 8712 | E12 | HR776 | 2022-11-01 10:43:03 | 2022-11-01 13:22:43 |
| 8746 | E44 | S1646 | 2022-11-04 09:12:33 | 2022-11-05 14:45:43 |
| 9154 | E19 | HR163 | 2022-11-07 10:12:11 | 2022-11-10 12:44:19 |
| 9244 | E87 | HR412 | 2022-11-04 11:44:33 | 2022-11-05 17:45:43 |
+------+-------------+---------------+---------------------+---------------------+

5. TIME DIFFERENCE:
mysql&gt; select timesheet.department_id, timediff(timesheet.logout,timesheet.login) as
&#39;total_time&#39; from timesheet;
+---------------+------------+
| department_id | total_time |
+---------------+------------+
| C0178 | 08:30:39 |
| S7636 | 04:40:30 |
| C8143 | 32:06:50 |
| C9831 | 05:33:10 |
| HR163 | 02:30:42 |
| C7452 | 79:09:17 |
| S0135 | 06:20:03 |
| S0157 | 82:01:00 |
| HR776 | 02:39:40 |
| S1646 | 29:33:10 |
| HR163 | 74:32:08 |
| HR412 | 30:01:10 |
+---------------+------------+

6. QUERY TO SHOW THE SUM OF DIFFERENCE BETWEEN LOGOUT AND LOGIN
TIME ,DEPARTMENT WISE:

mysql&gt; select timesheet.id,
SEC_TO_TIME(sum(timediff(timesheet.logout,timesheet.login))),department.department_name
from timesheet join department on timesheet.department_id=department.department_id
-&gt; group by department.department_name;
+------+--------------------------------------------------------------+-----------------+
| id | SEC_TO_TIME(sum(timediff(timesheet.logout,timesheet.login))) | department_name |
+------+--------------------------------------------------------------+-----------------+
| 0143 | 346:38:36 | IT |
| 5714 | 302:51:40 | HR |
| 6481 | 338:44:03 | SALES |
+------+--------------------------------------------------------------+-----------------+
