import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/domain/auth/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const loginModel = LoginModel(
    data: DataLoginModel(
      token: 'token',
    ),
    status: 200,
    message: 'ok',
  );

  final fakeData = {
    'status': 200,
    'message': 'ok',
    'data': {'token': 'token'}
  };

  test('should be a subclass of LoginEntity', () {
    // Assert
    expect(loginModel, isA<LoginEntity>());
  });

  group('fromJson', () {
    test('should return a valid model', () {
      // Arrange
      final Map<String, dynamic> jsonMap = fakeData;

      // Act
      final result = LoginModel.fromJson(jsonMap);

      // Assert
      expect(result, loginModel);
    });
  });
}
