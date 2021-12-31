import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers.dart';

void widgetSetup() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    setupFirebaseMessagingMocks();
    await init();
    await Firebase.initializeApp();
  });
}
