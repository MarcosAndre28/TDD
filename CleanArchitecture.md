## Clean Architecture

<div align="center">
  <img src="https://camo.githubusercontent.com/8dbc172a442d6aef208ff8210a9c697e7af845f18b6a4cad4011ffc2dc8b52bd/68747470733a2f2f692e6962622e636f2f5a4c737277716b2f636c65616e2e6a7067" alt="Descrição da imagem">
</div>
A Clean Architecture, ou "Arquitetura Limpa", é um modelo de design de software proposto por Robert C. Martin. Ela se concentra na separação de preocupações e na organização do código em camadas com responsabilidades bem definidas.

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

## Benefícios da Clean Architecture

A Clean Architecture traz vários benefícios, incluindo:

- **Independência de Framework**: A arquitetura não depende de bibliotecas ou frameworks
  específicos, permitindo que esses detalhes sejam facilmente alterados.

- **Testabilidade**: Como as regras de negócio são separadas dos detalhes de infraestrutura, elas
  podem ser testadas independentemente.

- **Independência de UI**: A UI pode ser facilmente alterada sem afetar o restante do sistema.

- **Independência de Banco de Dados**: O banco de dados e a persistência de dados podem ser
  alterados sem afetar as regras de negócio.

- **Independência de qualquer agente externo**: As regras de negócio da aplicação são independentes
  de qualquer detalhe externo, como serviços de rede ou dispositivos externos.