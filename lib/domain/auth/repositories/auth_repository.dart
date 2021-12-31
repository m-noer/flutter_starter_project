import 'package:dartz/dartz.dart';
import 'package:flutter_starter_project/core/error/failures.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
}
