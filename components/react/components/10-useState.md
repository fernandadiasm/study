<h1 align="center"> UseState </h1>

**Qual a diferença entre controlar uma variável com o useState e criar e atribuir normalmente uma let?**

Sempre que queremos que o componente reaja a alguma alteração no valor de uma variável e se renderize novamente, precisamos indicar isto utilizando o useState. Do contrário, o valor vai ser alterado mas o DOM não será atualizado.