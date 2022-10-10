import 'package:flutter/material.dart';

import 'model/restaurant.dart';

class DetailRestaurantScreen extends StatelessWidget {
  static const routeName='/restaurant_detail';
  final Restaurants resto;
  const DetailRestaurantScreen({Key? key, required this.resto}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(resto.name,
            style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24)
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(resto.pictureId),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resto.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Divider(color: Colors.grey),
                      Icon(Icons.add_location),
                      Text(
                        resto.city,
                      ),
                      Icon(Icons.star),
                      Text(resto.rating.toString()),
                      const Divider(color: Colors.grey),
                      Text(
                        "Menus",
                          style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                          )
                      ),
                      Text(
                        "Foods:",
                      ),/*
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: resto.menus.foods.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Center(child: Text(resto.menus.foods[index].name.toString())),
                        ),
                      ), */
                      Text(
                        "Drinks:",
                      ),
                      /*
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: resto.menus.drinks.length,
                        itemBuilder: (BuildContext context, int index) => Container(
                          /*width: 100,
                          height: 100,
                          child: Card(
                            child: Container(
                              width: 100,
                                height: 100,
                                child: Center(child: Text(resto.menus.drinks[index].name.toString()))),
                          ),*/
                            child: Center(child: Text(resto.menus.drinks[index].name.toString())),
                        ),
                      ),*/
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
}