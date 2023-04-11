ls input/exercises-data/db-sql/
ls input/exercises-data/db-sql/sakila/

# Copiar os dados do local para o contêiner database
$ docker cp input/exercises-data/db-sql/ database:/

# Acessar o contêiner database
$ docker exec -it database bash

mysql -h localhost -u root -psecret

# Instalar Banco de Dados de testes
Diretório /db-sql - BD employees (Já existe)
  $ cd /db-sql  

  $ mysql -psecret < employees.sql
  show databases;
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

Diretório /db-sql/sakila - BD sakila
$ cd /db-sql/sakila/

$ mysql -psecret < sakila-mv-schema.sql
$ mysql -psecret < sakila-mv-data.sql

#para confirmar se realmente foi
mysql -psecret
show databases;
use sakila;
select * from rental limit 10;
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
| rental_id | rental_date         | inventory_id | customer_id | return_date         | staff_id | last_update         |
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+
|         1 | 2005-05-24 22:53:30 |          367 |         130 | 2005-05-26 22:04:30 |        1 | 2006-02-15 21:30:53 |
|         2 | 2005-05-24 22:54:33 |         1525 |         459 | 2005-05-28 19:40:33 |        1 | 2006-02-15 21:30:53 |
|         3 | 2005-05-24 23:03:39 |         1711 |         408 | 2005-06-01 22:12:39 |        1 | 2006-02-15 21:30:53 |
|         4 | 2005-05-24 23:04:41 |         2452 |         333 | 2005-06-03 01:43:41 |        2 | 2006-02-15 21:30:53 |
|         5 | 2005-05-24 23:05:21 |         2079 |         222 | 2005-06-02 04:33:21 |        1 | 2006-02-15 21:30:53 |
|         6 | 2005-05-24 23:08:07 |         2792 |         549 | 2005-05-27 01:32:07 |        1 | 2006-02-15 21:30:53 |
|         7 | 2005-05-24 23:11:53 |         3995 |         269 | 2005-05-29 20:34:53 |        2 | 2006-02-15 21:30:53 |
|         8 | 2005-05-24 23:31:46 |         2346 |         239 | 2005-05-27 23:33:46 |        2 | 2006-02-15 21:30:53 |
|         9 | 2005-05-25 00:00:40 |         2580 |         126 | 2005-05-28 00:22:40 |        1 | 2006-02-15 21:30:53 |
|        10 | 2005-05-25 00:02:21 |         1824 |         399 | 2005-05-31 22:44:21 |        2 | 2006-02-15 21:30:53 |
+-----------+---------------------+--------------+-------------+---------------------+----------+---------------------+

docker exec -it namenode bash
import database -> hdfs(datanode)