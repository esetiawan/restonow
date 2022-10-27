import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resto/data/model/restaurant_detail.dart';
import '../data/api/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class RestoDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String idResto;
  RestoDetailProvider({required this.apiService, required this.idResto}) {
    _fetchDetailResto();
  }

  late RestaurantDetail _restoDetailResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetail get result => _restoDetailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailResto() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final resto = await apiService.restaurantDetail(idResto);
      _state = ResultState.hasData;
      notifyListeners();
      return _restoDetailResult = resto;
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