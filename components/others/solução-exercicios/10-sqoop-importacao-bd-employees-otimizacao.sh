# Criar a tabela cp_titles_date, contendo a cópia da tabela titles com os campos title e to_date

$ docker exec -it database bash
root@database:/# mysql -psecret
mysql> use employees;

Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed

mysql> show tables;
+----------------------+
| Tables_in_employees  |
+----------------------+
| benefits             |
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| employees_2          |
| titles               |
+----------------------+
9 rows in set (0.00 sec)

mysql> select * from titles limit 10;
+--------+-----------------+------------+------------+
| emp_no | title           | from_date  | to_date    |
+--------+-----------------+------------+------------+
|  10001 | Senior Engineer | 1986-06-26 | 9999-01-01 |
|  10002 | Staff           | 1996-08-03 | 9999-01-01 |
|  10003 | Senior Engineer | 1995-12-03 | 9999-01-01 |
|  10004 | Engineer        | 1986-12-01 | 1995-12-01 |
|  10004 | Senior Engineer | 1995-12-01 | 9999-01-01 |
|  10005 | Senior Staff    | 1996-09-12 | 9999-01-01 |
|  10005 | Staff           | 1989-09-12 | 1996-09-12 |
|  10006 | Senior Engineer | 1990-08-05 | 9999-01-01 |
|  10007 | Senior Staff    | 1996-02-11 | 9999-01-01 |
|  10007 | Staff           | 1989-02-10 | 1996-02-11 |
+--------+-----------------+------------+------------+
10 rows in set (0.03 sec)

mysql> create table cp_titles_date select title,to_date from titles;

Query OK, 443308 rows affected (3.38 sec)
Records: 443308  Duplicates: 0  Warnings: 0

mysql> select * from cp_titles_date limit 10;
+-----------------+------------+
| title           | to_date    |
+-----------------+------------+
| Senior Engineer | 9999-01-01 |
| Staff           | 9999-01-01 |
| Senior Engineer | 9999-01-01 |
| Engineer        | 1995-12-01 |
| Senior Engineer | 9999-01-01 |
| Senior Staff    | 9999-01-01 |
| Staff           | 1996-09-12 |
| Senior Engineer | 9999-01-01 |
| Senior Staff    | 9999-01-01 |
| Staff           | 1996-02-11 |
+-----------------+------------+
10 rows in set (0.00 sec)

# Pesquisar os 15 primeiros registros da tabela cp_titles_date

mysql> select * from cp_titles_date limit 15;
+--------------------+------------+
| title              | to_date    |
+--------------------+------------+
| Senior Engineer    | 9999-01-01 |
| Staff              | 9999-01-01 |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 1995-12-01 |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | 1996-09-12 |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | 1996-02-11 |
| Assistant Engineer | 2000-07-31 |
| Assistant Engineer | 1990-02-18 |
| Engineer           | 1995-02-18 |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 9999-01-01 |
+--------------------+------------+
15 rows in set (0.00 sec)

# Alterar os registros do campo to_date para null da tabela cp_titles_date, quando o título for igual a Staff Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test_<numero_questao> e visualizar no HDFS

mysql> update cp_titles_date set to_date=NULL where title='Staff';

Query OK, 107391 rows affected (1.53 sec)
Rows matched: 107391  Changed: 107391  Warnings: 0

mysql> select * from cp_titles_date limit 15;      

+--------------------+------------+
| title              | to_date    |
+--------------------+------------+
| Senior Engineer    | 9999-01-01 |
| Staff              | NULL       |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 1995-12-01 |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | NULL       |
| Senior Engineer    | 9999-01-01 |
| Senior Staff       | 9999-01-01 |
| Staff              | NULL       |
| Assistant Engineer | 2000-07-31 |
| Assistant Engineer | 1990-02-18 |
| Engineer           | 1995-02-18 |
| Senior Engineer    | 9999-01-01 |
| Engineer           | 9999-01-01 |
+--------------------+------------+
15 rows in set (0.00 sec)

# Importar a tabela titles com 8 mapeadores no formato parquet

ctrl+d
ctrl+d
$ docker exec -it namenode bash
root@namenode:/# sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as-parquetfile --warehouse-dir /user/hive/warehouse/db_test2_4
root@namenode:/# hdfs dfs -ls -h /user/hive/warehouse/db_test2_4/titles
root@namenode:/# hdfs dfs -tail /user/hive/warehouse/db_test2_4/titles/c60232ef-0ece-4347-84ab-eedb8b4f0f61.parquet

#Importar a tabela titles com 8 mapeadores no formato parquet e compressão snappy

root@namenode:/# sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --warehouse-dir /user/hive/warehouse/db_test_2_5 --compress --compression-codec org.apache.hadoop.io.compress.SnappyCodec

#Importar a tabela cp_titles_date com 4 mapeadores (erro)
    Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo título no warehouse /user/hive/warehouse/db_test2_title
    Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo data no warehouse /user/hive/warehouse/db_test2_date

root@namenode:/# sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_title --split-by title

Qual a diferença dos registros nulos entre as duas importações?