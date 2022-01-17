import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/constants/assets_constants.dart';
import 'package:flutter_starter_project/core/l10n/localizations.dart';
import 'package:flutter_starter_project/core/utils/ui/widgets/loading_with_text.dart';
import 'package:flutter_starter_project/core/utils/ui/widgets/snackbar.dart';
import 'package:flutter_starter_project/data/auth/models/models.dart';
import 'package:flutter_starter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_starter_project/presentation/auth/widgets/login_form.dart';
import 'package:flutter_starter_project/presentation/dashboard/pages/dashboard_page.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.authBloc}) : super(key: key);

  final AuthBloc authBloc;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Key
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          AppSnackbar.snackbarFailure(labels.state.failure, state.message);
        }

        if (state is AuthSuccess) {
          Get.offAllNamed<void>(DashboardPage.route);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 28),
                    SizedBox(
                      height: size.height / 4,
                      child: Image.asset(
                        AssetsConstants.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 28),
                    FormLogin(
                      formLoginKey: _formLoginKey,
                      usernameController: usernameController,
                      passwordController: passwordController,
                      onLogin: onLogin,
                    ),
                  ],
                ),
              ),
            ),
            if (state is AuthLoading) const LoadingWithText(),
          ],
        );
      },
    );
  }

  void onLogin() {
    if (_formLoginKey.currentState!.validate()) {
      _formLoginKey.currentState!.save();

      final body = LoginBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      widget.authBloc.add(LoginEvent(body));
    }
  }
}
