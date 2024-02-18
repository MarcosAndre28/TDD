// Do que a classe depende
// Resposta -- AuthenticationRepository
// Como podemos criar uma versão falsa da dependência
// Resposta - Usar Mocktail
// Como controlamos o que suas dependências fazem
// Resposta - Usando o Mocktail`s APIs

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser useCase;
  late AuthenticationRepository repository;

  setUpAll(
    () {
      repository = MockAuthRepo();
      useCase = CreateUser(repository);
    },
  );

  const params = CreateUseParams.empty();

  test(
    'should call the [AuthRepo.createUser]',
    () async {
      // Arranjo
      when(
              () => repository.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
          ))
          .thenAnswer((_) async => const Right(null));

      // Agir
      final result = await useCase(params);

      // Ativo
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
            createdAt: params.createdAt,
            name: params.name,
            avatar: params.avatar),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
