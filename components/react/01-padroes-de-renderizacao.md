<h1 align="center"> Padrões de renderização </h1>

Os 2 principais padrões de renderização atualmente são os tipos de aplicação SSR (Server Side Rendering – Renderização do lado do servidor) e SPA (Single Page Application – Aplicativo de página única).



<p align="center"><strong>SSR (Server Side Rendering – Renderização do lado do servidor) </strong></p>

O SSR é o padrão tradicional, ou seja, toda vez que o usuário, através do browser, requisita uma página para o servidor, este, que possui tanto o backend como o frontend da aplicação, faz o carregamento dessa página em HTML/CSS/JS e devolve toda a página novamente para o browser. Então todo site que fica uma tela em branco enquanto a nova página não carrega, foi escrito no padrão SSR.
Possui uma única aplicação que possui: back-end e front-end.
<br><br>

<p align="center"><strong>SPA (Single Page Application)</strong></p>

Com o SPA, no momento em que o usuário acessa uma rota, o backend não é mais o responsável pela criação visual da página, ele contém as informações cruas necessárias que o usuário pediu na requisição e envia esses dados para o frontend (React), uma outra aplicação, através de uma estrutura de dados chamada json (Javascript Object Notation) que é de fácil leitura, pelo computador e pelo humano, pois, utiliza “chave” e “valor” somente e que é interpretável por praticamente todas as tecnologias e linguagens. 

Temos então outra estrutura divida em 2, o backend sendo responsável por tudo que não é visual e enviando para a outra aplicação (React, Vue, Angular) que, munida desses dados, fica responsável, somente pela construção da reposta visual para o usuário.

