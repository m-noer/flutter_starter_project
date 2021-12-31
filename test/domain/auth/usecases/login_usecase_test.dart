import 'package:dartz/dartz.dart';
import 'package:flutter_starter_project/core/error/failures.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';
import 'package:flutter_starter_project/domain/auth/repositories/repository.dart';
import 'package:flutter_starter_project/domain/auth/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  group('Login Usecase', () {
    final mockAuthRepository = MockAuthRepository();

    const loginBody = LoginBody(username: 'username', password: 'password');

    const loginEntity = LoginEntity(
      data: DataLoginEntity(
        token: 'token',
      ),
      status: 200,
      message: 'message',
    );

    final usecase = LoginUsecase(mockAuthRepository);

    test('should get loginEntity from repository', () async {
      // arrange
      when(mockAuthRepository.requestLogin(any)).thenAnswer(
          (realInvocation) => Future.value(const Right(loginEntity)));

      // act
      final result = await usecase.call(loginBody);

      //assert
      expect(result, const Right<dynamic, LoginEntity>(loginEntity));
    });

    test('should fail', () async {
      // arrange
      when(mockAuthRepository.requestLogin(any)).thenAnswer((realInvocation) =>
          Future.value(const Left(ServerFailure('server fail'))));

      // act
      final result = await usecase.call(loginBody);

      //assert
      expect(
          result, const Left<Failure, dynamic>(ServerFailure('server fail')));
    });
  });
}
