<h1 align="center"> HIVE </h1>

## Formato de arquivos e compressão

Os formatos de arquivos mais conhecidos são:

* Text file
* Sequence file
* RC file
* ORC file
* Avro
* Parquet

<br>

### 1. Text File

São arquivos de texto, é o formato padrão tanto para o Hive quanto para o Sqoop, pela facilidade de compartilhar os dados do Hadoop com outros sistemas externos e de edição manualmente. Porém, como consequência dessa facilidade, ele acaba se tornando menos eficiente que os outros formatos, pois os outros formatos costumam ser mais lentos que aqueles com formato em text file.

Exemplo: txt e csv.

Exemplo de estruturas de texto: xml e json.

### 2. Sequence File

É um arquivo de sequência do Hadoop, formado por pares de chave e valor e armazena tudo em formato binário, se tornando mais eficiente que o formato text file. Além disso, ele também possui facilidade para compartilhar os dados com outras ferramentas do Hadoop.

### 3. RC File

É o primeiro formato de arquivo colunar do Hadoop, ele é formado por grupos de colunas, por isso recebe o nome de "Record Colunnar File". Apresenta um armazenamento horizontal dos dados

Vantagem: agilidade no carregamento de dados, principalmente quando estamos lidando com processamento de consultas.

Desvantagem: utiliza mais memória e computação, para realizar o carregamento de dados, e não suporta a evolução do esquema.

### 4. ORC File

Muito parecido com o RC file, a diferença é que ele veio para otimizar, por isso recebe o nome de "Optimized Row Colunnar File". Apesar de ter todas as características do RC file, o ORC acabou substituindo-o, por compactar melhor os arquivos, tornando as consultas mais rápidas.

O ORC foi projetado para otimizar o desempenho no Hive, trabalhando com faixas dividindo os dados por colunas. Não é usado para mapReduce não-Hive, como por exemplo: Pig, Impala e Java.

### 5. Avro

O Avro é formado por serialização de dados com neutralidade de linguagem (não precisa utilizar uma linguagem), armazenando os dados e metadados juntos. É um formato muito utilizado para trafegar dados pela rede.

Vantagens: suporta MapReduce e evolução do esquema.

### 6. Parquet

Tem formato colunar (formado por grups de colunas). É um formato padrão quando não se pensa em desempenho e consultas.

Vantagens: suporta MapReduce (ex.: Pig, Hive, Java), é possível usar o processamento com Impala e SparK e suporta evolução do esquema para usar tanto no Hive quanto no Impala.

### 7. Parquet

Tem formato colunar (formado por grups de colunas). É um formato padrão quando não se pensa em desempenho e consultas.

Vantagens: suporta MapReduce (ex.: Pig, Hive, Java), é possível usar o processamento com Impala e SparK e suporta evolução do esquema para usar tanto no Hive quanto no Impala.

Na compressão de dados é preciso fazer uma balança entre armazenamento e velocidade de leitura, ou seja, você sempre vai perder de um lado. Exemplos:

* ZLIB/GZip: ofereça alta compressão, porém como ele comprime muito os arquivos, acaba ficando mais lento. Ganhando no armazenamento e perdendo na velocidade de leitura de dados.
* Snappy: oferece uma baixa compressão, deixando os arquivos mais leves e acaba ficando mais rápido.

Na compressão de dados é importante fazer uma balança entre armazenamento e velocidade de leitura de dados, porque sempre vai existir a perda de algun dos dois. Exemplos:

* ZLIB/GZIp: alta compressão, velocidade de leitura lenta.
* Snappy: baixa compressão, velocidade de leitura rápida.

<p align="center">
  <img alt="logo do docker" src="https://github.com/fernandadiasm/study/blob/main/public/tipos-de-arquivo-e-compressao-1.png?raw=true" width="50%">
</p>
<br>


