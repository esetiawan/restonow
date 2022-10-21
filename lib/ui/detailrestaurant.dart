import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/api/api_service.dart';
import '../provider/restodetail_provider.dart';
import 'detailrestaurantpage.dart';


class DetailRestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final String idResto;
  const DetailRestaurantScreen({Key? key, required this.idResto})
      : super(key: key);
  @override
  State<DetailRestaurantScreen> createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body:
      ChangeNotifierProvider<RestoDetailProvider>(
        create: (_) => RestoDetailProvider(apiService: ApiService(), idResto: widget.idResto),
        child: const RestaurantDetailPage(),
      ),
    );
  }
}
