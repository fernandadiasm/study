# Visualizar o id e nome dos 5 primeiros registros

scala> spark.sql("select id_discente, nome from tab_alunos limit 5").show()
+-----------+--------------------+
|id_discente|                nome|
+-----------+--------------------+
|      18957|ABELARDO DA SILVA...|
|        553| ABIEL GODOY MARIANO|
|      17977|ABIGAIL ANTUNES S...|
|      16613|ABIGAIL FERNANDA ...|
|      17398|ABIGAIL JOSIANE R...|
+-----------+--------------------+
scala> val alunosHiveDF = spark.read.table("tab_alunos")
alunosHiveDF: org.apache.spark.sql.DataFrame = [id_discente: int, nome: string ... 5 more fields]
scala> alunosHiveDF.select("id_discente","nome").limit(5).show()
+-----------+--------------------+
|id_discente|                nome|
+-----------+--------------------+
|      18957|ABELARDO DA SILVA...|
|        553| ABIEL GODOY MARIANO|
|      17977|ABIGAIL ANTUNES S...|
|      16613|ABIGAIL FERNANDA ...|
|      17398|ABIGAIL JOSIANE R...|
+-----------+--------------------+

# Visualizar o id, nome e ano quando o ano de ingresso for maior ou igual a 2018

scala> spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018").show(5)
scala> alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018).show()

# Visualizar por ordem alfabética do nome o id, nome e ano quando o ano de ingresso for maior ou igual a 2018

scala> spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018 order by nome desc").show(5)
scala> alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018).orderBy($"nome".desc)show()

# Contar a quantidade de registros do item anterior

scala> spark.sql("select count(*) from tab_alunos where ano_ingresso >= 2018").show()
scala> alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018).show().count()
