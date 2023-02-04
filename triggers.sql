Create a table called “Student_Details” with the following attributes : Name,ID,Section,Marks(Max
Marks 500) ,Attendance_Percentage. Insert 5 rows into it. Create a procedure which would take input
the section for ex ‘A’,’B’ etc and returns back count of students who have minimum of 85% attendance
and marks are above 75%(ie above 350 marks)





mysql&gt; create database lab77;
Query OK, 1 row affected (0.09 sec)
mysql&gt; use lab77;
Database changed
mysql&gt; create table STUDENT_DETAILS(
-&gt; name varchar(20),
-&gt; id varchar(10),
-&gt; section varchar(2
-&gt; ),
-&gt; marks int(10),
-&gt; attendance_percetage int(10)
-&gt; );
Query OK, 0 rows affected, 2 warnings (0.11 sec)
mysql&gt; desc student_details;
+----------------------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+----------------------+-------------+------+-----+---------+-------+
| name | varchar(20) | YES | | NULL | |
| id | varchar(10) | YES | | NULL | |
| section | varchar(2) | YES | | NULL | |
| marks | int | YES | | NULL | |
| attendance_percetage | int | YES | | NULL | |
+----------------------+-------------+------+-----+---------+-------+
mysql&gt; insert into student_details values
-&gt; (&#39;PRIYAL&#39;,&#39;STU02&#39;,&#39;A&#39;,450,88),
-&gt; (&#39;VANSHIKA&#39;,&#39;STU03&#39;,&#39;B&#39;,355,79),
-&gt; (&#39;SHREEYA&#39;,&#39;STU04&#39;,&#39;B&#39;,412,90),
-&gt; (&#39;TUSHARIKA&#39;,&#39;STU05&#39;,&#39;A&#39;,477,87);
Query OK, 4 rows affected (0.01 sec)

mysql&gt; DELIMITER &amp;&amp;
mysql&gt; create procedure po1(sec char)
-&gt; begin
-&gt; select*,((marks/500)*100) as total_percetage from student_details where section = sec and
attendance_percetage&gt;=75 and marks&gt;=350;
-&gt; end &amp;&amp;
Query OK, 0 rows affected (0.01 sec)
mysql&gt; call po1(&#39;A&#39;) &amp;&amp;
