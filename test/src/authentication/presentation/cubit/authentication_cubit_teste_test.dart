import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/core/errors/failure.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';
import 'package:tdd_tutorial/src/authentication/presentation/cubit/authentication_cubit.dart';

class MockGetUsers extends Mock implements GetUsers {}

class MockCreateUser extends Mock implements CreateUser {}

void main() {
  late MockCreateUser mockCreateUser;
  late MockGetUsers mockGetUsers;
  late AuthenticationCubit cubit;

  const tCreateUserParams = CreateUseParams.empty();
  const tAPIFailure = APIFailure(message: 'API Failure', statusCode: 400);

  setUp(
    () {
      mockCreateUser = MockCreateUser();
      mockGetUsers = MockGetUsers();
      cubit = AuthenticationCubit(
        createUser: mockCreateUser,
        getUsers: mockGetUsers,
      );
      registerFallbackValue(tCreateUserParams);
    },
  );

  tearDown(() => cubit.close());

  test(
    'initial state should be [AuthenticationInitial]',
    () async {
      expect(cubit.state, const AuthenticationInitial());
    },
  );

  group(
    'createUser',
    () {
      blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [CreatingUser, UserCreated] when successful',
        build: () {
          when(() => mockCreateUser(any()))
              .thenAnswer((_) async => const Right(null));
          return cubit;
        },
        act: (cubit) => cubit.createUser(
          createdAt: tCreateUserParams.createdAt,
          name: tCreateUserParams.name,
          avatar: tCreateUserParams.avatar,
        ),
        expect: () => const [
          CreateUserLoadingState(),
          CreateUserSuccessState(),
        ],
        verify: (_) {
          verify(() => mockCreateUser(tCreateUserParams)).called(1);
          verifyNoMoreInteractions(mockCreateUser);
        },
      );

      blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [CreatingUser, AuthenticationError] when unsuccesssfull',
        build: () {
          when(() => mockCreateUser(any()))
              .thenAnswer((_) async => const Left(tAPIFailure));
          return cubit;
        },
        act: (cubit) => cubit.createUser(
          createdAt: tCreateUserParams.createdAt,
          name: tCreateUserParams.name,
          avatar: tCreateUserParams.avatar,
        ),
        expect: () => [
          const CreateUserLoadingState(),
          AuthenticationErrorState(tAPIFailure.errorMessage),
        ],
        verify: (_) {
          verify(() => mockCreateUser(tCreateUserParams)).called(1);
          verifyNoMoreInteractions(mockCreateUser);
        },
      );
    },
  );
  group(
    'getUsers',
    () {
      blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [GettingUsers, UsersLoaded] when successful',
        build: () {
          when(() => mockGetUsers()).thenAnswer((_) async => const Right([]));
          return cubit;
        },
        act: (cubit) => cubit.getUsers(),
        expect: () => const [
          GettingUsersLoadingState(),
          UsersLoadedState([]),
        ],
        verify: (_) {
          verify(() => mockGetUsers()).called(1);
          verifyNoMoreInteractions(mockGetUsers);
        },
      );
      blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [GettingUsers, AuthenticationError] when unsuccesssfull',
        build: () {
          when(() => mockGetUsers())
              .thenAnswer((_) async => const Left(tAPIFailure));
          return cubit;
        },
        act: (cubit) => cubit.getUsers(),
        expect: () => [
          const GettingUsersLoadingState(),
          AuthenticationErrorState(tAPIFailure.errorMessage),
        ],
        verify: (_) {
          verify(() => mockGetUsers()).called(1);
          verifyNoMoreInteractions(mockGetUsers);
        },
      );
    },
  );
}
