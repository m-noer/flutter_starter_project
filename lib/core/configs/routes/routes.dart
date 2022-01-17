import 'package:flutter_starter_project/presentation/auth/pages/login_page.dart';
import 'package:flutter_starter_project/presentation/dashboard/pages/dashboard_page.dart';
import 'package:get/route_manager.dart';

class Routes {
  static List<GetPage> page = <GetPage>[
    GetPage<void>(
      name: DashboardPage.route,
      page: () => const DashboardPage(),
    ),
    GetPage<void>(
      name: LoginPage.route,
      page: () => LoginPage(),
    ),
  ];
}
