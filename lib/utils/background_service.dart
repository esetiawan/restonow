import 'dart:isolate';
import 'dart:ui';

import 'package:resto/data/api/api_service.dart';

import '../main.dart';
import 'notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;
  BackgroundService._internal() {
    _instance = this;
  }
  factory BackgroundService() => _instance ?? BackgroundService._internal();
  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    print('Alarm aktif');
    var result = await ApiService().restaurants();
    final NotificationHelper notificationHelper = NotificationHelper();
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result.restaurants[0]);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
