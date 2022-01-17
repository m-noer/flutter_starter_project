import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/core/utils/services/notification.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';
import 'package:flutter_starter_project/core/utils/ui/widgets/empty.dart';
import 'package:flutter_starter_project/presentation/auth/pages/login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const route = '/dashboardPage';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Notificaion
  final notificationService = sl<NotificationService>();

  final sharedPref = sl<SharedPrefs>();

  @override
  void initState() {
    super.initState();
    notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nerolab'),
        actions: [
          IconButton(
            onPressed: () {
              sharedPref.clearAll();
              Navigator.pushReplacement<void, void>(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: const SafeArea(
        child: Empty(),
      ),
    );
  }
}
