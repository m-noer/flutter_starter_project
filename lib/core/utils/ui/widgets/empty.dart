import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/configs/themes/palette.dart';
import 'package:flutter_starter_project/core/l10n/localizations.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key, this.notFoundText}) : super(key: key);

  final String? notFoundText;

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FluentIcons.folder_16_filled,
              color: Theme.of(context).colorScheme.primary,
              size: 100,
            ),
            const SizedBox(height: 14),
            Text(
              notFoundText ?? labels.noDataFound,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Palette.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
