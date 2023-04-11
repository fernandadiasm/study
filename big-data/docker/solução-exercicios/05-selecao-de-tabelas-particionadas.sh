#Antes de iniciar o exercício, eu preciso fazer os seguintes passos:
#Entrar no meu banco de dados:
use fernanda; 

#Verificar as as tabelas presentes no meu banco de dados:
show tables;

#Selecionar os 10 primeiros registros da tabela nascimento pelo ano de 2016:
select * from nascimento where ano=2016 limit 10;

#Contar a quantidade de nomes de crianças nascidas em 2017:
select count(nome) as qtd from nascimento where ano=2017;

#Contar a quantidade de crianças nascidas em 2017:
select sum(frequencia) as qtd from nascimento where ano=2017;

#Contar a quantidade de crianças nascidas por sexo no ano de 2015:
select sexo, sum(frequencia) as qtd from nascimento where ano=2015 group by sexo;

#Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo:
select ano, sexo, sum(frequencia) as qtd from nascimento group by ano, sexo order by ano desc;

#Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo com o nome iniciado com ‘A’:
select ano, sexo, sum(frequencia) as qtd from nascimento where nome like 'A%' group by ano, sexo order by ano desc;

#Qual nome e quantidade das 5 crianças mais nascidas em 2016:
select nome, max(frequencia) as qtd from nascimento where ano=2016 group by nome order by qtd desc limit 5;

#Qual nome e quantidade das 5 crianças mais nascidas em 2016 do sexo masculino e feminino:
select nome, max(frequencia) as qtd, sexo from nascimento where ano=2016 group by nome, sexo order by qtd desc limit 5;