import 'package:resto/data/model/restaurant.dart';

class RestaurantSearchResult {
  bool? error;
  int? founded;
  List<Restaurant>? restaurants;

  RestaurantSearchResult({this.error, this.founded, this.restaurants});

  RestaurantSearchResult.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurant>[];
      json['restaurants'].forEach((v) {
        restaurants!.add( Restaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['error'] = this.error;
    data['founded'] = this.founded;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
