import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toJson', () {
    const loginBody = LoginBody(username: 'user', password: 'password');

    final fakeData = <String, dynamic>{
      'username': 'user',
      'password': 'password',
    };

    test('should return a valid model', () {
      // Act
      final result = loginBody.toJson();

      // Assert
      expect(result, fakeData);
    });
  });
}
