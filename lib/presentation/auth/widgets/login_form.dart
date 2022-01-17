import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/l10n/localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formLoginKey,
    required this.usernameController,
    required this.passwordController,
    this.onLogin,
  }) : super(key: key);

  final GlobalKey<FormState> formLoginKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function()? onLogin;

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Form(
      key: formLoginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labels.auth.login,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20),
          _UsernameField(
            key: const Key('usernameField'),
            usernameController: usernameController,
            labels: labels,
          ),
          const SizedBox(height: 10),
          _PasswordField(
            key: const Key('passwordField'),
            passwordController: passwordController,
            labels: labels,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            key: const Key('loginBtn'),
            onPressed: onLogin,
            child: Text(labels.auth.login),
          ),
        ],
      ),
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField({
    Key? key,
    required this.usernameController,
    required this.labels,
  }) : super(key: key);

  final TextEditingController usernameController;
  final AppLocalizationsData labels;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      decoration: InputDecoration(
        hintText: labels.form.username,
        prefixIcon: const Icon(FluentIcons.person_12_regular),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      validator: RequiredValidator(
        errorText: labels.form.required.username,
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    Key? key,
    required this.passwordController,
    required this.labels,
  }) : super(key: key);

  final TextEditingController passwordController;
  final AppLocalizationsData labels;

  @override
  Widget build(BuildContext context) {
    final obscure = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, _, __) => TextFormField(
        controller: passwordController,
        obscureText: obscure.value,
        decoration: InputDecoration(
          hintText: labels.form.password,
          prefixIcon: const Icon(FluentIcons.lock_closed_24_regular),
          suffixIcon: IconButton(
            key: const Key('obscureButton'),
            onPressed: () {
              obscure.value = !obscure.value;
            },
            icon: obscure.value
                ? const Icon(FluentIcons.eye_show_24_regular)
                : const Icon(FluentIcons.eye_hide_24_regular),
          ),
        ),
        validator: RequiredValidator(
          errorText: labels.form.required.password,
        ),
      ),
    );
  }
}
