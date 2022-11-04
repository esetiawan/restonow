
import 'package:flutter/material.dart';

import '../common/navigation.dart';
import '../data/model/restaurant.dart';
import '../ui/detailrestaurant.dart';

class CardResto extends StatelessWidget {
  final Restaurant resto;

  const CardResto({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: resto.pictureId!,
          child: Image.network(
            "https://restaurant-api.dicoding.dev/images/small/${resto.pictureId!}",
            width: 100,
          ),
        ),
          title: Text(resto.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.add_location),
                  Text(resto.city),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star),
                  Text(resto.rating.toString()),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigation.intentWithData(DetailRestaurantScreen.routeName,
                resto.id);
          }));
  }
}