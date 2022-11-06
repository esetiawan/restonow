import 'package:flutter/material.dart';

import '../data/model/restaurant.dart';
import '../utils/databasehelper.dart';

class DbProvider extends ChangeNotifier{
  List<Restaurant> _arrResto = [];
  late DatabaseHelper _dbHelper;
  List<Restaurant> get restos => _arrResto;
  DbProvider(){
    _dbHelper = DatabaseHelper();
    _getAllResto();
  }

  void _getAllResto() async {
    _arrResto = await _dbHelper.getAllResto();
    notifyListeners();
  }
  Future<void> addResto(Restaurant resto) async{
    await _dbHelper.insertResto(resto);
    _getAllResto();
  }
  Future<bool> getRestoById(String id) async{
    return await _dbHelper.getRestoById(id);
  }
  Future<void> updateResto(Restaurant resto) async{
    await _dbHelper.updateResto(resto);
    _getAllResto();
  }
  Future<void> deleteResto(String id) async{
    await _dbHelper.deleteResto(id);
    _getAllResto();
  }
}