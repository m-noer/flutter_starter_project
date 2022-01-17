
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/main_staging.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();



  group('end-to-end test', () {
    testWidgets('Testing Login Page', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      //* Login

      final usernameField = find.byKey(const Key('usernameField'));
      final passwordField = find.byKey(const Key('passwordField'));
      final loginBtn = find.byKey(const Key('loginBtn'));

      //Condition 1: Username and password field null
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();

      // Condition 2: Username or password wrong
      await tester.tap(usernameField);
      await tester.enterText(usernameField, 'guru1');
      await tester.tap(passwordField);
      await tester.enterText(passwordField, 'passwor');

      await tester.tap(loginBtn);
      await tester.pumpAndSettle();

      // Condition 3: Login success
      await tester.tap(usernameField);
      await tester.enterText(usernameField, '');
      await tester.enterText(usernameField, 'guru1');
      await tester.tap(passwordField);
      await tester.enterText(passwordField, '');
      await tester.enterText(passwordField, 'password');

      await tester.tap(loginBtn);
      await tester.pumpAndSettle();
    });
  });
}
