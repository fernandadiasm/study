<h1 align="center"> Propriedades</h1>

Propriedades são informações que podemos passar para os componentes. É a mesma coisa que atributos em tags html. No nosso exemplo, o componente "post" receberá um author e um conteúdo:

Como passamos propriedades para o componente, podemos acessar essas propriedades (props) como parâmetros da função Post que contém as propriedades passadas: props: { author: “”, content: “” }

Agora, pra mostrar essas informações, podemos chamar as props na montagem (return) do componente:
Assim, temos um componente construído apenas uma vez, mas repetível mudando as informações e detalhes de cada post, mas mantendo uma estrutura padrão

