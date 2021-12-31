import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'localizations.g.dart';

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizationsData get localizations {
    return Localizations.of<AppLocalizationsData>(this, AppLocalizationsData)!;
  }
}

// the int paramter is the generated version. You must increment it each time
// you want to regenerate a new version of the labels.
@SheetLocalization('1TWn1tvLS4ac4SOw9pAj87J_E2WlJ9rtqIhNwlLf8scc', '0', 1)
class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizationsData> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => localizedLabels.containsKey(locale);

  @override
  Future<AppLocalizationsData> load(Locale locale) =>
      SynchronousFuture<AppLocalizationsData>(localizedLabels[locale]!);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
