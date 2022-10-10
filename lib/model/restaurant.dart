import 'menus.dart';

class Restaurants {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final Menus menus;

  Restaurants(
      {required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating,
        required this.menus});

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    pictureId: json['pictureId'],
    city: json['city'],
    rating: json['rating'],
    menus: Menus.fromJson(json['menus']),
  );
}
