DOMAIN - INFO-ART

mysql> create database el_page;


mysql> use el_page;
Database changed
mysql> create table elayne_user(
    -> nickname varchar(8),
    -> );
mysql> create table elayne_user(
    -> nickname varchar(8)
    -> );


mysql> create table profile(
    -> name varchar(15),
    -> contact_no int(10),
    -> email varchar(15),
    -> interest varchar(10),
    -> address varchar(20)
    -> );


mysql> create table login(
    -> userID int(6),
    -> password varchar(8),
    -> role varchar(10)
    -> );


mysql> insert into profile(name,contact_no,email,interest,address)
    -> values('Max',9516123456,'max566@gmail.com','photography','12th street ,CA');
ERROR 1264 (22003): Out of range value for column 'contact_no' at row 1
mysql> update profile set contact_no=9416770224 where email='max566@gmail.com';

mysql> show tables;
+-------------------+
| Tables_in_el_page |
+-------------------+
| elayne_user       |
| login             |
| profile           |
+-------------------+

mysql> insert into login(userID,password,role)
    -> values(123456,'pass1234','editor');


mysql> desc login;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| userID   | int         | YES  |     | NULL    |       |
| password | varchar(8)  | YES  |     | NULL    |       |
| role     | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> select * from login;
+--------+----------+--------+
| userID | password | role   |
+--------+----------+--------+
| 123456 | pass1234 | editor |
+--------+----------+--------+


mysql> insert into login(userID,password,role)
    -> values(67888,'anoth1','admin');

mysql> insert into login(userID,password,role)
    -> values(89726,'nan2762','user');

mysql> insert into login(userID,password,role)
    -> values(78487,'hudh152','editor');


mysql> select * from login;
+--------+----------+--------+
| userID | password | role   |
+--------+----------+--------+
| 123456 | pass1234 | editor |
|  67888 | anoth1   | admin  |
|  89726 | nan2762  | user   |
|  78487 | hudh152  | editor |
+--------+----------+--------+

mysql> alter table login add primary key(userID);

mysql> insert into profile(contact_no,name,email,interest,address)
    -> values(93252270,'Toby','tobye@gmail.com','writing','34,C2,churchst.');

mysql> insert into profile(contact_no,name,email,interest,address)
    -> values(845366718,'Alexa','alexe@gmail.com','writing','4th AV,LA');

mysql> select * from profile;
+-------+------------+-----------------+----------+-----------------+
| name  | contact_no | email           | interest | address         |
+-------+------------+-----------------+----------+-----------------+
| Toby  |   93252270 | tobye@gmail.com | writing  | 34,C2,churchst. |
| Alexa |  845366718 | alexe@gmail.com | writing  | 4th AV,LA       |
+-------+------------+-----------------+----------+-----------------+

mysql> insert into profile(contact_no,name,email,interest,address)
    -> values(913466783,'Shevy','strb@gmail.com','editor','1 cross,CL');

mysql> select * from login;
+--------+----------+--------+
| userID | password | role   |
+--------+----------+--------+
|  67888 | anoth1   | admin  |
|  78487 | hudh152  | editor |
|  89726 | nan2762  | user   |
| 123456 | pass1234 | editor |
+--------+----------+--------+

mysql> alter table elayne_user add column personalized_sticker varchar(20);

mysql> select * from elayne_user;
Empty set (0.00 sec)

mysql> desc elayne_user;
+----------------------+-------------+------+-----+---------+-------+
| Field                | Type        | Null | Key | Default | Extra |
+----------------------+-------------+------+-----+---------+-------+
| nickname             | varchar(8)  | YES  |     | NULL    |       |
| personalized_sticker | varchar(20) | YES  |     | NULL    |       |
+----------------------+-------------+------+-----+---------+-------+

mysql> alter table elayne_user drop column personalized_sticker;

mysql> select email,interest from profile;
+-----------------+----------+
| email           | interest |
+-----------------+----------+
| tobye@gmail.com | writing  |
| alexe@gmail.com | writing  |
| strb@gmail.com  | editor   |
+-----------------+----------+

mysql> select distinct role from login;
+--------+
| role   |
+--------+
| admin  |
| editor |
| user   |
+--------+

mysql> update login
    -> set userID=56449
    -> where password='pass1234';

mysql> select * from login;
+--------+----------+--------+
| userID | password | role   |
+--------+----------+--------+
|  56449 | pass1234 | editor |
|  67888 | anoth1   | admin  |
|  78487 | hudh152  | editor |
|  89726 | nan2762  | user   |
+--------+----------+--------+

mysql> insert into profile(contact_no,name,email,interest,address)
    -> values(67557576,'Nandini','nsn@gmail.com','photos','56,CL');
mysql> insert into profile(contact_no,name,email,interest,address)
    -> values(675587586,'Shreeya','s2r@gmail.com','writing','sgplaya');
Query OK, 1 row affected (0.08 sec)

mysql> select * from profile;
+---------+------------+-----------------+----------+-----------------+
| name    | contact_no | email           | interest | address         |
+---------+------------+-----------------+----------+-----------------+
| Toby    |   93252270 | tobye@gmail.com | writing  | 34,C2,churchst. |
| Alexa   |  845366718 | alexe@gmail.com | writing  | 4th AV,LA       |
| Shevy   |  913466783 | strb@gmail.com  | editor   | 1 cross,CL      |
| Nandini |   67557576 | nsn@gmail.com   | photos   | 56,CL           |
| Shreeya |  675587586 | s2r@gmail.com   | writing  | sgplaya         |
+---------+------------+-----------------+----------+-----------------+


mysql> create table Administrator(
    -> admin_id int NOT NULL PRIMARY KEY,
    -> work_type varchar(20)
    -> );


mysql> select * from Administrator;


mysql> insert into Administrator(admin_id,work_type)
    -> values(5362,'writer');

mysql> insert into Administrator(admin_id,work_type)
    -> values(9903,'photographer');


mysql> insert into Administrator(admin_id,work_type)
    -> values(6744,'photographer');


mysql> insert into Administrator(admin_id,work_type)
    -> values(8941,'writer');


mysql> select * from Administrator;
+----------+--------------+
| admin_id | work_type    |
+----------+--------------+
|     5362 | writer       |
|     6744 | photographer |
|     8941 | writer       |
|     9903 | photographer |
+----------+--------------+


mysql> create table contact_us(
    -> mobile_no int(10),
    -> email varchar(20),
    -> chatbot varchar(3)
    -> );
mysql> insert into contact_us(mobile_no,email,chatbot)
    -> values(76755222,'iis@gmail.com','yes');

mysql> insert into contact_us(mobile_no,email,chatbot)
    -> values(78533822,'2rs@gmail.com','yes');

mysql> insert into contact_us(mobile_no,email,chatbot)
    -> values(63738292,'hjuu@gmail.com','no');

mysql> select * from contact_us;
+-----------+----------------+---------+
| mobile_no | email          | chatbot |
+-----------+----------------+---------+
|  76755222 | iis@gmail.com  | yes     |
|  78533822 | 2rs@gmail.com  | yes     |
|  63738292 | hjuu@gmail.com | no      |
+-----------+----------------+---------+

mysql> create table feedback(
    -> rating int(5),
    -> reviews varchar(100)
    -> );
mysql> alter table feedback add column response varchar(50);

mysql> create table about_us(
    -> edu_ht varchar(100),
    -> name varchar(20),
    -> specification varchar(10)
    -> );

mysql> create table writer(
    -> followers int,
    -> no_submission int,
    -> type varchar(10)
    -> );

mysql> create table artists(
    -> followers int,
    -> no_submission int,
    -> art_type varchar(10)
    -> );
