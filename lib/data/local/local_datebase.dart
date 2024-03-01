import 'package:flutter/cupertino.dart';
import 'package:my_default_project/models/category_model/category_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/task_model/task_model.dart';
import '../../models/task_model/task_model_constant.dart';

class LocalDatabase {

  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();

    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }


  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''CREATE TABLE ${TaskModelConstants.tableName} (
      ${TaskModelConstants.id} $idType,
      ${TaskModelConstants.title} $textType,
      ${TaskModelConstants.description} $textType,
      ${TaskModelConstants.deadline} $textType,
      ${TaskModelConstants.status} $textType,
      ${TaskModelConstants.category} $textType,
      ${TaskModelConstants.priority} $intType
    )''');
    await db.execute('''CREATE TABLE ${CategoryModelConstants.tableName} (
      ${CategoryModelConstants.id} $idType,
      ${CategoryModelConstants.name} $textType,
      ${CategoryModelConstants.iconPath} $textType,
      ${CategoryModelConstants.color} $textType
    )''');
  }

  static Future<TaskModel> insertTask(TaskModel taskModel) async {
    debugPrint("INITIAL ID:${taskModel.id}");
    final db = await databaseInstance.database;
    int savedTaskID =
    await db.insert(TaskModelConstants.tableName, taskModel.toJson());
    debugPrint("SAVED ID:$savedTaskID");
    return taskModel.copyWith(id: savedTaskID);
  }

  static Future<List<TaskModel>> getAllTasks() async {
    final db = await databaseInstance.database;
    String orderBy = "${TaskModelConstants.id} DESC"; //"_id DESC"
    List json = await db.query(TaskModelConstants.tableName, orderBy: orderBy);
    return json.map((e) => TaskModel.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      TaskModelConstants.tableName,
      where: "${TaskModelConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  static Future<int> updateTask(TaskModel taskModel,
      int id,) async {
    debugPrint("UPDATE: ${taskModel.toJson()} ${taskModel.id}");

    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      TaskModelConstants.tableName,
      taskModel.toJson(),
      where: "${TaskModelConstants.id} = ?",
      whereArgs: [id],
    );
    return updatedTaskId;
  }

  static Future<int> updateTaskStatus({
    required String newStatus,
    required int taskId,
  }) async {
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      TaskModelConstants.tableName,
      {TaskModelConstants.status: newStatus},
      where: "${TaskModelConstants.id} = ?",
      whereArgs: [taskId],
    );
    return updatedTaskId;
  }

  static Future<List<TaskModel>> searchTasks(String query) async {
    final db = await databaseInstance.database;
    var json = await db.query(
      TaskModelConstants.tableName,
      where: "${TaskModelConstants.title} LIKE ?",
      whereArgs: ["$query%"],
    );
    return json.map((e) => TaskModel.fromJson(e)).toList();
  }
}
