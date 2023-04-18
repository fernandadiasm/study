<p align="center">
  <img alt="imagem da logo do mongodb" src="../../public/logo-mongodb.jpg" width="40%">
</p>

<h2 align="center"> O que é o MongoDB? </h2>

O MongoDB é um banco de dados NoSQL orientado a documentos, que armazena dados em formato BSON (Binary JSON). Aqui estão algumas informações importantes sobre o MongoDB:

- Esquema flexível: o MongoDB é um banco de dados NoSQL, o que significa que ele não possui um esquema rígido como os bancos de dados relacionais. Isso permite que os desenvolvedores armazenem dados de forma flexível, adicionando e removendo campos do documento conforme necessário.
- Escalabilidade horizontal: o MongoDB é altamente escalável, permitindo que seja facilmente escalonado horizontalmente para atender a demandas crescentes de tráfego e armazenamento de dados. Isso é possível porque o MongoDB utiliza o conceito de replica sets e sharding para distribuir e replicar dados entre múltiplos servidores.
- Consultas poderosas: o MongoDB fornece consultas poderosas e flexíveis, que suportam consultas ad-hoc, consultas com agregações e consultas geoespaciais, entre outras. Isso permite que os desenvolvedores realizem pesquisas complexas e obtenham resultados precisos.
- Índices eficientes: o MongoDB possui um sistema de índices eficiente que permite que os desenvolvedores acessem dados de forma rápida e eficiente. O MongoDB suporta vários tipos de índices, incluindo índices compostos e índices geoespaciais.
- Alta disponibilidade: o MongoDB suporta alta disponibilidade por meio de replica sets, que são conjuntos de instâncias de bancos de dados que armazenam cópias dos mesmos dados. Se um nó falhar, outro nó pode assumir o seu lugar, garantindo que os dados permaneçam disponíveis.
- Comunidade ativa: o MongoDB possui uma comunidade ativa de desenvolvedores e usuários, com muitos recursos disponíveis, como documentação abrangente, fóruns de suporte e bibliotecas de clientes para várias linguagens de programação.

<h2 align="center"> BSON x JSON </h2>
BSON e JSON são dois formatos de dados que o MongoDB suporta. Aqui está a diferença entre eles:

- JSON (JavaScript Object Notation) é um formato de dados popular usado para troca de dados entre aplicativos e sistemas. Ele é baseado em uma estrutura de chave-valor, em que os dados são organizados em objetos e arrays. O MongoDB suporta o uso de documentos JSON como formato nativo de armazenamento de dados.
- BSON (Binary JSON) é uma extensão do formato JSON que adiciona suporte para tipos de dados binários e outros recursos avançados, como arrays e subdocumentos ilimitados, além de suporte para data e hora, geolocalização e outros tipos de dados específicos do MongoDB. O BSON é mais eficiente do que o JSON em termos de tamanho de dados e velocidade de processamento, pois é compactado em bytes e pode ser facilmente serializado e desserializado.

No MongoDB, os dados geralmente são armazenados em BSON, pois isso permite que o banco de dados use recursos de forma mais eficiente, especialmente para documentos grandes ou complexos. No entanto, quando os dados são recuperados do MongoDB, eles geralmente são convertidos em JSON para que possam ser processados por aplicativos e sistemas que não suportam BSON.

<details>
    <summary>O MongoDB suporta diversos tipos de dados.</summary>
    O MongoDB suporta diversos tipos de dados, incluindo:

- String: Representa texto.
- Number: Pode ser utilizado para representar números inteiros ou de ponto flutuante.
- Boolean: Representa valores booleanos (verdadeiro/falso).
- Date: Representa datas e horários.
- ObjectId: É um identificador único de um documento no MongoDB.
- Array: Representa uma lista de valores.
- Object: Representa um documento aninhado dentro de outro documento.
- Null: Representa um valor nulo.
- Undefined: Representa um valor não definido.
- BinData: Representa dados binários.
- Regular expression: Representa uma expressão regular.

Além disso, o MongoDB oferece tipos de dados geoespaciais, como `Point`, `LineString` e `Polygon`, que permitem armazenar e consultar dados com base em sua localização geográfica.
</details>

<br>
<h2 align="center"> Replicação </h2>
A replicação no MongoDB é o processo de sincronização de dados entre vários servidores de bancos de dados para garantir a disponibilidade contínua dos dados em caso de falhas em um dos servidores. Ele envolve a cópia dos dados de um servidor primário para um ou mais servidores secundários, criando assim uma réplica do conjunto de dados original.

A replicação no MongoDB é implementada usando um conjunto de réplicas, que é composto por um ou mais servidores MongoDB que mantêm cópias idênticas dos dados do banco de dados. O conjunto de réplicas tem um servidor primário que aceita todas as gravações e atualizações dos dados e replica essas operações para os servidores secundários. Se o servidor primário falhar, um dos servidores secundários é eleito como novo primário e assume as operações de gravação e atualização dos dados.

A replicação no MongoDB oferece vários benefícios, incluindo:

- Alta disponibilidade dos dados: se um servidor falhar, outro servidor pode assumir as operações de gravação e atualização dos dados.
- Escalabilidade de leitura: os servidores secundários podem ser usados para ler consultas, reduzindo a carga no servidor primário.
- Backup e recuperação de dados: os servidores secundários podem ser usados para fazer backups dos dados do banco de dados e para recuperar dados em caso de perda de dados no servidor primário.

Para configurar a replicação no MongoDB, é necessário configurar um conjunto de réplicas e adicionar os servidores ao conjunto. O MongoDB oferece vários métodos para configurar o conjunto de réplicas, incluindo a linha de comando e a interface do usuário do MongoDB. Após a configuração do conjunto de réplicas, é possível monitorar o status da replicação usando o comando **`rs.status()`**.

Uma vez configurada a replicação, você pode usar o método de leitura secundária do MongoDB para ler dados dos servidores secundários. O método de leitura secundária é usado para fazer consultas em um conjunto de réplicas em que as consultas podem ser distribuídas entre vários servidores secundários para melhorar a escalabilidade de leitura.

<br>

<h2 align="center"> Shard </h2>

Shard no MongoDB é um conceito relacionado à capacidade de distribuir e dimensionar o armazenamento de dados horizontalmente. O processo de shard envolve a divisão de dados em partes menores chamadas shards e a distribuição desses shards em vários servidores ou réplicas de um cluster. Cada shard é uma parte do conjunto de dados e contém um subconjunto dos documentos armazenados no MongoDB.

O processo de shard é importante para permitir que um cluster do MongoDB possa lidar com grandes volumes de dados, aumentar o desempenho do banco de dados e melhorar a disponibilidade e a escalabilidade do sistema. Com o shard, o MongoDB pode ser usado para criar aplicativos escaláveis e distribuídos em diferentes servidores, permitindo que eles possam lidar com grandes quantidades de dados sem comprometer o desempenho ou a confiabilidade. O processo de shard é gerenciado pelo MongoDB e requer a configuração de um conjunto de servidores dedicados, chamados shards, que trabalham em conjunto para armazenar e processar os dados do banco de dados.

<br>
<h2 align="center"> Comandos </h2>

<details>
    <summary>Criação de um banco de dados</summary>
    Para visualizar os documentos de uma coleção no MongoDB, você pode usar o método find().

`find()`: Este método é usado para buscar documentos em uma coleção que correspondam a um critério de pesquisa. O método `find()` retorna um cursor que pode ser usado para percorrer os documentos encontrados.

A sintaxe básica para `find()` é a seguinte:

```
db.<nome_da_coleção>.find()
```

Onde `<nome_da_coleção>` é o nome da coleção em que você deseja buscar os documentos. Exemplo de uso do método `find()`:

```
db.usuarios.find()
```

Este comando buscará todos os documentos da coleção `usuarios` e retornará um cursor que pode ser usado para percorrer os documentos.

Você também pode passar um objeto JSON como argumento para `find()` para especificar um critério de pesquisa. O objeto JSON deve conter um ou mais pares chave-valor que correspondam aos campos e valores que você deseja pesquisar. Exemplo de uso do método `find()` com um critério de pesquisa:

```
db.produtos.find({ marca: "Samsung" })
```

Este comando buscará todos os documentos da coleção `produtos` em que o campo `marca` seja igual a `"Samsung"` e retornará um cursor que pode ser usado para percorrer os documentos encontrados.

Além disso, é possível usar métodos de modificação e projeção para refinar a busca e retornar apenas os campos desejados. Exemplo de uso do método `find()` com modificação e projeção:

```
db.produtos.find(
   { preco: { $gt: 2000 } },
   { nome: 1, marca: 1, preco: 1 }
)
```

Este comando buscará todos os documentos da coleção `produtos` em que o campo `preco` seja maior que `2000` e retornará apenas os campos `nome`, `marca` e `preco` dos documentos encontrados. O campo `_id` também será retornado, a menos que seja especificado explicitamente para não ser retornado (por exemplo, `{ _id: 0, nome: 1, marca: 1, preco: 1 }`).
</details>


<details>
    <summary>Criação de uma collection</summary>
    Para criar uma coleção no MongoDB, siga os seguintes passos:

1. Inicie o cliente do MongoDB usando o comando **`mongo`** no terminal ou prompt de comando.
2. Selecione o banco de dados em que você deseja criar a coleção usando o comando **`use <nome_do_banco_de_dados>`**.
3. Use o comando **`db.createCollection("<nome_da_coleção>")`** para criar uma nova coleção. Substitua **`<nome_da_coleção>`** pelo nome que você deseja dar à coleção.
4. Verifique se a coleção foi criada corretamente usando o comando **`show collections`**. Isso exibirá todas as coleções no banco de dados atual, incluindo a nova coleção que você acabou de criar.

Você também pode criar uma coleção ao inserir o primeiro documento nela. Se a coleção especificada ainda não existir, o MongoDB criará a coleção automaticamente quando você inserir o primeiro documento.

Lembre-se de que, no MongoDB, as coleções são criadas dinamicamente. Isso significa que você não precisa criar explicitamente uma coleção antes de começar a usá-la. No entanto, é uma boa prática criar as coleções explicitamente para que você possa gerenciar e manter seus bancos de dados de forma mais organizada.
</details>


<details>
    <summary>Exclusão de uma collection e banco de dados</summary>
    Para excluir uma coleção ou um banco de dados no MongoDB, siga os seguintes passos:

Excluir uma coleção:

1. Inicie o cliente do MongoDB usando o comando **`mongo`** no terminal ou prompt de comando.
2. Selecione o banco de dados em que a coleção que você deseja excluir está localizada usando o comando **`use <nome_do_banco_de_dados>`**.
3. Use o comando **`db.<nome_da_coleção>.drop()`** para excluir a coleção. Substitua **`<nome_da_coleção>`** pelo nome da coleção que você deseja excluir.
4. Verifique se a coleção foi excluída corretamente usando o comando **`show collections`**. A coleção que você excluiu não deve mais aparecer na lista.

Excluir um banco de dados:

1. Inicie o cliente do MongoDB usando o comando **`mongo`** no terminal ou prompt de comando.
2. Use o comando **`show dbs`** para exibir todos os bancos de dados existentes no servidor.
3. Selecione o banco de dados que você deseja excluir usando o comando **`use <nome_do_banco_de_dados>`**.
4. Use o comando **`db.dropDatabase()`** para excluir o banco de dados atualmente selecionado.
5. Verifique se o banco de dados foi excluído corretamente usando o comando **`show dbs`**. O banco de dados que você excluiu não deve mais aparecer na lista.

Tenha cuidado ao excluir bancos de dados ou coleções, pois essa ação é irreversível e todos os dados armazenados nelas serão perdidos permanentemente. Verifique se você selecionou o banco de dados ou coleção correta antes de executar o comando de exclusão.
</details>


<details>
    <summary>Renomear uma collection </summary>
    Para renomear uma coleção no MongoDB, siga os seguintes passos:

1. Inicie o cliente do MongoDB usando o comando **`mongo`** no terminal ou prompt de comando.
2. Selecione o banco de dados em que a coleção que você deseja renomear está localizada usando o comando **`use <nome_do_banco_de_dados>`**.
3. Use o comando **`db.<nome_da_coleção>.renameCollection("<novo_nome>")`** para renomear a coleção. Substitua **`<nome_da_coleção>`** pelo nome da coleção que você deseja renomear e **`<novo_nome>`** pelo novo nome que você deseja dar à coleção.
4. Verifique se a coleção foi renomeada corretamente usando o comando **`show collections`**. O novo nome da coleção deve aparecer na lista.

Tenha em mente que, ao renomear uma coleção, você não estará criando uma nova coleção. Em vez disso, o MongoDB renomeará a coleção existente, mantendo todos os dados, índices e opções da coleção original. Isso significa que você não precisará recriar índices ou atualizar as referências à coleção em seu código ou consultas.

Também é importante lembrar que você não pode renomear uma coleção enquanto estiver executando operações de gravação ou leitura nela. Portanto, certifique-se de que não haja nenhum processo em execução na coleção antes de renomeá-la.
</details>


<details>
    <summary>Criação de documentos</summary>
    Para criar um documento em uma coleção no MongoDB, você pode usar o método insertOne() ou insertMany().

**`insertOne()`**: Este método é usado para inserir um único documento em uma coleção. O documento é representado como um objeto JSON.

A sintaxe para **`insertOne()`**é a seguinte:
```jsx
db.<nome_da_coleção>.insertOne(
<documento>
)
```

Onde **`<nome_da_coleção>`** é o nome da coleção em que você deseja inserir o documento e **`<documento>`** é o objeto JSON que representa o documento que você deseja inserir.

Exemplo de uso do método **`insertOne()`**:
```jsx
db.usuarios.insertOne(
{ nome: "Maria", sobrenome: "Silva", idade: 30 }
)
```
**`insertMany()`**: Este método é usado para inserir vários documentos em uma coleção. Os documentos são representados como um array de objetos JSON.

A sintaxe para **`insertMany()`** é a seguinte:

```jsx
db.<nome_da_coleção>.insertMany(
[
<documento1>,
<documento2>,
...,
<documentoN>
]
)
```

Onde **`<nome_da_coleção>`** é o nome da coleção em que você deseja inserir os documentos e **`<documento1>`**, **`<documento2>`**, ..., **`<documentoN>`** são os objetos JSON que representam os documentos que você deseja inserir.

Exemplo de uso do método **`insertMany()`**:

```jsx
db.produtos.insertMany([
{ nome: "Smartphone", marca: "Samsung", preco: 2000 },
{ nome: "Notebook", marca: "Dell", preco: 4000 },
{ nome: "Tablet", marca: "Apple", preco: 3000 }
])
```

Lembre-se de que, ao criar documentos no MongoDB, você não precisa definir previamente um esquema para a coleção. O MongoDB é um banco de dados NoSQL, o que significa que os documentos podem ter diferentes campos e estruturas.

</details>


<details>
    <summary>Visualizar documentos</summary>
    Para criar um banco de dados MongoDB, você precisa seguir os seguintes passos:

1. Inicie o cliente do MongoDB usando o comando **`mongo`** no terminal ou prompt de comando.
2. Selecione um banco de dados existente ou crie um novo usando o comando **`use <nome_do_banco_de_dados>`**. Se o banco de dados ainda não existir, ele será criado automaticamente assim que você inserir o primeiro documento nele.
3. Insira um documento no banco de dados usando o comando **`db.<nome_da_coleção>.insertOne({<campo>:<valor>})`**. Substitua **`<nome_da_coleção>`** pelo nome da coleção em que você deseja inserir o documento, e **`<campo>`** e **`<valor>`** pelos campos e valores que você deseja adicionar ao documento.
4. Confirme se o documento foi inserido corretamente usando o comando **`db.<nome_da_coleção>.find()`**. Isso exibirá todos os documentos na coleção especificada.
5. Repita os passos 3 e 4 para inserir e verificar mais documentos, se necessário.
6. Se você quiser excluir o banco de dados inteiro, use o comando **`db.dropDatabase()`**.

Lembre-se de que, por padrão, o MongoDB cria um banco de dados quando você insere o primeiro documento nele. No entanto, é possível criar explicitamente um banco de dados usando o comando **`use <nome_do_banco_de_dados>`**. Também é importante escolher nomes significativos e descritivos para seus bancos de dados e coleções para facilitar o gerenciamento e a manutenção posterior.
</details>

