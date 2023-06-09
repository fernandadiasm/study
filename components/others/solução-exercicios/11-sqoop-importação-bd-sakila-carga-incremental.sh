#Criar a tabela cp_rental_append, contendo a cópia da tabela rental com os campos rental_id e rental_date

$ sudo docker exec -it database bash
root@database:/# mysql -psecret
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| employees          |
| hue                |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
+--------------------+
mysql> use sakila;
mysql> show tables;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
mysql> select * from rental limit 5;
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
| rental_id | rental_date         | inventory_id | customer_id | return_date         | staff_id | last_update         |
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
|         1 | 2005-05-24 22:53:30 |          367 |         130 | 2005-05-26 22:04:30 |        1 | 2006-02-15 21:30:53 |
|         2 | 2005-05-24 22:54:33 |         1525 |         459 | 2005-05-28 19:40:33 |        1 | 2006-02-15 21:30:53 |
|         3 | 2005-05-24 23:03:39 |         1711 |         408 | 2005-06-01 22:12:39 |        1 | 2006-02-15 21:30:53 |
|         4 | 2005-05-24 23:04:41 |         2452 |         333 | 2005-06-03 01:43:41 |        2 | 2006-02-15 21:30:53 |
|         5 | 2005-05-24 23:05:21 |         2079 |         222 | 2005-06-02 04:33:21 |        1 | 2006-02-15 21:30:53 |
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
mysql> create table cp_rental_append select rental_id, rental_date from rental;
mysql> select * from cp_rental_append limit 5; 
+-----------+---------------------+
| rental_id | rental_date         |
+-----------+---------------------+
|         1 | 2005-05-24 22:53:30 |
|         2 | 2005-05-24 22:54:33 |
|         3 | 2005-05-24 23:03:39 |
|         4 | 2005-05-24 23:04:41 |
|         5 | 2005-05-24 23:05:21 |
+-----------+---------------------+

#.Criar a tabela cp_rental_id e cp_rental_date, contendo a cópia da tabela cp_rental_append

mysql> create table cp_rental_append_id select *  from cp_rental_append;
mysql> create table cp_rental_append_date select *  from cp_rental_append;
ctrl+d
ctrl+d

docker exec -it namenode bash

# Importar as tabelas cp_rental_append, cp_rental_id e cp_rental_date com 1 mapeador

root@namenode:/# sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_append
root@namenode:/# sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_date
root@namenode:/# sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_id
root@namenode:/# hdfs dfs -ls -R /user/hive/warehouse/db_test3

# Executar o sql /db-sql/sakila/insert_rental.sql no container do database

$ sudo docker exec -it database bash
root@database:/# cd /db-sql/sakila/
root@database:/db-sql/sakila# cat insert_renta.sql use sakila;

# Atualizar a tabela cp_rental_append no HDFS anexando os novos arquivos

root@database:/db-sql/sakila# cat insert_rental.sql use sakila;
root@database:/db-sql/sakila# mysel -psecret < insert_rental.sql

# Atualizar a tabela cp_rental_id no HDFS de acordo com o último registro de rental_id, adicionando apenas os novos dados.

$ docker exec -it namenode bash
root@namenode:/# sqoop import --table cp_rental_append --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --append
root@namenode:/# sqoop eval --table cp_rental_append --connect jdbc:mysql://database/sakila --username root --password secret query "select * from cp_rental_append order by renta_id desc limit 5"
root@namenode:/# sqoop import --table cp_rental_append --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --incremental append check colmun rental_id last value 16049

# Atualizar a tabela cp_rental_date no HDFS de acordo com o último registro de rental_date, atualizando os registros a partir desta data.

