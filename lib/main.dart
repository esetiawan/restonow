import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:resto/common/navigation.dart';
import 'package:resto/data/api/api_service.dart';
import 'package:resto/data/preferences/preferences_helper.dart';
import 'package:resto/provider/preferences_provider.dart';
import 'package:resto/provider/restosearch_provider.dart';
import 'package:resto/provider/scheduling_provider.dart';
import 'package:resto/ui/restaurantlist.dart';
import 'package:resto/ui/searchrestaurant.dart';
import 'package:resto/ui/setting.dart';
import 'package:resto/utils/background_service.dart';
import 'package:resto/utils/notification_helper.dart';

import 'ui/detailrestaurant.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  await AndroidAlarmManager.initialize();
  await NotificationHelper.instance
      .initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final NotificationHelper _notificationHelper = NotificationHelper();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestoSearchProvider>(
            create: (context1) => RestoSearchProvider(
                  apiService: ApiService(),
                  query: "",
                )),
        ChangeNotifierProvider<PreferencesProvider>(
            create: (context1) =>
                PreferencesProvider(preferencesHelper: PreferencesHelper())),
        ChangeNotifierProvider<SchedulingProvider>(
            create: (context1) => SchedulingProvider()),
      ],
      child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Restaurants App',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          initialRoute: RestaurantListScreen.routeName,
          routes: {
            RestaurantListScreen.routeName: (context) =>
                const RestaurantListScreen(),
            DetailRestaurantScreen.routeName: (context) =>
                DetailRestaurantScreen(
                    idResto:
                        ModalRoute.of(context)?.settings.arguments as String),
            SearchRestaurantsListScreen.routeName: (context) =>
                SearchRestaurantsListScreen(),
            SettingScreen.routeName: (context) => SettingScreen(),
          },
          home: Scaffold(
            body: Center(
              child: const RestaurantListScreen(),
            ),
            bottomNavigationBar: Builder(builder: (context) {
              return BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
                currentIndex: 0,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(
                          context, RestaurantListScreen.routeName);
                      break;
                    case 1:
                      Navigator.pushNamed(
                          context, RestaurantListScreen.routeName);
                      break;
                    case 2:
                      Navigator.pushNamed(context, SettingScreen.routeName);
                      break;
                  }
                },
              );
            }),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    NotificationHelper.instance
        .configureSelectNotificationSubject(DetailRestaurantScreen.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
