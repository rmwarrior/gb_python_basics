Практическое задание по теме “Управление БД”
-Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
-Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
-Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
-*(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql.
 Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.


------------------------------------------------------------------------------------------
Video1:
------------------------------------------------------------------------------------------
Добавить в %PATH%:
  c:\Program Files\MySQL\MySQL Server 8.0\bin\

C:\Users\dn-ku>mysql -u root -p
**********


------------------------------------------------------------------------------------------
Video2:
------------------------------------------------------------------------------------------
mysql>
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.00 sec)

mysql>
mysql> CREATE DATABASE example;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql>
mysql> USE example;
Database changed
mysql> CREATE TABLE users(id SERIAL, name VARCHAR(100) NOT NULL UNIQUE);
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> SHOW TABLES;
+-------------------+
| Tables_in_example |
+-------------------+
| users             |
+-------------------+
1 row in set (0.00 sec)

mysql>
mysql> exit
Bye

c:\>mysqldump -u root -p example > example.sql


mysql> CREATE DATABASE sample;
Query OK, 1 row affected (0.01 sec)

mysql> exit
Bye

!!!!!!!! загружаем дамп не mysqldump, а mysql !!!!!!!!
C:\Users\dn-ku>mysql -u root -p sample < example.sql

Enter password: ****************

C:\Users\dn-ku>mysql -u root -p
Enter password: ****************
Welcome to the MySQL monitor.  Commands end with ; or \g. .......

mysql>
mysql> USE sample;
Database changed

mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0.00 sec)

mysql>


------------------------------------------------------------------------------------------
Video3:
------------------------------------------------------------------------------------------
Вместо имени ".my.cnf" в Windows "my.cnf"

[mysql]
user=root
password=**********

Рекомендуется заменить имя раздела [mysql] на [client], чтобы пароль подхватывался и другими утилитами: mysqldump ...
[client]
user=root
password=**********

mysql> exit
Bye

C:\Users\dn-ku>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
...

mysql>



------------------------------------------------------------------------------------------
первые 100 строк таблицы
------------------------------------------------------------------------------------------
C:\Users\dn-ku>mysqldump mysql help_keyword --where="help_keyword_id < 100" > few_rows_dump.sql

C:\Users\dn-ku>

------------------------------------------------------------------------------------------