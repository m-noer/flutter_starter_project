import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/utils/ui/widgets/snackbar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('Snackbar...', () {
    testWidgets('snackbar failure', (tester) async {
      await tester.pumpApp(
        Scaffold(body: Container()),
      );

      AppSnackbar.snackbarFailure('title', 'message');
      expect(Get.isSnackbarOpen, true);
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('snackbar success', (tester) async {
      await tester.pumpApp(
        Scaffold(body: Container()),
      );

      AppSnackbar.snackbarSuccess('title', 'message');
      expect(Get.isSnackbarOpen, true);
      await tester.pump(const Duration(seconds: 2));
    });
  });
}
