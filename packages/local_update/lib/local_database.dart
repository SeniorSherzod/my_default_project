import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:local_update/currency_model.dart';
import 'package:local_update/network_reponce.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();
  static Database? _database;

  LocalDatabase._internal();

  factory LocalDatabase() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'currency.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE Currency (
          id INTEGER PRIMARY KEY,
          cyNmUZ TEXT,
          rate TEXT,
          nominal TEXT
        )''');
      },
    );
  }

  static Future<NetworkResponse> insertCurrency(CurrencyModel currencyModel) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await LocalDatabase().database;
      await db.insert("CurrencyTable", currencyModel.toJson());
      networkResponse.data = 'Currency inserted successfully';
    } catch (error) {
      networkResponse.errorText = "Error during insertion: $error";
    }
    return networkResponse;
  }

  static Future<NetworkResponse> getAllCurrencies() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await LocalDatabase().database;
      List<Map<String, dynamic>> json = await db.query("CurrencyTable");
      networkResponse.data = json.map((e) => CurrencyModel.fromJson(e)).toList();
    } catch (error) {
      networkResponse.errorText = "Error during retrieval: $error";
    }
    return networkResponse;
  }

  static Future<NetworkResponse> updateCurrency({required CurrencyModel currencyModel}) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      final db = await LocalDatabase().database;
      await db.update("CurrencyTable", currencyModel.toJson(),
          where: "code = ?", whereArgs: [currencyModel.code]);
      networkResponse.data = 'Currency updated successfully';
    } catch (error) {
      networkResponse.errorText = "Error during update: $error";
    }
    return networkResponse;
  }

}
