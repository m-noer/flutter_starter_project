import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter_project/core/configs/routes/routes.dart';
import 'package:flutter_starter_project/core/l10n/localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      GetMaterialApp(
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: localizedLabels.keys.toList(),
        home: widget,
        getPages: Routes.page.map((page) => page).toList(),
      ),
    );
  }
}
