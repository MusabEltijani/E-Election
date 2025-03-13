import 'dart:ui';

import 'package:e_election/app/utils/extension/string_methods.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

class LanguageManager {
  static Locale defaultLanguage = const Locale("ar");

  static LanguageManager? _instance;

  static LanguageManager? get instance {
    _instance ??= LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final arLocale = const Locale('ar');
  final enLocale = const Locale('en');

  final Map<String, AppLanguages> supportedLanguages = {
    "ar": AppLanguages(lanCode: "ar", langTitle: "العربية".tr()),
    "en": const AppLanguages(lanCode: "en", langTitle: "English"),
  };

  AppLanguages? getAppDefaultLanguage() {
    return supportedLanguages[defaultLanguage.languageCode];
  }

  AppLanguages? getAppNextLanguage() {
    String languageCode =
        defaultLanguage.languageCode.equalsIgnoreCase("en") ? "ar" : "en";
    return supportedLanguages[languageCode];
  }

  bool isLanguageArabic() {
    return defaultLanguage.languageCode.equalsIgnoreCase("ar");
  }

  List<Locale> get supportedLocales => [arLocale, enLocale];
}

class AppLanguages extends Equatable {
  final String lanCode;
  final String langTitle;

  const AppLanguages({required this.lanCode, required this.langTitle});

  @override
  List<Object?> get props => [lanCode, langTitle];
}

class AppLanguagesCode {
  static const ar = 'ar';
  static const en = 'en';
}
