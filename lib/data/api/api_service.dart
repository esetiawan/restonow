import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto/data/model/restaurant_detail.dart';
import 'package:resto/data/model/restaurant_search.dart';

import '../model/restaurants_result.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<Welcome> restaurants() async {
    final response = await http.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return Welcome.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
  Future<RestaurantDetail> restaurantDetail(String idResto) async {
    final response = await http.get(Uri.parse("${_baseUrl}detail/${idResto}"));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
  Future<RestaurantSearchResult> restaurantSearch(String query) async {
    final response = await http.get(Uri.parse("${_baseUrl}search?q=${query}"));
    if (response.statusCode == 200) {
      return RestaurantSearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}