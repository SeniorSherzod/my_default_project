import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note_model.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._();
  LocalDatabase._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("note.db");
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
    await db.execute('''CREATE TABLE Note (
      noteid INTEGER PRIMARY KEY AUTOINCREMENT,
      noteText TEXT NOT NULL,
      createdDate TEXT NOT NULL,
      noteColor INTEGER DEFAULT 0
    )''');
  }

  Future<NoteModel> insertNote(NoteModel noteModel) async {
    final db = await database;
    int savedNoteID = await db.insert(
      'Note',
      noteModel.toJson(),
    );
    debugPrint("SAVED ID:$savedNoteID");
    return noteModel.copyWith(id: savedNoteID);
  }

  Future<List<NoteModel>> getAllNotes() async {
    final db = await database;
    List<Map<String, dynamic>> json = await db.query('Note');
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    int deletedId = await db.delete(
      'Note',
      where: 'noteid = ?',
      whereArgs: [id],
    );
    return deletedId;
  }

  Future<int> updateNote(NoteModel noteModel) async {
    final db = await database;
    int updatedNoteId = await db.update(
      'Note',
      noteModel.toJson(),
      where: 'noteid = ?',
      whereArgs: [noteModel.id],
    );
    return updatedNoteId;
  }

  Future<List<NoteModel>> searchNotes(String query) async {
    final db = await database;
    var json = await db.query(
      'Note',
      where: 'noteText LIKE ?',
      whereArgs: ["%$query%"],
    );
    return json.map((e) => NoteModel.fromJson(e)).toList();
  }
}
