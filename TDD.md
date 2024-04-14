## TDD

<div align="center">
  <img src="https://res.cloudinary.com/practicaldev/image/fetch/s--b9FjzOmj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_66%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/5ryscmqtvkgmbh6ihg3k.gif" alt="Descrição da imagem">
</div>

TDD significa Desenvolvimento Orientado a Testes. É uma técnica de desenvolvimento de software que
consiste em escrever testes antes de escrever o código de produção. O ciclo de desenvolvimento do
TDD é composto por três etapas: vermelho, verde e azul.

O TDD consiste em três etapas Red, Green e Refactor. Que funciona da seguinte maneira:

- **Red (Vermelho)**: Nesta etapa, você escreve um teste para a nova funcionalidade que deseja
  implementar. Este teste deve falhar quando executado, porque a funcionalidade ainda não foi
  implementada.
- **Green (Verde)**: Nesta etapa, você escreve o código de produção que faz o teste passar. Este
  código deve ser o mais simples possível para fazer o teste passar.
- **Refactor (Refatoração)**: Nesta etapa, você refatora o código de produção para melhorar a
  qualidade do código. Você pode adicionar novos testes para garantir que o código refatorado
  continue funcionando corretamente.

Esse ciclo pode se repetir quantas vezes o desenvolvedor julgar necessário e a cada nova
implementação é interessante que todos os
testes que já estao em funcionamento sejam executados, pois assim é possivel validar que todos os
testes continuam funcionando e que a nova implementação
não impactou nas funcionalidades já existentes.

### Os principais benefícios do TDD são:

Existem diversos benefícios ao escrevermos os testes antes mesmo de realizar uma implementação. Um
dos benefícios é que, como você vai saber o que o código precisa fazer antecipadamente, você acaba
evitando de escrever código demasiadamente complexo ou que não siga os pré-requisitos de negócio.

- Maior cobertura de testes unitários.
- Testes são executados com maior frequência.
- Código de produção é mais simples e limpo.