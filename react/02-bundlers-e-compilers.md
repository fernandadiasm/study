<h1 align="center"> Bundlers e Compilers </h1>

A evolução dos browsers é sempre mais lenta do que a evolução das linguagens e nem sempre os códigos são suportáveis por eles. É aí que entram em cena os bundlers e compilers.

Os compilers, são compiladores de código, ou seja, ferramentas que convertem os códigos de um formato pra outro. Ajudando a rodar códigos escritos em React, uma linguagem moderna, em browsers antigos que nativamente não suportariam o código cru em React, no ecossistema do Javascript, o compilador mais famoso é o Babel.
O Babel, basicamente, traduz códigos modernos para códigos mais antigos através da sintaxe.

Nenhuma aplicação é escrita em um único arquivo de código, cada parte da aplicação é separada e escrita de modo organizado e “conversando” entre si através de importação e exportação de dados e informações, mas os browsers também não “entendem” um código assim (pelo menos os mais antigos), então precisávamos de ferramentas capazes de fazer essa junção de todos os arquivos, em somente um, pois, os browsers eram capazes, somente, de carregar um único arquivo script.js e o responsável por essa funcionalidade é o bundler (empacotador). O bundler mais famoso é o Webpack.
O webpack, basicamente, converte um grande número de arquivos interligados entre si em um único arquivo executável.
Mas atualmente, os browsers vem acelerando sua evolução e temos outras alternativas em relação ao Babel e Webpack. O Vite e o Snowpack.

Vite – Uma grande vantagem do Vite em relação ao Webpack é que ele utiliza, por padrão, os ECMAScript Modules nativos do browser, ou seja, não é necessário bundling. Além disso, o Vite já faz o processo de compiling de forma automática, não precisando do Babel, pois, possui um compilador interno do próprio Vite.
