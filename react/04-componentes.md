<h1 align="center"> Componentes</h1>

A componentização no React é uma das grandes vantagens, pois, podemos “quebrar” o código em componentes que trazem a possibilidade de repetição, com informações diferentes (escalabilidade) e manutenções mais fáceis e rápidas.
Um componente, nada mais é do que uma função que retorna HTML (ou JSX – Javascript + XML)








Lembrando que precisamos exportar o componente para que seja possível utilizá-lo em outra parte do código.







Formas de exportar um componente:
- export default (nome do componente) – que traz a possibilidade de mudar o nome do componente no momento da importação
- named exports = export function… - que precisamos importar com as chaves: { nome do componente } e nos força a importar com o mesmo nome do componente que foi exportado, evitando maiores confusões.
