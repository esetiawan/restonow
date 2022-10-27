import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper{
  final Future<SharedPreferences> sharedPreferences;
  static const enableReminder='ENABLE_REMINDER';
  Future<bool> get reminderIsEnabled async {
    final prefs = await sharedPreferences;
    return prefs.getBool(enableReminder)??false;
  }
  void setReminder(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(enableReminder, value);
  }
  PreferencesHelper({required this.sharedPreferences});
}

