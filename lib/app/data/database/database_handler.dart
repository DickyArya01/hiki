import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static late Database instance;

  static Future<void> init() async {
    String path = await getDatabasesPath();
    instance = await openDatabase(
      join(path, 'app_data.db'),
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE USER (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL COLLATE NOCASE,
            email TEXT NOT NULL COLLATE NOCASE,
            nomer TEXT NOT NULL,
            password TEXT NOT NULL,
            UNIQUE(email, nomer)
          )
          ''');
      },
      version: 1,
    );
  }
}
