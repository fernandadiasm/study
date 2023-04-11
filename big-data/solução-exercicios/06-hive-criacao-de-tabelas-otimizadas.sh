#Inicio meu cluster usando o -d para não ver os logs
docker-compose up -d

#Acesso o hive
docker exec -it hive-server bash

#Acesso o beeline
beeline -u jdbc:hive2://localhost:10000

#Usar o banco de dados <nome>
use fernanda;

#Selecionar os 10 primeiros registros da tabela pop
select * from pop limit 10;

+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
| pop.zip_code  | pop.total_population  | pop.median_age  | pop.total_males  | pop.total_females  | pop.total_households  | pop.average_household_size  |
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+
| 91371         | 1                     | 73.5            | 0                | 1                  | 1                     | 1.0                         |
| 90001         | 57110                 | 26.6            | 28468            | 28642              | 12971                 | 4.4                         |
| 90002         | 51223                 | 25.5            | 24876            | 26347              | 11731                 | 4.36                        |
| 90003         | 66266                 | 26.3            | 32631            | 33635              | 15642                 | 4.22                        |
| 90004         | 62180                 | 34.8            | 31302            | 30878              | 22547                 | 2.73                        |
| 90005         | 37681                 | 33.9            | 19299            | 18382              | 15044                 | 2.5                         |
| 90006         | 59185                 | 32.4            | 30254            | 28931              | 18617                 | 3.13                        |
| 90007         | 40920                 | 24.0            | 20915            | 20005              | 11944                 | 3.0                         |
| 90008         | 32327                 | 39.7            | 14477            | 17850              | 13841                 | 2.33                        |
| 90010         | 3800                  | 37.8            | 1874             | 1926               | 2014                  | 1.87                        |
+---------------+-----------------------+-----------------+------------------+--------------------+-----------------------+-----------------------------+

#Criar a tabela pop_parquet no formato parquet para ler os dados da tabela pop
create table pop_parquet(
    zip_code int, 
    total_population int, 
    median_age float, 
    total_males int, 
    total_females int, 
    total_households int, 
    average_household_size float
)
stored as parquet;

#Inserir os dados da tabela pop na pop_parquet
insert into pop_parquet select * from pop;

#Contar os registros da tabela pop_parquet, conferir se a tabela pop tem a mesma quantidade de registros da tabela parquet
select count(*) from pop;
+------+
| _c0  |
+------+
| 319  |
+------+
select count(*) from pop_parquet;
+------+
| _c0  |
+------+
| 319  |
+------+

#Selecionar os 10 primeiros registros da tabela pop_parquet
select * from pop_parquet limit 10;
+-----------------------+-------------------------------+-------------------------+--------------------------+----------------------------+-------------------------------+-------------------------------------+
| 91371                 | 1                             | 73.5                    | 0                        | 1                   
       | 1                             | 1.0                                 |
| 90001                 | 57110                         | 26.6                    | 28468                    | 28642               
       | 12971                         | 4.4                                 |
| 90002                 | 51223                         | 25.5                    | 24876                    | 26347               
       | 11731                         | 4.36                                |
| 90003                 | 66266                         | 26.3                    | 32631                    | 33635               
       | 15642                         | 4.22                                |
| 90004                 | 62180                         | 34.8                    | 31302                    | 30878               
       | 22547                         | 2.73                                |
| 90005                 | 37681                         | 33.9                    | 19299                    | 18382               
       | 15044                         | 2.5                                 |
| 90006                 | 59185                         | 32.4                    | 30254                    | 28931               
       | 18617                         | 3.13                                |
| 90007                 | 40920                         | 24.0                    | 20915                    | 20005               
       | 11944                         | 3.0                                 |
| 90008                 | 32327                         | 39.7                    | 14477                    | 17850               
       | 13841                         | 2.33                                |
| 90010                 | 3800                          | 37.8                    | 1874                     | 1926                
       | 2014                          | 1.87                                |
+-----------------------+-------------------------------+-------------------------+--------------------------+----------------------------+-------------------------------+-------------------------------------+

#Criar a tabela pop_parquet_snappy no formato parquet com compressão Snappy para ler os dados da tabela pop
create table pop_parquet_snappy(
    zip_code int, 
    total_population int, 
    median_age float, 
    total_males int, 
    total_females int, 
    total_households int, 
    average_household_size float
)
stored as parquet
tblproperties('parquet.compress'='SNAPPY');

#Inserir os dados da tabela pop na pop_parquet_snappy
insert into pop_parquet_snappy select * from pop;

#Contar os registros da tabela pop_parquet_snappy
select count(*) from pop_parquet_snappy;
+------+
| _c0  |
+------+
| 319  |
+------+

#Selecionar os 10 primeiros registros da tabela pop_parquet_snappy
select * from pop_parquet_snappy limit 10;
+------------------------------+--------------------------------------+--------------------------------+---------------------------------+-----------------------------------+--------------------------------------+--------------------------------------------+
| pop_parquet_snappy.zip_code  | pop_parquet_snappy.total_population  | pop_parquet_snappy.median_age  | pop_parquet_snappy.total_males  | pop_parquet_snappy.total_females  | pop_parquet_snappy.total_households  | pop_parquet_snappy.average_household_size  |
+------------------------------+--------------------------------------+--------------------------------+---------------------------------+-----------------------------------+--------------------------------------+--------------------------------------------+
| 91371                        | 1                                    | 73.5                           | 0                               | 1                                 | 1                                    | 1.0                                        |
| 90001                        | 57110                                | 26.6                           | 28468                           | 28642                             | 12971                                | 4.4                                        |
| 90002                        | 51223                                | 25.5                           | 24876                           | 26347                             | 11731                                | 4.36                                       |
| 90003                        | 66266                                | 26.3                           | 32631                           | 33635                             | 15642                                | 4.22                                       |
| 90004                        | 62180                                | 34.8                           | 31302                           | 30878                             | 22547                                | 2.73                                       |
| 90005                        | 37681                                | 33.9                           | 19299                           | 18382                             | 15044                                | 2.5                                        |
| 90006                        | 59185                                | 32.4                           | 30254                           | 28931                             | 18617                                | 3.13                                       |
| 90007                        | 40920                                | 24.0                           | 20915                           | 20005                             | 11944                                | 3.0                                        |
| 90008                        | 32327                                | 39.7                           | 14477                           | 17850                             | 13841                                | 2.33                                       |
| 90010                        | 3800                                 | 37.8                           | 1874                      
      | 1926                              | 2014                                 | 1.87                                       |    
+------------------------------+--------------------------------------+--------------------------------+---------------------------------+-----------------------------------+--------------------------------------+--------------------------------------------+  

#sair do beeline
#sair do hive
#Comparar as tabelas pop, pop_parquet e pop_parquet_snappy no HDFS.
docker exec -it namenode bash
hdfs dfs -ls /user/hive/warehouse/fernanda.db

drwxrwxr-x   - root supergroup          0 2023-04-05 13:02 /user/hive/warehouse/fernanda.db/pop
drwxrwxr-x   - root supergroup          0 2023-04-11 21:46 /user/hive/warehouse/fernanda.db/pop_parquet
drwxrwxr-x   - root supergroup          0 2023-04-11 22:00 /user/hive/warehouse/fernanda.db/pop_parquet_snappy

#ou posso usar o -du -h para ver o tamanho dos arquivos
hdfs dfs -du -h /user/hive/warehouse/fernanda.db

11.9 K  /user/hive/warehouse/fernanda.db/pop
9.3 K   /user/hive/warehouse/fernanda.db/pop_parquet
9.3 K   /user/hive/warehouse/fernanda.db/pop_parquet_snappy