import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter_project/core/configs/routes/routes.dart';
import 'package:flutter_starter_project/core/configs/themes/custom_theme.dart';
import 'package:flutter_starter_project/core/constants/key_constants.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/core/l10n/localizations.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';
import 'package:flutter_starter_project/presentation/auth/pages/login_page.dart';
import 'package:flutter_starter_project/presentation/dashboard/pages/dashboard_page.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final prefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(KeyConstants.keyAccessToken);

    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    String initialRoute() {
      if (isLogin) {
        return DashboardPage.route;
      } else {
        return LoginPage.route;
      }
    }

    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: localizedLabels.keys.first,
      supportedLocales: localizedLabels.keys.toList(),
      navigatorObservers: [routeObserver],
      initialRoute: initialRoute(),
      getPages: Routes.page.map((page) => page).toList(),
    );
  }
}
