1. You are in Lothlórien and given a very important task of recommending a list of
names
2. to take up a position in the “Council”. The task is difficult as the position is
important
3. and only worthy elves should be recommended. But you are a “decisive” person
,so you
4. come with a strategy. You decide to select candidates by name, which are often
closely
5. aligned to an elf&amp;#39;s skill and temperament.
6. Choose those with “tegil” appearing anywhere in their first name, as they are
likely to be
7. good calligraphers, OR those with “astar” anywhere in their last name, who will
be
8. faithful to the role. You have the data in the “Elves Table” with columns -first
name, last
9. name. All names are in lowercase.
10. You are asked to use TCL commands (COMMIT, ROLLBACK,,SAVEPOINT)






mysql&gt; start transaction;
Query OK, 0 rows affected (0.00 sec)
mysql&gt; create database lothe_world; //creating database
Query OK, 1 row affected (0.00 sec)
mysql&gt; use lothe_world;
Database changed
mysql&gt; create table elves(
-&gt; fname varchar(20),
-&gt; lname varchar(20)
-&gt; );
Query OK, 0 rows affected (0.03 sec)
mysql&gt; insert into elves(fname,lname)
-&gt; values(&#39;aegnor&#39;,&#39;ser astar&#39;),
-&gt; (&#39;tegil rio&#39;,&#39;sis&#39;),
-&gt; (&#39;arma&#39;,&#39;astar b&#39;),
-&gt; (&#39;snoop tegil&#39;,&#39;drg&#39;),
-&gt; (&#39;drake&#39;,&#39;astar yu&#39;),
-&gt; (&#39;tegil niall&#39;,&#39;horr&#39;)
-&gt; );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your
MySQL server version for the right syntax to use near &#39;)&#39; at line 8
mysql&gt; insert into elves(fname,lname)

-&gt; values(&#39;aegnor&#39;,&#39;ser astar&#39;),
-&gt; (&#39;tegil rio&#39;,&#39;sis&#39;),
-&gt; (&#39;arma&#39;,&#39;astar b&#39;),
-&gt; (&#39;snoop tegil&#39;,&#39;drg&#39;),
-&gt; (&#39;drake&#39;,&#39;astar yu&#39;),
-&gt; (&#39;tegil niall&#39;,&#39;horr&#39;);
Query OK, 6 rows affected (0.01 sec)
Records: 6 Duplicates: 0 Warnings: 0
mysql&gt; select * from elves;
+-------------+-----------+
| fname | lname |
+-------------+-----------+
| aegnor | ser astar |
| tegil rio | sis |
| arma | astar b |
| snoop tegil | drg |
| drake | astar yu |
| tegil niall | horr |
+-------------+-----------+
6 rows in set (0.00 sec)
mysql&gt; alter table elves
-&gt; add quality varchar(30);
Query OK, 0 rows affected (0.03 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql&gt; update elves
-&gt; set quality=&#39; Good Calligraphers&#39;
-&gt; where fname like &#39;%tegil%&#39;; // Giving quality value as good calligraphers where Tegil exists in first name
Query OK, 3 rows affected (0.01 sec)
mysql&gt; update elves
-&gt; set quality=&#39;Faithful&#39;
-&gt; where lname like &#39;%astar%&#39;; //Giving quality value as faithful where Astar exists in last name//
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3 Changed: 3 Warnings: 0
mysql&gt; select * from elves;
+-------------+-----------+---------------------+
| fname | lname | quality |
+-------------+-----------+---------------------+
| aegnor | ser astar | Faithful |
| tegil rio | sis | Good Calligraphers |
| arma | astar b | Faithful |
| snoop tegil | drg | Good Calligraphers |
| drake | astar yu | Faithful |
| tegil niall | horr | Good Calligraphers |
+-------------+-----------+---------------------+
6 rows in set (0.00 sec)
mysql&gt; update elves set fullname = concat(fname,&quot; &quot;,lname); //concat first and last name for full name

Query OK, 7 rows affected (0.01 sec)
Rows matched: 7 Changed: 7 Warnings: 0
mysql&gt; select * from elves;
+-------------+-----------+---------------------+------------------+
| fname | lname | quality | fullname |
+-------------+-----------+---------------------+------------------+
| aegnor | ser astar | Faithful | aegnor ser astar |
| tegil rio | sis | Good Calligraphers | tegil rio sis |
| arma | astar b | Faithful | arma astar b |
| snoop tegil | drg | Good Calligraphers | snoop tegil drg |
| drake | astar yu | Faithful | drake astar yu |
| tegil niall | horr | Good Calligraphers | tegil niall horr |
| dog | astar o | Faithful | dog astar o |
+-------------+-----------+---------------------+------------------+
7 rows in set (0.00 sec)
mysql&gt; savepoint p1; //savepoint saves at p1 savepoint_name
Query OK, 0 rows affected (0.00 sec)
mysql&gt; insert into elves(fname,lname,quality,fullname)
-&gt; values(&#39;stro tegil&#39;,&#39;ins&#39;,&#39;Faithful&#39;,&#39;stro tegil&#39;);
Query OK, 1 row affected (0.01 sec)
mysql&gt; savepoint p2;
Query OK, 0 rows affected (0.00 sec)
mysql&gt; insert into elves(fname,lname,quality,fullname)
-&gt; values(&#39;tee&#39;,&#39;astar&#39;,&#39;Faithful&#39;,&#39;teee astar&#39;);
Query OK, 1 row affected (0.01 sec)
mysql&gt; savepoint p3; //after making changes saving the new savepoint p3
Query OK, 0 rows affected (0.00 sec)
mysql&gt; commit;
Query OK, 0 rows affected (0.00 sec)
mysql&gt; rollback; //rollback to where the last commit was made
Query OK, 0 rows affected (0.00 sec)
mysql&gt; select*from elves;
+-------------+-----------+---------------------+------------------+
| fname | lname | quality | fullname |
+-------------+-----------+---------------------+------------------+
| aegnor | ser astar | Faithful | aegnor ser astar |
| tegil rio | sis | Good Calligraphers | tegil rio sis |
| arma | astar b | Faithful | arma astar b |
| snoop tegil | drg | Good Calligraphers | snoop tegil drg |
| drake | astar yu | Faithful | drake astar yu |
| tegil niall | horr | Good Calligraphers | tegil niall horr |
| dog | astar o | Faithful | dog astar o |
| stro tegil | ins | Faithful | stro tegil |

| tee | astar | Faithful | teee astar |
+-------------+-----------+---------------------+------------------+
mysql&gt; Select CONCAT(UPPER(SUBSTRING(fullname,1,1)),LOWER(SUBSTRING(fullname,2))) AS Name
from elves; // to capitalize the first letter of name//
+------------------+
| Name |
+------------------+
| Aegnor ser astar |
| Tegil rio sis |
| Arma astar b |
| Snoop tegil drg |
| Drake astar yu |
| Tegil niall horr |
| Dog astar o |
| Stro tegil |
| Teee astar |
+------------------+
