import 'package:flutter/cupertino.dart';
import 'package:resto/data/model/restaurant.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static late Database _database;
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal() {
    _databaseHelper = this;
  }
  factory DatabaseHelper()=>_databaseHelper??DatabaseHelper._internal();
  Future<Database> get database async{
    _database = await _initializeDb();
    return _database;
  }
  static const String _tableName='restofave';

  Future<Database> _initializeDb() async{
    var path = await getDatabasesPath();
    var db = openDatabase(
      "$path/restodb.db",
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $_tableName(id TEXT PRIMARY KEY,name TEXT, description TEXT, pictureId TEXT, city TEXT, rating DOUBLE)');
      },
      version: 1,
    );
    return db;
  }
  Future<void> insertResto(Restaurant resto) async{
    final Database db = await database;
    await db.insert(_tableName, resto.toJson());
    print('Data inserted');
  }
  Future<List<Restaurant>> getAllResto() async{
    final Database db = await database;
    List<Map<String,dynamic>> results = await db.query(_tableName);
    return results.map((res)=> Restaurant.fromJson(res)).toList();
  }
  Future<bool> getRestoById(String id) async{
    final Database db = await database;
    List<Map<String,dynamic>> results = await db.query(_tableName,
        where:"id=?", whereArgs: [id]);
    return (results==null);
  }
  Future<void> updateResto(Restaurant resto) async{
    final Database db = await database;
    await db.update(_tableName, resto.toJson(),where:'id=?',
        whereArgs:[resto.id]);
  }
  Future<void> deleteResto(String id) async{
    final Database db = await database;
    await db.delete(_tableName, where:'id=?', whereArgs:[id]);
  }
}