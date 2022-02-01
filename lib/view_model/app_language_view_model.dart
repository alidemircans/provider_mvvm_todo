import 'package:flutter/material.dart';
import 'package:todo/helper/locator.dart';
import 'package:todo/helper/shared_preference_instance.dart';

class AppLanguage extends ChangeNotifier {
  AppLanguage() {
    fetchLocale();
  }
  SharedPreferencesInstance prefs = locator.get<SharedPreferencesInstance>();

  chanageLanguageSeperator() {
    appLocal.languageCode == "en"
        ? changeLanguage(Locale("tr"))
        : changeLanguage(Locale("en"));
    notifyListeners();
  }

  Locale? _appLocale = Locale('en');

  Locale get appLocal => _appLocale != null ? _appLocale! : Locale("en");
  fetchLocale() async {
    var languageCode = await prefs.getString('language_code');
    if (languageCode == null) {
      await prefs.setString('language_code', 'tr');
      _appLocale = Locale('tr');
      return null;
    } else {
      _appLocale = Locale(languageCode);
    }

    return null;
  }

  void changeLanguage(Locale type) async {
    if (type == Locale("tr")) {
      _appLocale = Locale("tr");
      notifyListeners();
      await prefs.setString('language_code', 'tr');
      await prefs.setString('countryCode', 'TR');
    } else {
      _appLocale = Locale("en");
      notifyListeners();
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
  }
}
