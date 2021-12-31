import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/configs/themes/palette.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void snackbarFailure(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Palette.danger,
      margin: const EdgeInsets.all(10),
      maxWidth: 400,
      icon: const Icon(
        FluentIcons.warning_16_regular,
        color: Colors.white,
        key: Key('fail'),
      ),
      duration: const Duration(seconds: 2),
    );
  }

  static void snackbarSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(10),
      maxWidth: 400,
      icon: const Icon(
        FluentIcons.check_20_regular,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    );
  }
}
