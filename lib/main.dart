import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/data/api/api_service.dart';
import 'package:resto/provider/restosearch_provider.dart';
import 'package:resto/ui/restaurantlist.dart';
import 'package:resto/ui/searchrestaurant.dart';
import 'ui/detailrestaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestoSearchProvider>(
            create: (context1) => RestoSearchProvider(
                  apiService: ApiService(),
                  query: "",
                )),
      ],
      child: MaterialApp(
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
          }),
    );
  }
}
