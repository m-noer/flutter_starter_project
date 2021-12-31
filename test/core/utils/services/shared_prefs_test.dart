import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  widgetSetup();

  group('shared prefs', () {
    testWidgets('Bool test', (tester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putBool('boolTest', true);
      final getBool = prefs.getBool('boolTest');

      expect(true, getBool);
    });

    testWidgets('Double test', (tester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putDouble('doubleTest', 2.5);
      final getDouble = prefs.getDouble('doubleTest');

      expect(2.5, getDouble);
    });

    testWidgets('Int test', (tester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putInt('intTest', 25);
      final getInt = prefs.getInt('intTest');

      expect(25, getInt);
    });

    testWidgets('String test', (tester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putString('stringTest', 'string');
      final getString = prefs.getString('stringTest');

      expect('string', getString);
    });

    testWidgets('String List test', (tester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putStringList('stringListTest', ['string1', 'string2']);
      final getStringList = prefs.getStringList('stringListTest');

      expect(['string1', 'string2'], getStringList);
    });

    testWidgets('clear Key', (widgetTester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putString('stringTest', 'string');

      await prefs.clearKey('stringTest');
      final result = prefs.isKeyExists('stringTest');

      expect(result, false);
    });

    testWidgets('clear All', (widgetTester) async {
      final prefs = sl<SharedPrefs>();

      await prefs.putInt('intTest', 25);

      await prefs.clearAll();
      final result = prefs.isKeyExists('intTest');

      expect(result, false);
    });
  });
}
