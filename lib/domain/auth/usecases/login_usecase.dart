import 'package:dartz/dartz.dart';
import 'package:flutter_starter_project/core/error/failures.dart';
import 'package:flutter_starter_project/core/usecases/usecase.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';
import 'package:flutter_starter_project/domain/auth/repositories/repository.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.requestLogin(params);
  }
}
