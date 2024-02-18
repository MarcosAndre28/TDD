import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers useCase;
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUsers(repository);
  });

  const tReponse = [User.empty()];

  test('should call the [AuthRepo.getUsers] and return [List<User>]', () async {
    // Arrange
    when(() => repository.getUsers()).thenAnswer((_) async => const Right(tReponse));
    // Act
    // Assert
    final result = await useCase();
    expect(result, equals(const Right<dynamic, List<User>>(tReponse)));
    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}