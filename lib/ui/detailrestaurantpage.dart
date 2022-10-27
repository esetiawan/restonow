import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/provider/restodetail_provider.dart';

import '../widgets/favoritebutton.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<RestoDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: Text(state.result.restaurant.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ),
              body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Image.network("https://restaurant-api.dicoding.dev/images/medium/${state.result.restaurant.pictureId!}"),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const FavoriteButton(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.result.restaurant.description,
                              ),
                              Divider(color: Colors.grey),
                              Icon(Icons.add_location),
                              Text(
                                state.result.restaurant.city,
                              ),
                              Icon(Icons.star),
                              Text(state.result.restaurant.rating.toString()),
                              const Divider(color: Colors.grey),
                              Text("Menus",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                              Text(
                                "Foods:",
                              ),
                              Container(
                                width: 1000,
                                height: 100,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.result.restaurant.menus.foods.length,
                                  itemBuilder: (BuildContext context, int index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Center(
                                          child: Text(
                                              state.result.restaurant.menus.foods[index].name.toString())),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Drinks:",
                              ),
                              Container(
                                width: 1000,
                                height: 50,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.result.restaurant.menus.drinks.length,
                                  itemBuilder: (BuildContext context, int index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Center(
                                          child: Text(
                                              state.result.restaurant.menus.drinks[index].name.toString())),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
            );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}