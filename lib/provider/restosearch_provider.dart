import 'dart:io';

import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_search.dart';

enum ResultState { loading, noData, hasData, error }

class RestoSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  String query;
  RestoSearchProvider({required this.apiService, required this.query}) {
    fetchSearchResto();
  }

  late RestaurantSearchResult _restoSearchResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantSearchResult get result => _restoSearchResult;

  ResultState get state => _state;
  void changeQuery(String q) {
    query = q;
    print(query);
    fetchSearchResto();
    notifyListeners();
  }

  Future<dynamic> fetchSearchResto() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resto = await apiService.restaurantSearch(query);
      _state = ResultState.hasData;
      _restoSearchResult = resto;
      notifyListeners();
      return;
    } on SocketException catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } on Error catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Failed to Load List';
    }

  }
}
