import "dart:convert";

import "package:flutter/services.dart";
import "package:flutter/widgets.dart";

class AppLocalizations {

  final Locale locale;
  static String? localeLanguageCode;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;
  late Map<String, String> _localizedEn;

  Future<bool> load() async {
    localeLanguageCode = locale.languageCode;
    final String jsonString = await rootBundle.loadString("lang/${locale.languageCode}.json");
    final Map<String,dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _localizedStrings = jsonMap.map((String key, dynamic value) {
      return MapEntry<String, String>(key, value.toString());
    });
    return true;
  }

  Future<bool> loadEnglish() async {
    final String jsonString = await rootBundle.loadString("lang/en.json");
    final Map<String,dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _localizedEn = jsonMap.map((String key, dynamic value) {
      return MapEntry<String, String>(key, value.toString());
    });
    return true;
  }

  String? translate(String key) {
    switch (locale.languageCode){
      case "en" : return _localizedEn[key];
      default : return _localizedStrings[key];
    }
  }

  String? translateToEnglish(String key) {
    return _localizedEn[key];
  }

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return <String>["en"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    await localizations.loadEnglish();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

}