import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/ui/restaurantlistpage.dart';
import 'package:resto/ui/searchrestaurant.dart';

import '../data/api/api_service.dart';
import '../provider/resto_provider.dart';

class RestaurantListScreen extends StatefulWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                Navigator.pushNamed(
                    context, SearchRestaurantsListScreen.routeName);
                // final NotificationHelper notificationHelper =
                //     NotificationHelper();
                // await notificationHelper.showNotification(
                //     flutterLocalNotificationsPlugin,
                //     Restaurant(
                //         id: "1",
                //         name: "hallo",
                //         description: "aa",
                //         city: "aaa",
                //         pictureId: "aa",
                //         rating: 4));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ChangeNotifierProvider<RestoProvider>(
        create: (_) => RestoProvider(apiService: ApiService()),
        child: const RestaurantListPage(),
      ),
    );
  }
}
