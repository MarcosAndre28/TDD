import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/core/usecase/usecase.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UseCaseWithParams<void, CreateUseParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUseParams params) async => _repository.createUser(createdAt: params.createdAt, name: params.name, avatar: params.avatar);
}


class CreateUseParams extends Equatable{
  const CreateUseParams({required this.createdAt, required this.name, required this.avatar});

  const CreateUseParams.empty() : this(createdAt: '_empty.createdAt', name: '_empty.name', avatar: '_empty.avatar');

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}