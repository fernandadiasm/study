<h1 align="center"> Criando um projeto react </h1>

A criação do projeto será pelo Vite, então dentro do terminal é preciso escrever o seguinte comando:
```
npm create vite@latest
```
Em seguida, é preciso instalar as dependências para que o projeto funcione:
```
npm install
```
Apago todas os arquivos no src, exceto o App.jsx e o main.jsx. É importante não esquecer de tirar as importações css/svg desses dois arquivos, para que o projeto funcione corretamente. Apagar tudo que estiver dentro do return no App.jsx.

<br>
O Vite já traz muitas coisas pré-configuradas para o projeto. Uma deles é o self-refresh (auto-carregamento) a cada atualização do projeto de forma automática.
Na tag script, localizada no arquivo index.html, vemos que é o type=”module”, pois, o Vite utiliza os ECMAScript Modules nativos do browser (formatos de importação e exportação entre arquivos) e no src=”/src/main.jsx” indica que este será o primeiro arquivo carregado ao iniciar a aplicação.

No main.jsx, importamos o React e o ReactDom. Sendo o React o coração da aplicação, independente da forma que será a aplicação (WEB, mobile, na TV, VR e etc), o ReactDOM é a integração do React com a DOM (Document Object Model) que é a representação do HTML através do Javascript. Então quando importamos o ReactDom, estamos integrando o React pra funcionar no ambiente Web (no browser).

A partir daí temos acesso a métodos do ReactDOM, como o ReactDOM.createroot que recebe o elemento raiz da página HTML. A partir daí o React irá criar toda a aplicação em html, css e Javascript dentro dessa div.

Além do createroot, temos o método render que é responsável por renderizar (mostrar em tela) o componente que estiver escrito ali, no caso o "App". Assim, toda a aplicação fica a cargo do Javascript e conseguimos ter mais poder para manipular todo o código.

