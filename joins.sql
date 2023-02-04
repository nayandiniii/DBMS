“QOLA “, a multinational ridesharing company and they have a problem with
cancellation of rides/bookings .There has been too many cancellations and they are
trying to tackle it. They have “banned” clients and drivers who tend to cancel . You were
hired for your exceptional SQL skills and your task is to write queries for efficient data
retrieval. Read the following and write the query.
Consider the following tables
Trips : id, client_id, driver_id, city_id, status, book_date, where id is primary key,
client_id and driver_id are foreign keys(references users table user_id column), status
will hold “completed”,”canceled by driver”,canceled by client”
Users: user_id, banned, role where user_id is primary key , banned will hold “Yes” if the
the user is banned, else “No” and the role will hold “client”, “driver”.





SOLUTION:
//creating database//
create database qola;
use qola;
Database changed
CREATING TABLES AS TRIPS AND USERS:
create table trips(
-&gt; id varchar(5),
-&gt; client_id varchar(10),
-&gt; driver_id varchar(10),
-&gt; city_id varchar(10),
-&gt; status varchar(15),
-&gt; book_date date);
create table users(
-&gt; user_id varchar(10),
-&gt; role varchar(15),
-&gt; banned varchar(5));
MAKING COLUMNS AS PRIMARY AND FOREIGN KEYS:
alter table trips add primary key (id);
alter table users add primary key(user_id);
alter table trips add foreign key(client_id) references users(user_id);
alter table trips add foreign key(driver_id) references users(user_id);

INSERTING THE VALUES INTO TABLES:
insert into users
-&gt; values(&#39;7583&#39;,&#39;Driver&#39;,&#39;No&#39;),
-&gt; (&#39;9031&#39;,&#39;Driver&#39;,&#39;Yes&#39;),
-&gt; (&#39;6483&#39;,&#39;Client&#39;,&#39;No&#39;),
-&gt; (&#39;2940&#39;,&#39;Driver&#39;,&#39;Yes&#39;);
insert into trips
values(&#39;83901&#39;,&#39;2345&#39;,&#39;7583&#39;,&#39;BLR09&#39;,&#39;Canceled&#39;,&#39;2022-10-29&#39;);

insert into trips
values(&#39;01748&#39;,&#39;6483&#39;,&#39;2940&#39;,&#39;BLR09&#39;,&#39;Not Canceled&#39;,&#39;2022-11-18&#39;);
insert into trips
values(&#39;92804&#39;,&#39;1039&#39;,&#39;2940&#39;,&#39;BLR27&#39;,&#39;Not Canceled&#39;,&#39;2022-09-05&#39;);
DISPLAYING THE TABLES:
select*from trips;
+-------+-----------+-----------+---------+--------------+------------+
| id | client_id | driver_id | city_id | status | book_date |
+-------+-----------+-----------+---------+--------------+------------+
| 01748 | 6483 | 2940 | BLR09 | Not Canceled | 2022-11-18 |
| 19046 | 1039 | 7583 | BLR01 | Canceled | 2022-10-29 |
| 68691 | 2345 | 2940 | BLR69 | Not Canceled | 2022-10-15 |
| 83901 | 2345 | 7583 | BLR09 | Canceled | 2022-10-29 |
| 91674 | 6483 | 9031 | BLR88 | Canceled | 2022-11-01 |
| 92804 | 1039 | 2940 | BLR27 | Not Canceled | 2022-09-05 |
+-------+-----------+-----------+---------+--------------+------------+
select*from users;
+---------+--------+--------+
| user_id | role | banned |
+---------+--------+--------+
| 1039 | Client | Yes |
| 2345 | Client | No |
| 2940 | Driver | Yes |
| 6483 | Client | No |
| 7583 | Driver | No |
| 9031 | Driver | Yes |
+---------+--------+--------+
JOINING THE TWO TABLES:

select trips.id,trips.client_id,trips.city_id,trips.status,trips.book_date,users.banned,users.role
-&gt; from trips join users on trips.client_id=users.user_id;
+-------+-----------+---------+--------------+------------+--------+--------+
| id | client_id | city_id | status | book_date | banned | role |
+-------+-----------+---------+--------------+------------+--------+--------+
| 01748 | 6483 | BLR09 | Not Canceled | 2022-11-18 | No | Client |
| 19046 | 1039 | BLR01 | Canceled | 2022-10-29 | Yes | Client |
| 68691 | 2345 | BLR69 | Not Canceled | 2022-10-15 | No | Client |
| 83901 | 2345 | BLR09 | Canceled | 2022-10-29 | No | Client |
| 91674 | 6483 | BLR88 | Canceled | 2022-11-01 | No | Client |
| 92804 | 1039 | BLR27 | Not Canceled | 2022-09-05 | Yes | Client |
+-------+-----------+---------+--------------+------------+--------+--------+

FIND THE COUNT OF TRIPS WHERE STATUS SAYS ‘CANCELED’:
select count(*) from trips where status=&#39;canceled&#39;;
+----------+
| count(*) |
+----------+
| 3 |
FIND THE CANCELATION RATE on 2022-11-18:
select round(sum(status=&#39;Canceled&#39;)/count(status),2) as &#39;Cancelation rate&#39; from trips join users
on trips.client_id=users.user_id where users.banned=&#39;No&#39; and trips.book_date=&#39;2022-11-18&#39;;
+------------------+
| Cancelation rate |
+------------------+
| 0.50 |
+------------------+
