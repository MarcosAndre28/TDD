part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class CreateUserLoadingState extends AuthenticationState {
  const CreateUserLoadingState();
}

class CreateUserSuccessState extends AuthenticationState {
  const CreateUserSuccessState();
}

class GettingUsersLoadingState extends AuthenticationState {
  const GettingUsersLoadingState();
}

class UsersLoadedState extends AuthenticationState {
  const UsersLoadedState(this.users);

  final List<User> users;

  @override
  List<Object> get props => users.map((user) => user.id).toList();
}

class AuthenticationErrorState extends AuthenticationState {
  const AuthenticationErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
