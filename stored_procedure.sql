an emerging technology in the financial industry called Neo-Banks: new aged
digital only banks without physical branches. The management team at Bank want
to increase their total customer base - but also need some help tracking just
how much data storage their customers will need.Consider the
following tables and write the query to retrieve, How many days on average are
customers reallocated to a different region and What is the closing balance for
each customer at the end of the month?









//creating tables,inserting values and key constraints//
mysql&gt; use lab7;
Database changed
mysql&gt; create table REGION(
-&gt; region_id varchar(10) PRIMARY KEY,
-&gt; region_name varchar(20)
-&gt; );
Query OK, 0 rows affected (0.09 sec)
mysql&gt; create table CUSTOMER(
-&gt; c_id varchar(10) PRIMARY KEY,
-&gt; region_id varchar(10),
-&gt; start_date date,
-&gt; end_date date);
Query OK, 0 rows affected (0.03 sec)
mysql&gt; alter table customer
-&gt; add FOREIGN KEY(region_id) references REGION(region_id);
Query OK, 0 rows affected (0.12 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql&gt; create table TRANSACTION(
-&gt; customer_id varchar(10),
-&gt; txn_date date,
-&gt; txn_type varchar(20),
-&gt; txn_amount int(10)
-&gt; );
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql&gt; INSERT INTO REGION VALUES
-&gt; (&#39;B002&#39;,&#39;BANGALORE&#39;),
-&gt; (&#39;V003&#39;,&#39;VIJAYNAGAR&#39;),
-&gt; (&#39;I004&#39;,&#39;INDIRANAGAR&#39;),
-&gt; (&#39;A005&#39;,&#39;ADUGODI&#39;),
-&gt; (&#39;K006&#39;,&#39;KEMPGOWDA&#39;);
Query OK, 5 rows affected (0.00 sec)

mysql&gt; insert into customer values
-&gt; (&#39;C101&#39;,&#39;B002&#39;,&#39;2019-07-14&#39;,&#39;2021-12-12&#39;),
-&gt; (&#39;C102&#39;,&#39;V003&#39;,&#39;2021-10-12&#39;,&#39;2022-02-17&#39;),
-&gt; (&#39;C103&#39;,&#39;I004&#39;,&#39;2022-04-23&#39;,&#39;2022-07-12&#39;),
-&gt; (&#39;C104&#39;,&#39;A005&#39;,&#39;2022-11-10&#39;,&#39;2022-12-03&#39;),
-&gt; (&#39;C105&#39;,&#39;K006&#39;,&#39;2021-12-30&#39;,&#39;2022-03-20&#39;);
Query OK, 5 rows affected (0.01 sec)
mysql&gt; INSERT INTO TRANSACTION VALUES
-&gt; (&#39;C101&#39;,&#39;2022-09-10&#39;,&#39;BILLING&#39;,1500),
-&gt; (&#39;C102&#39;,&#39;2022-08-10&#39;,&#39;CASH&#39;,6000),
-&gt; (&#39;C103&#39;,&#39;2022-01-30&#39;,&#39;CASH&#39;,15000),
-&gt; (&#39;C104&#39;,&#39;2022-05-17&#39;,&#39;BILLING&#39;,2500),
-&gt; (&#39;C105&#39;,&#39;2022-10-30&#39;,&#39;BILLING&#39;,3000);
Query OK, 5 rows affected (0.01 sec)
Records: 5 Duplicates: 0 Warnings: 0

// creating a stored procedure lab7ans and then displaying according to the given conditions//
mysql&gt; delimiter &amp;&amp;
mysql&gt; create procedure lab7ans()
-&gt; begin
-&gt; select region.region_name,avg(datediff(customer.end_date,customer.start_date)),region.region_id
from region join customer on region.region_id=customer.region_id group by region.region_name;
-&gt; end &amp;&amp;
Query OK, 0 rows affected (0.01 sec)
mysql&gt; call lab7ans() &amp;&amp;
