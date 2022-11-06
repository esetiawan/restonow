import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/ui/restaurantfavelistpage.dart';
import 'package:resto/ui/restaurantlistpage.dart';
import 'package:resto/ui/searchrestaurant.dart';

import '../data/api/api_service.dart';
import '../provider/dbprovider.dart';
import '../provider/resto_provider.dart';

class RestaurantFaveListScreen extends StatelessWidget {
  static const routeName = '/restaurant_fave_list';

  const RestaurantFaveListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Fave"),
      ),
      body: const RestaurantFaveListPage(),
      );
  }
}
