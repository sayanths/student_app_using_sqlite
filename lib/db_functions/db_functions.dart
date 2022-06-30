import 'package:sqflite/sqflite.dart';


class DatabaseConnection {
  Future<Database> setDatabase() async {
    // var directory = await getApplicationDocumentsDirectory();
    // var path = join(directory.path, 'db_crud');
    var database =await openDatabase('db_crud', version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE users(id INTEGER PRIMARY KEY,name TEXT,contact TEXT,description TEXT)';
    await db.execute(sql);
  }
}
