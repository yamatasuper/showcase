import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get search => 'Поиск';

  @override
  String example(String progress, String limit) {
    throw UnimplementedError();
  }
}
