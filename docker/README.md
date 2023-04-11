<h1 align="center"> Docker </h1>

<p align="center">
  <img alt="logo do docker" src="../public/docker-logo.png" width="30%">
</p>

<div align="left">
<h3>Sumário:</h3>

  
[Lista de exercícios](exercicios/README.md)

  
<p>
<a href="#-Formato-de-arquivos-e-compressão">1. Formato de arquivos e Compressão</a>
</p>

</div>

## Formato de arquivos e compressão

<div>
<h3>Conceitos - Formato de armazenamento e compressão</h3>

Os formatos de arquivos mais conhecidos são:

* Text file
* Sequence file
* RC file
* ORC file
* Avro
* Parquet

<br>
<h3>1. Text File</h3>
<p>
São arquivos de texto, é o formato padrão tanto para o Hive quanto para o Sqoop, pela facilidade de compartilhar os dados do Hadoop com outros sistemas externos e de edição manualmente. Porém, como consequência dessa facilidade, ele acaba se tornando menos eficiente que os outros formatos, pois os outros formatos costumam ser mais lentos que aqueles com formato em text file.
</p>

<p>Exemplo: txt e csv.</p>
<p> Exemplo de estruturas de texto: xml e json.</p>

<br>
<h3>2. Sequence File</h3>
<p>
É um arquivo de sequência do Hadoop, formado por pares de chave e valor e armazena tudo em formato binário, se tornando mais eficiente que o formato text file. Além disso, ele também possui facilidade para compartilhar os dados com outras ferramentas do Hadoop.
</p>

<br>
<h3>3. RC File</h3>
<p>
É o primeiro formato de arquivo colunar do Hadoop, ele é formado por grupos de colunas, por isso recebe o nome de "Record Colunnar File". Apresenta um armazenamento horizontal dos dados 

Vantagem: agilidade no carregamento de dados, principalmente quando estamos lidando com processamento de consultas.

Desvantagem: utiliza mais memória e computação, para realizar o carregamento de dados, e não suporta a evolução do esquema.
</p>


</div>
