## Clean Architecture

A Clean Architecture foi criada por Robert C. Martin e promovida em seu livro Clean Architecture: A
Craftsman’s Guide to Software Structure. Assim como outras filosofias de design de software, a Clean
Architecture tenta fornecer uma metodologia a ser usada na codificação, a fim de facilitar o
desenvolvimento códigos, permitir uma melhor manutenção, atualização e menos dependências.

Um objetivo importante da Clean Architecture é fornecer aos desenvolvedores uma maneira de organizar
o código de forma que encapsule a lógica de negócios, mas mantenha-o separado do mecanismo de
entrega.
<div align="center">
  <img src="https://camo.githubusercontent.com/8dbc172a442d6aef208ff8210a9c697e7af845f18b6a4cad4011ffc2dc8b52bd/68747470733a2f2f692e6962622e636f2f5a4c737277716b2f636c65616e2e6a7067" alt="Descrição da imagem">
</div>
A Clean Architecture não foi o primeiro conceito de design de software que apareceu, ao longo do tempo as arquiteturas de software vêm sendo criadas com um mesmo objetivo de solucionar um princípio de design conhecido como SoC (separation of concerns).

As vantagens de utilizar uma arquitetura em camadas são muitas, porém podemos pontuar algumas:

- Testável. As regras de negócios podem ser testadas sem a interface do usuário, banco de dados,
  servidor ou qualquer outro elemento externo.
- Independente da interface do usuário. A interface do usuário pode mudar facilmente, sem alterar o
  restante do sistema. Uma UI da Web pode ser substituída por uma UI do console, por exemplo, sem
  alterar as regras de negócios.
- Independente de banco de dados. Você pode trocar o Oracle ou SQL Server, por Mongo, BigTable,
  CouchDB ou qualquer outro. Suas regras de negócios não estão vinculadas ao banco de dados.
- Independente de qualquer agente externo. Na verdade, suas regras de negócios simplesmente não
  sabem nada sobre o mundo exterior, não estão ligadas a nenhum Framework.

A separação de camadas poupará o desenvolvedor de muitos problemas futuros com a manutenção do
software, a regra de dependência bem aplicada deixará seu sistema completamente testável. Quando um
framework, um banco de dados, ou uma API se tornar obsoleta a substituição de uma camada não será
uma dor de cabeça, além de garantir a integridade do core do projeto.

## Estrutura do Projeto

| Caminho                    | Descrição                                                                                                                               |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `lib`                      | Pasta raiz onde todos os arquivos Dart do seu projeto Flutter são armazenados.                                                          |
| `├── core`                 | Contém os componentes centrais do seu projeto que são usados em várias partes do seu aplicativo.                                        |
| `│   ├── errors`           | Contém classes que representam erros ou falhas que podem ocorrer em seu aplicativo.                                                     |
| `│   ├── services`         | Contém classes que fornecem serviços para outras partes do seu aplicativo.                                                              |
| `│   ├── utils`            | Contém várias funções utilitárias que são usadas em todo o aplicativo.                                                                  |
| `├── src`                  | Onde o núcleo funcional do aplicativo reside, normalmente dividido em módulos específicos.                                              |
| `│   ├── authentication`   | Módulo funcional, dedicado à autenticação dos usuários no aplicativo.                                                                   |
| `│   ├── data`             | Contém o código que lida com a obtenção, transformação e armazenamento de dados.                                                        |
| `│   │   ├── datasources`  | Contém classes que buscam dados de várias fontes, como uma API ou um banco de dados.                                                    |
| `│   │   ├── models`       | Contém classes que representam os dados que seu aplicativo usa.                                                                         |
| `│   │   └── repositories`    | Abstrai a origem dos dados. Repositórios são usados para buscar dados das fontes de dados.                                              |
| `│   ├── domain`           | Contém as regras de negócio do seu aplicativo.                                                                                          |
| `│   │   ├── entities`     | Contém classes que representam os objetos centrais do seu negócio.                                                                      |
| `│   │   ├── repositories` | Contém interfaces que definem os métodos que serão usados para acessar os dados.                                                        |
| `│   │   └── usecases`     | Contém classes que contêm a lógica de negócios. Cada Use Case representa uma ação que o usuário pode fazer na aplicação.                |
| `│   └── presentation`     | Responsável por tudo relacionado à interface do usuário. Lida com a exibição dos dados ao usuário e a manipulação das ações do usuário. |
| `└── main.dart`            | Ponto de entrada do seu aplicativo. Responsável por iniciar o aplicativo e conectar todas as partes juntas.                             |

## Camadas da Clean Architecture

A Clean Architecture é composta por várias camadas, cada uma com sua própria responsabilidade:

1. **Data**: Esta camada lida com todos os detalhes de persistência e rede. Ela é dividida em:
    - **DataSources**: São responsáveis por buscar dados de fontes externas, como APIs ou bancos de
      dados.
    - **Models**: São representações dos dados que serão usados na aplicação.
    - **Repositories**: São a ponte entre os Use Cases (na camada Domain) e os DataSources. Eles
      buscam dados dos DataSources e os transformam em Entities para serem usados pelos Use Cases.

2. **Domain**: Esta é a camada central e contém as regras de negócio da aplicação. Ela é
   independente de qualquer detalhe específico de aplicação ou infraestrutura. Ela é composta por:
    - **Entities**: São os objetos centrais do seu negócio.
    - **Repositories**: São interfaces que definem os métodos que serão usados para acessar os
      dados.
    - **UseCases**: São classes que contêm a lógica de negócios. Cada Use Case representa uma ação
      que o usuário pode fazer na aplicação.

3. **Presentation**: Esta camada é responsável por tudo relacionado à interface do usuário. Ela lida
   com a exibição dos dados ao usuário e a manipulação das ações do usuário.
