import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurants_result.dart';

enum ResultState { loading, noData, hasData, error }

class RestoProvider extends ChangeNotifier {
  final ApiService apiService;

  RestoProvider({required this.apiService}) {
    _fetchAllResto();
  }

  late Welcome _restoResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  Welcome get result => _restoResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllResto() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resto = await apiService.restaurants();
      if (resto.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restoResult = resto;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}