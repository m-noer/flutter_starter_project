import 'package:flutter_starter_project/presentation/auth/pages/login_page.dart';
import 'package:flutter_starter_project/presentation/auth/widgets/login_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  widgetSetup();

  group('Login Page ...', () {
    testWidgets('Login View ...', (tester) async {
      await tester.pumpApp(
        LoginPage(),
      );

      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
