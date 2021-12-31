import 'package:bloc_test/bloc_test.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/utils/ui/widgets/loading_with_text.dart';
import 'package:flutter_starter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_starter_project/presentation/auth/widgets/login_view.dart';
import 'package:flutter_starter_project/presentation/dashboard/pages/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  group('Login View ...', () {
    late AuthBlocMock authBlocMock;

    setUp(() {
      authBlocMock = AuthBlocMock();
      when(() => authBlocMock.state).thenReturn(AuthInitial());
    });

    final usernameField = find.byKey(const Key('usernameField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginBtn = find.byKey(const Key('loginBtn'));

    testWidgets('Form validation ...', (tester) async {
      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );

      expect(usernameField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(loginBtn, findsOneWidget);

      await tester.enterText(usernameField, 'guru1');
      await tester.enterText(passwordField, 'password');

      final formWidgetFinder = find.byType(Form);
      final formWidget = tester.widget(formWidgetFinder) as Form;

      final formKey = formWidget.key! as GlobalKey<FormState>;

      await tester.pump();

      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(find.byIcon(FluentIcons.eye_hide_24_regular), findsOneWidget);

      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(find.byIcon(FluentIcons.eye_show_24_regular), findsOneWidget);

      expect(formKey.currentState!.validate(), isTrue);
      await tester.tap(loginBtn);
    });
    testWidgets('AuthLoading ...', (tester) async {
      when(() => authBlocMock.state).thenReturn(AuthLoading());

      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );

      expect(find.byType(LoadingWithText), findsOneWidget);
    });

    testWidgets('AuthFailure', (tester) async {
      whenListen(
          authBlocMock,
          Stream.fromIterable(
              [AuthLoading(), const AuthFailure(message: 'fail')]));

      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );
      expect(Get.isSnackbarOpen, true);

      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('AuthSuccess', (tester) async {
      whenListen(
        authBlocMock,
        Stream.fromIterable(
          [
            AuthLoading(),
            AuthSuccess(),
          ],
        ),
      );

      await tester.pumpApp(
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: Scaffold(
            body: LoginView(authBloc: authBlocMock),
          ),
        ),
      );
      expect(Get.currentRoute, DashboardPage.route);
    });
  });
}
