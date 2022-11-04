import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import '../common/navigation.dart';
import '../data/model/restaurant.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;
  NotificationHelper._internal() {
    _instance = this;
  }
  factory NotificationHelper() => _instance ?? NotificationHelper._internal();
  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializeSettings = const AndroidInitializationSettings('app_icon');
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: initializeSettings),
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveBackgroundNotificationResponse1);
  }

  static void onDidReceiveBackgroundNotificationResponse1(
      NotificationResponse details) {
    final payload = details.payload;
    if (payload != null) {
      print("notification payload:" + payload);
    }
    selectNotificationSubject.add(payload ?? 'empty payload');
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Restaurant resto) async {
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "Resto Info Channel";
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: const DefaultStyleInformation(true, true));
    var titleNotification = "<b> Resto Update </b>";
    var titleTodo = resto.name;
    await flutterLocalNotificationsPlugin.show(0, titleNotification, titleTodo,
        NotificationDetails(android: androidPlatformChannelSpecifics),
        payload: jsonEncode(resto.toJson()));
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = Restaurant.fromJson(json.decode(payload));
      Navigation.intentWithData(route, data);
    });
  }
}
