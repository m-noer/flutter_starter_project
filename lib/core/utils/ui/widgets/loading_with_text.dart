import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/configs/themes/palette.dart';
import 'package:flutter_starter_project/core/l10n/localizations.dart';
import 'package:get/get.dart';

class LoadingWithText extends StatelessWidget {
  const LoadingWithText({
    Key? key,
    this.loadingText,
  }) : super(key: key);

  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Container(
      color: Colors.black.withOpacity(0.6),
      width: double.infinity,
      height: Get.height,
      child: Center(
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: Palette.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    loadingText ?? labels.state.loading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
