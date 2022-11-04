import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

import '../utils/background_service.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledResto(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('Scheduling Resto Activated');
      notifyListeners();
      return await AndroidAlarmManager.oneShot(
        const Duration(seconds: 5),
        // Ensure we have a unique alarm ID.
        Random().nextInt(pow(2, 31) as int),
        BackgroundService.callback,
        exact: true,
        wakeup: true,
      );
      // return await AndroidAlarmManager.periodic(
      //   const Duration(hours: 24),
      //   1,
      //   BackgroundService.callback,
      //   startAt: DateTimeHelper.format(),
      //   exact: true,
      //   wakeup: true,
      // );
    } else {
      print('Scheduling Resto Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
