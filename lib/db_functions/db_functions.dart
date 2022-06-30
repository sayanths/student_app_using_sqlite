import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_cru d');
    var database = openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE notes(id INTEGER PRIMARY KEY,name TEXT,contact TEXT,description TEXT)";
    await db.execute(sql);
  }
}
