import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required CreateUser createUser,
    required GetUsers getUsers,
  })  : _createUser = createUser,
        _getUsers = getUsers,
        super(const AuthenticationInitial());

  final CreateUser _createUser;
  final GetUsers _getUsers;

  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    emit(const CreateUserLoadingState());

    final result = await _createUser(
      CreateUseParams(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      ),
    );

    result.fold(
      (failure) => emit(AuthenticationErrorState(failure.errorMessage)),
      (_) => emit(const CreateUserSuccessState()),
    );
  }

  Future<void> getUsers() async {
    emit(const GettingUsersLoadingState());

    final result = await _getUsers();

    result.fold(
      (failure) => emit(AuthenticationErrorState(failure.errorMessage)),
      (users) => emit(UsersLoadedState(users)),
    );
  }
}
