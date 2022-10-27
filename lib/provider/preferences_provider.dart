import 'package:flutter/material.dart';

import '../data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;
  bool _isReminderEnabled = false;
  bool get isReminderEnabled => _isReminderEnabled;
  PreferencesProvider({required this.preferencesHelper}) {
    _getReminderEnabled();
  }
  void _getReminderEnabled() async {
    _isReminderEnabled = await preferencesHelper.reminderIsEnabled;
    notifyListeners();
  }

  void enableReminder(bool value) {
    preferencesHelper.setReminder(value);
    _getReminderEnabled();
  }
}
