import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class KabutechDatabase {
  final String databaseName;
  late Database database;
  KabutechDatabase(this.databaseName);

  Future<void> initializeDatabase() async {
    database = await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE settings(id INTEGER PRIMARY KEY, language TEXT, font_scale DECIMAL(1,1), seen INTEGER);',
      );
      await db.execute(
          'INSERT INTO settings(language, font_scale, seen) VALUES (\'en\', 1, 0)');
    });
  }

  Future<Map<String, dynamic>> loadSettings() async {
    List<Map<String, dynamic>> result = await database
        .rawQuery('SELECT language, font_scale FROM settings WHERE id = 1');
    Map<String, dynamic> settings = {
      'language': result[0]['language'],
      'font_scale': result[0]['font_scale'].toDouble()
    };
    return settings;
  }

  void saveSettings(String language, double fontScale) async {
    database.rawUpdate(
      'UPDATE settings SET language = ?, font_scale = ?',
      [language, fontScale],
    );
  }


}