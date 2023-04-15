<h1 align="center"> JSX</h1>

JSX é uma extensão de sintaxe para JavaScript que permite escrever marcações semelhantes a HTML dentro de um arquivo JavaScript. Embora existam outras maneiras de escrever componentes, a maioria dos desenvolvedores React prefere a concisão do JSX e a maioria das bases de código o utiliza.

<h2>JSX: Colocando marcação em JavaScript</h2>

A Web foi construída em HTML, CSS e JavaScript. Por muitos anos, os desenvolvedores da Web mantiveram o conteúdo em HTML, o design em CSS e a lógica em JavaScript — muitas vezes em arquivos separados! O conteúdo foi marcado dentro do HTML enquanto a lógica da página vivia separadamente no JavaScript, mas à medida que a Web se tornava mais interativa, a lógica determinava cada vez mais o conteúdo. O JavaScript ficou a cargo do HTML! É por isso que no React, a lógica de renderização e a marcação vivem juntas no mesmo lugar – os componentes. 

Manter a lógica de renderização e a marcação de um botão juntas garante que eles permaneçam sincronizados entre si em todas as edições. Por outro lado, os detalhes não relacionados, como a marcação do botão e a marcação da barra lateral, são isolados uns dos outros, tornando mais seguro alterar qualquer um deles por conta própria.

<h2>Regras no uso do JSX</h2>

1. Para retornar vários elementos de um componente, é necessário que esses elementos estejam dentro de uma tag, como por exemplo, uma ```<div></div>```. Caso você não queria utilizar uma div, é possível usar apenas ```<></>``` (não aceita propriedade) ou ```<react.fragment>...</react.fragment>``` (aceita propriedade).

2. É preciso fechar todas as tags.

3. Uso de CamelCase.