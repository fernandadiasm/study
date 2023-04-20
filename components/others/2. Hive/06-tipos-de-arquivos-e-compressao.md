## Tipos de arquivo e compressão no Hive

### Tipos de arquivo para salvar

Existem vários formatos de arquivos que vocês podem adicionar para salvar uma tabela do hive. Para adicionar o parâmetro stored na criação da tabela:

```
stored as <formatoArquivo>
```

E é possível salvar em diferentes tipos de arquivos: TEXTFILE (padrão), SEQUENCEFILE, RCFILE, ORC (Hortonworks), PARQUET (Cloudera), AVRO, JSONFILE.

### Tipode de compressão para salvar

A compressão é configurada no Hadoop num arquivo de configuração como mapred-site.xml. Se não estiver configurado, é possível setar manualmente:

``` sql
hive> SET hive.exec.compress.output=true;
hive> SET mapred.output.compression.codec=codec;
hive> SET mapred.output.compression.type=BLOCK;
```

Na segunda linha, onde está escrito CODEC, é preciso substituir pelos seguintes codecs de compressão abaixo:

gzip:

```
org.apache.hadoop.io.compress.GzipCodec
```

bzip2:

```
org.apache.hadoop.io.compress.Bzip2Codec
```

LZO:

```
com.hadoop.compression.lzo.LzoCodec
```

Snappy:

```
org.apache.hadoop.io.compress.SnappyCodec
```

Deflate:

```
org.apache.hadoop.io.compress.DeflateCodec
```

### Adicionar o parâmetro compress em tblproperties na criação da tabela

``` sql
stored as <formatoArquivo> tblproperties('formatoArquivo.compress´=´<CompressaoArquivo>');
```

### Exemplo de criação de tabela com partição e compressão

``` sql
create table user(
    id int,
    name String,
    age int
)
partitioned by (data String)
clustered by (id) into 256 buckets
stored as parquet tblproperties('parquet.compress'='SNAPPY');
```