import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesInstance {
  static SharedPreferences? prefs;

  SharedPreferencesInstance() {
    init();
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  getString(value) async {
    if (prefs == null) await init();
    return prefs!.getString(value);
  }

  setString(key, value) async {
    if (prefs == null) await init();

    return prefs!.setString(key, value);
  }
}
