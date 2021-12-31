import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_starter_project/presentation/auth/widgets/login_view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const route = '/loginPage';

  // Bloc
  final authBloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc,
        child: LoginView(
          authBloc: authBloc,
        ),
      ),
    );
  }
}
