import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_search.dart';

enum ResultState { loading, noData, hasData, error }

class RestoSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  late final String query;
  RestoSearchProvider({required this.apiService, required this.query}) {
    fetchSearchResto();
  }

  late RestaurantSearchResult _restoSearchResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantSearchResult get result => _restoSearchResult;

  ResultState get state => _state;

  Future<dynamic> fetchSearchResto() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resto = await apiService.restaurantSearch(query);
      _state = ResultState.hasData;
      notifyListeners();
      return _restoSearchResult = resto;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}