<h1 align="center"> Exercícios </h1>

<p align="center">
  <img alt="logo do docker" src="../../public/docker-logo.png" width="20%">
</p>

<div align="left">
<h2 align="center"> Lista de exercícios </h2>
  <p>
  <a href="#">1. </a>
  </p>
  <p>
  <a href="#">2. </a>
  </p>
  <p>
  <a href="#">3. </a>
  </p>
  <p>
  <a href="#">4.</a>
  </p>
  <p>
  <a href="#-hive-seleção-de-tabelas">5. Hive - Seleção de tabelas</a>
  </p>
</div>
<br>
<br>

## 👩🏻‍💻 Hive - Seleção de Tabelas

<p>Antes de iniciar o exercício, eu preciso fazer os seguintes passos:</p>

Entrar no meu banco de dados:
``` sql
use fernanda; 
```
Verificar as as tabelas presentes no meu banco de dados: 
``` sql
show tables;
```

<br>

<div>
1. Selecionar os 10 primeiros registros da tabela nascimento pelo ano de 2016:

``` sql
select * from nascimento where ano=2016 limit 10;
```
</div>

<div>
2. Contar a quantidade de nomes de crianças nascidas em 2017:

``` sql
select count(nome) as qtd from nascimento where ano=2017;
```
</div>

<div>
3. Contar a quantidade de crianças nascidas em 2017:

``` sql
select sum(frequencia) as qtd from nascimento where ano=2017;
```
</div>

<div>
4. Contar a quantidade de crianças nascidas por sexo no ano de 2015:

``` sql
select sexo, sum(frequencia) as qtd from nascimento where ano=2015 group by sexo;
```
</div>

<div>
5. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo:

``` sql
select ano, sexo, sum(frequencia) as qtd from nascimento group by ano, sexo order by ano desc;
```
</div>

<div>
6. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo com o nome iniciado com ‘A’:

``` sql
select ano, sexo, sum(frequencia) as qtd from nascimento where nome like 'A%' group by ano, sexo order by ano desc;
```
</div>

<div>
7. Qual nome e quantidade das 5 crianças mais nascidas em 2016:

``` sql
select nome, max(frequencia) as qtd from nascimento where ano=2016 group by nome order by qtd desc limit 5;
```
</div>

<div>
8. Qual nome e quantidade das 5 crianças mais nascidas em 2016 do sexo masculino e feminino:

``` sql
select nome, max(frequencia) as qtd, sexo from nascimento where ano=2016 group by nome, sexo order by qtd desc limit 5;
```
</div>

<br>

## :memo: Licença

Esse repositório está sob a licença MIT.

---

#### Desenvolvido com ♥ by Fernanda Dias

<div>
<p align="left">
<a href="https://www.linkedin.com/in/fernandadiasme" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank"></a>  
<a href = "mailto:fernandadias.dev@gmail.com"><img src="https://img.shields.io/badge/-Gmail-%23333?style=for-the-badge&logo=gmail&logoColor=white" target="_blank"></a>
<a href="https://instagram.com/ferandadias" target="_blank"><img src="https://img.shields.io/badge/-Instagram-%23E4405F?style=for-the-badge&logo=instagram&logoColor=white" target="_blank"></a>
</div>
