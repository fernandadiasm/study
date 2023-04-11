<h1 align="center"> Docker </h1>



<p align="center">
  <img align="right" alt="logo do docker" src="../../public/docker-logo.png" width="40%">
</p>

<div align="left">
<h3>Sumário de pastas:</h3>

[Hadoop](https://github.com/fernandadiasm/study/tree/main/big-data/docker/1.%20Hadoop)

[Hive](https://github.com/fernandadiasm/study/tree/main/big-data/docker/2.%20Hive)

[Sqoop](https://github.com/fernandadiasm/study/tree/main/big-data/docker/3.%20Sqoop)

[Lista de exercícios](https://github.com/fernandadiasm/study/tree/main/big-data/docker/Exercicios)


</div>



<br>
<br>
<br>





## O que é o Docker?
O Docker é um softare de código aberto, usado para implantar aplicativos dentro de containers virtuais. Ele possibilita o empacotamento de uma aplicação ou ambiente dentro de um container, se tornando portátil para qualquer outro host que contenha o Docker instalado. Logo, é possível criar, implantar, copiar e migrar de um ambiente para outro com maior flexibilidade. A ideia do Docker é subir apenas uma máquina, ao invés de várias. E, nessa única máquina, você pode rodar várias aplicações sem que haja conflitos entre elas.

<br>

## Diferença entre Docker e uma máquina virtual
O Docker é algo parecido com uma máquina virtual extremamente leve, mas não se trata de fato de uma máquina virtual. O Docker utiliza containers que possuem uma arquitetura diferente, permitindo maior portabilidade e eficiência. O container exclui a virtualização e muda o processo para o Docker. Então, não podemos dizer que o Docker é uma máquina virtual. Veja na imagem abaixo as diferenças entre o Docker e uma virtualização:

<p align="center">
  <img alt="logo do docker" src="https://dkrn4sk0rn31v.cloudfront.net/2018/09/28135438/virtualization-vs-containers.jpg" width="90%">
</p>

Na virtualização, temos um maior consumo de recursos, uma vez que para cada aplicação precisamos carregar um sistema operacional. Já no Docker, podemos ver que não existe essa necessidade de múltiplos sistemas operacionais convidados.

<br>

## O que são os containers?
Um container é um ambiente isolado. Um container contém um conjunto de processos que são executados a partir de uma imagem, imagem esta que fornece todos os arquivos necessários. Os containers compartilham o mesmo kernel e isolam os processos da aplicação do restante do sistema.

<br>

## Por que utilizar o Docker?
Existem algumas vantagens em sua utilização como: economia de recursos, melhor disponibilidade do sistema (pelo compartilhamento do SO e de outros componentes), possibilidades de compartilhamento, simplicidade de criação e alteração da infraestrutura, manutenção simplificada (reduzindo o esforço e o risco de problemas com as dependências do aplicativo), entre muitas outras.