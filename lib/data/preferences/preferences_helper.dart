import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  // final Future<SharedPreferences> sharedPreferences;
  Future<SharedPreferences> _get() async => SharedPreferences.getInstance();

  static const enableReminder = 'ENABLE_REMINDER';
  Future<bool> get reminderIsEnabled async {
    final prefs = await _get();
    return prefs.getBool(enableReminder) ?? false;
  }

  void setReminder(bool value) async {
    final prefs = await _get();
    prefs.setBool(enableReminder, value);
  }

  PreferencesHelper();
}
