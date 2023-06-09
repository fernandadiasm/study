<h1 align="center"> Stateless VS Statefull </h1>

React tem duas abordagens diferentes para lidar com inputs de formulários.

Um elemento de input de formulário cujo valor é controlado pelo React é chamado de **componente controlado (statefull em inglês)**. Quando o usuário insere dados em um componente controlado, o evento que manipula essa alteração é disparado e o seu código decide se o input é válido (ou seja, renderizado com o valor atualizado). Se você não re-renderizar o elemento de formulário, permanecerá inalterado.

Um **componente não controlado (stateless em inglês)** funciona como um elemento de formulário fora do React. Quando um usuário insere dados em um campo de formulário (um input box, dropbox, etc), a informação atualizada é refletida sem necessidade do React fazer nada. No entanto, isso também significa que você não pode forçar o campo a ter um certo valor.