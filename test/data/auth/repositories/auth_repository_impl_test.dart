import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starter_project/core/error/failures.dart';
import 'package:flutter_starter_project/data/auth/datasources/auth_local_data_source.dart';
import 'package:flutter_starter_project/data/auth/datasources/auth_remote_data_source.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/data/auth/repositories/repository_impl.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  group('AuthRepositoryImpl', () {
    final mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    final mockAuthLocalDataSource = MockAuthLocalDataSource();

    test('test auth repository impl', () async {
      final repository =
          AuthRepositoryImpl(mockAuthRemoteDataSource, mockAuthLocalDataSource);

      const loginBody = LoginBody(username: 'username', password: 'password');

      const loginEntity = LoginEntity(
        data: DataLoginEntity(
          token: 'token',
        ),
        status: 200,
        message: 'message',
      );

      // Arrange - Given
      when(mockAuthRemoteDataSource.requestLogin(any)).thenAnswer(
        (realInvocation) => Future.value(loginEntity),
      );

      // Act - When
      final result = await repository.requestLogin(loginBody);

      // Assert - Then
      expect(result, const Right<dynamic, LoginEntity>(loginEntity));
    });

    test('throw DioError with response', () async {
      final repository =
          AuthRepositoryImpl(mockAuthRemoteDataSource, mockAuthLocalDataSource);

      const loginBody = LoginBody(username: 'username', password: 'password');

      final data = {'message': 'auth failed'};

      final response = Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: 'path'),
        data: data,
      );

      // Arrange - Given
      when(mockAuthRemoteDataSource.requestLogin(any)).thenThrow(
        DioError(
          requestOptions: RequestOptions(path: 'path'),
          response: response,
        ),
      );

      // Act - When
      final result = await repository.requestLogin(loginBody);

      // Assert - Then
      expect(result,
          const Left<Failure, LoginEntity>(ServerFailure('auth failed')));
    });

    test('throw DioError with no response', () async {
      final repository =
          AuthRepositoryImpl(mockAuthRemoteDataSource, mockAuthLocalDataSource);

      const loginBody = LoginBody(username: 'username', password: 'password');

      // Arrange - Given
      when(mockAuthRemoteDataSource.requestLogin(any)).thenThrow(
        DioError(requestOptions: RequestOptions(path: 'path')),
      );

      // Act - When
      final result = await repository.requestLogin(loginBody);

      // Assert - Then
      expect(result, const Left<Failure, LoginEntity>(ServerFailure(errorMsg)));
    });
  });
}
