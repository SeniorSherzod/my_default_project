import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "qr_codes.db";
  static const _databaseVersion = 1;

  static const table = 'scanned_qr_codes';

  static const columnId = '_id';
  static const columnQRCode = 'qr_code';
  static const columnScanTime = 'scan_time';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnQRCode TEXT NOT NULL,
            $columnScanTime TEXT NOT NULL
          )
          ''');
  }

  Future<int> insertQRCode(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> deleteQRCode(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> readQRCode(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(table,
        where: '$columnId = ?', whereArgs: [id], limit: 1);
    return result.isNotEmpty ? result.first : null;
  }
}
