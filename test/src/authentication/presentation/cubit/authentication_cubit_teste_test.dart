import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';
import 'package:tdd_tutorial/src/authentication/presentation/cubit/authentication_cubit.dart';

class MockGetUsers extends Mock implements GetUsers {}

class MockCreateUser extends Mock implements CreateUser {}

void main() {
  late MockCreateUser mockCreateUser;
  late MockGetUsers mockGetUsers;
  late AuthenticationCubit cubit;

  setUp(
    () {
      mockCreateUser = MockCreateUser();
      mockGetUsers = MockGetUsers();
      cubit = AuthenticationCubit(
        createUser: mockCreateUser,
        getUsers: mockGetUsers,
      );
    },
  );

  tearDown(() => cubit.close());

  test(
    'initial state should be [AuthenticationInitial]',
    () async {
      expect(cubit.state, const AuthenticationInitial());
    },
  );
}
