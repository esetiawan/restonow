import 'drinks.dart';
import 'foods.dart';

class Menus {
  List<Foods> foods;
  List<Drinks> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    final foods = <Foods>[];
    if (json['foods'] != null) {
      json['foods'].forEach((v) {
        foods.add(Foods.fromJson(v));
      });
    }

    final drinks = <Drinks>[];
    if (json['drinks'] != null) {
      json['drinks'].forEach((v) {
        drinks.add(Drinks.fromJson(v));
      });
    }

    return Menus(foods: foods, drinks: drinks);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foods'] = this.foods.map((v) => v.toJson()).toList();

    data['drinks'] = this.drinks.map((v) => v.toJson()).toList();

    return data;
  }
}
