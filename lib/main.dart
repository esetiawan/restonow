import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: RestaurantListScreen.routeName,
      routes: {
        RestaurantListScreen.routeName: (context) => const RestaurantListScreen(),
      }
    );
  }
}

class RestaurantListScreen extends StatelessWidget {
  static const routeName = 'news_list';
  const RestaurantListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Restaurant App"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context,snapshot) {
          final List<Restaurants> restaurants = parseRestaurants(snapshot.data);
          return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context,index) {
                return _buildRestaurantItem(context, restaurants[index]);
              }
          );
        },
        
      ) ,
    );
  }

}

List<Restaurants> parseRestaurants(String? json) {
  if (json==null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json)=>Restaurants.fromJson(json)).toList();
}
Widget _buildRestaurantItem(BuildContext context, Restaurants resto) {
  return Material(
      child:ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Image.network(resto.pictureId, width:100),
          title: Text(resto.name),
          subtitle: Text(resto.description),
          onTap:() {
            //Navigator.pushNamed(context,DetailNewsScreen.routeName,arguments:article);
          }
      )
  );
}
