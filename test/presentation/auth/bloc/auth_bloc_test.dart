import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/core/error/failures.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';
import 'package:flutter_starter_project/domain/auth/usecases/usecase.dart';
import 'package:flutter_starter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([LoginUsecase])
Future<void> main() async {
  late AuthBloc bloc;
  late MockLoginUsecase mockLoginUsecase;
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUp(() async {
    await init();

    mockLoginUsecase = MockLoginUsecase();
    bloc = AuthBloc(mockLoginUsecase);
  });

  tearDown(() async {
    await sl.reset();
  });

  group('Testing AuthBloc', () {
    const loginBody = LoginBody(username: 'username', password: 'password');

    const loginEntity = LoginEntity(
      data: DataLoginEntity(
        token: 'token',
      ),
      status: 200,
      message: 'message',
    );
    test('initial state', () {
      // Assert
      expect(bloc.state, AuthInitial());
    });

    test('description', () {
      const loginEvent = LoginEvent(loginBody);
      // Assert
      expect(loginEvent, isA<AuthEvent>());
    });

    test('should get data from usecase', () async {
      // Arrange
      when(mockLoginUsecase.call(any)).thenAnswer(
          (realInvocation) => Future.value(const Right(loginEntity)));

      // Act
      bloc.add(const LoginEvent(loginBody));
      await untilCalled(mockLoginUsecase.call(any));

      // Assert
      verify(mockLoginUsecase.call(loginBody));
    });

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthSuccess]',
      build: () {
        when(mockLoginUsecase.call(any)).thenAnswer(
            (realInvocation) => Future.value(const Right(loginEntity)));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(loginBody)),
      expect: () => [
        AuthLoading(),
        AuthSuccess(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthFailure]',
      build: () {
        when(mockLoginUsecase.call(any)).thenAnswer((realInvocation) =>
            Future.value(const Left(ServerFailure('server fail'))));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoginEvent(loginBody)),
      expect: () => [
        AuthLoading(),
        const AuthFailure(message: 'server fail'),
      ],
    );
  });
}
