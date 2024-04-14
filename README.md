## Introdução

Esse projeto foi construido com fodo de estudo e aprendizado, com o objetivo de aplicar os conceitos
de Clean Architecture e TDD. O projeto consiste em um aplicativo de cadastro de usuários, bem
simples como foco nos ponto de Clean Architecture e Test-Driven Development (TDD).

## Clean Architecture

Para acessar o conteúdo completo sobre Clean Architecture,
clique [aqui](https://github.com/MarcosAndre28/tdd_tutorial/blob/master/CleanArchitecture.md).

## TDD

Para acessar o conteúdo completo sobre TDD,
clique [aqui](https://github.com/MarcosAndre28/tdd_tutorial/blob/master/TDD.md).

## Pacotes

- Dartz
- Equatable
- Mocktail
- Flutter Bloc
- Bloc
- Get
- Http
- Get_it
- Very Good Analysis
- Bloc Test

## Estrutura de Arquivo

```
lib
├── core
│   ├── errors
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── services
│   │   ├── injection_container.dart
│   ├── usecase
│   │   └── usecase.dart
│   ├── utils
│   │   ├── constants.dart
│   │   ├── typedef.dart
├── src
│   ├── authentication
│   ├── data
│   │   ├── datasources
│   │   │   └── authentication_remote_data_source.dar
│   │   ├── model
│   │   │   └── user_model.dart
│   │   └── repositories
│   │       └── authentication_repository_impl.dart
│   ├── domain
│   │   ├── entities
│   │   │   └── user.dart
│   │   ├── repositories
│   │   │   └── authentication_repository.dart
│   │   └── usecases
│   │       ├── create_user.dart
│   │       ├── get_users.dart
│   └── presentation
│       ├── bloc
│       │       ├── bloc.dart
│       │       ├── authentication_bloc.dart
│       │       ├── authentication_event.dart
│       │       └── authentication_state.dart
│       ├── cubit
│           ├── authentication_cubit.dart
│           ├── authentication_state.dart
│       ├── views
│           └── home_screen.dart
│       ├── widgets
│           ├── add_user_dialog.dart
│           ├── loading_column.dart
├── main.dart
```

## Estrutura de Arquivos para Testes

```
test
 ├── fixtures
 │   ├── fixture_reader.dart
 │   ├── user.json
 └── src
     ├── authentication
     │   ├── data
     │   │   ├── datasources
     │   │   │   └── authentication_remote_data_source_test_test.dart
     │   │   └── models
     │   │       └── user_model_test_test.dart
     │   │   └── repositories
     │   │       └── authentication_repository_impl_test.dart
     │   ├── domain
     │   │   └── usecases
     │   │       ├── authentication_repository.mock.dart
     │   │       ├── create_user_test_test.dart
     │   │       ├── get_users_test_test.dart
     │   └── presentation
     │       └── cubit
     │           ├── authentication_cubit_teste_test.dart
```