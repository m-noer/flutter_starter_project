import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_starter_project/main_staging.dart'
    as app;
import 'package:flutter_starter_project/presentation/auth/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpForSeconds(WidgetTester tester, int seconds) async {
    var timerDone = false;
    Timer(Duration(seconds: seconds), () => timerDone = true);
    while (timerDone != true) {
      await tester.pump();
    }
  }

  group('end-to-end test', () {
    app.main();
    testWidgets('Testing OnBoardingPage', (WidgetTester tester) async {
      final onBoardNext = find.byIcon(Icons.arrow_forward);
      final onBoardSkip = find.byKey(const Key('onBoardSkip'));

      // await tester.pumpWidget(App());

      await pumpForSeconds(tester, 2);

      await tester.tap(onBoardNext);
      await pumpForSeconds(tester, 2);
      await tester.tap(onBoardNext);
      await pumpForSeconds(tester, 2);

      //* Go to login page
      await tester.tap(onBoardSkip);
      await pumpForSeconds(tester, 2);

      expect(find.byType(LoginPage), findsOneWidget);

      //* Login

      final usernameField = find.byKey(const Key('usernameField'));
      final passwordField = find.byKey(const Key('passwordField'));
      final loginBtn = find.byKey(const Key('loginBtn'));

      // Condition 1: Username and password field null
      await tester.tap(loginBtn);
      await pumpForSeconds(tester, 2);

      expect(find.text('Please enter the username'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);

      // Condition 2: Username or password wrong
      await tester.tap(usernameField);
      await tester.enterText(usernameField, 'guru1');
      await tester.tap(passwordField);
      await tester.enterText(passwordField, 'passwor');

      await tester.tap(loginBtn);
      await pumpForSeconds(tester, 1);

      // Condition 3: Login success
      await tester.tap(usernameField);
      await tester.enterText(usernameField, 'guru1');
      await tester.tap(passwordField);
      await tester.enterText(passwordField, 'password');

      await tester.tap(loginBtn);
      await pumpForSeconds(tester, 4);

      // expect(find.byType(DashboardPage), findsOneWidget);
    });

    // testWidgets('Test Login Page', (tester) async {
    //   //* Login

    //   final usernameField = find.byKey(const Key('usernameField'));
    //   final passwordField = find.byKey(const Key('passwordField'));
    //   final loginBtn = find.byKey(const Key('loginBtn'));

    //   // Condition 1: Username and password field null
    //   await tester.tap(loginBtn);
    //   await pumpForSeconds(tester, 2);

    //   expect(find.text('Please enter the username'), findsOneWidget);
    //   expect(find.text('Please enter a password'), findsOneWidget);

    //   // Condition 2: Username or password wrong
    //   await tester.tap(usernameField);
    //   await tester.enterText(usernameField, 'guru1');
    //   await tester.tap(passwordField);
    //   await tester.enterText(passwordField, 'passwor');

    //   await tester.tap(loginBtn);
    //   await pumpForSeconds(tester, 1);

    //   expect(find.text('Invalid username or password'), findsOneWidget);

    //   // Condition 3: Login success
    //   await tester.tap(usernameField);
    //   await tester.enterText(usernameField, 'guru1');
    //   await tester.tap(passwordField);
    //   await tester.enterText(passwordField, 'password');

    //   await tester.tap(loginBtn);
    //   await pumpForSeconds(tester, 1);

    //   expect(find.byType(DashboardPage), findsOneWidget);
    // });
  });
}
