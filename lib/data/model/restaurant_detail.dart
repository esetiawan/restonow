import 'categories.dart';
import 'customerreviews.dart';
import 'menus.dart';

class RestaurantDetail {
  bool? error;
  String? message;
  RestaurantMore restaurant;

  RestaurantDetail({this.error, this.message, required this.restaurant});

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) => RestaurantDetail(
    error : json['error'],
    message : json['message'],
    restaurant : RestaurantMore.fromJson(json['restaurant']),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    return data;
  }
}
class RestaurantMore {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;
  List<Categories> categories;
  Menus menus;
  List<CustomerReviews> customerReviews;

  RestaurantMore(
      {required this.id,
        required this.name,
        required this.description,
        required this.city,
        required this.address,
        required this.pictureId,
        this.rating = 0,
        required this.categories,
        required this.menus,
        required this.customerReviews});

  factory RestaurantMore.fromJson(Map<String, dynamic> json) {
    final categories = <Categories>[];
    if (json['categories'] != null) {
          json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    final customerReviews = <CustomerReviews>[];
    if (json['customerReviews'] != null) {
      json['customerReviews'].forEach((v) {
        customerReviews!.add(new CustomerReviews.fromJson(v));
      });
    }
    return RestaurantMore(id: json['id'],
        name: json['name'],
        description:json['description'],
        city:json['city'],
        address : json['address'],
        pictureId : json['pictureId'],
        rating : json['rating'],
        categories: categories,
        customerReviews: customerReviews,
        menus : Menus.fromJson(json['menus']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['city'] = this.city;
    data['address'] = this.address;
    data['pictureId'] = this.pictureId;
    data['rating'] = this.rating;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.menus != null) {
      data['menus'] = this.menus.toJson();
    }
    if (this.customerReviews != null) {
      data['customerReviews'] =
          this.customerReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}