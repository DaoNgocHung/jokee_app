import 'package:jokee_app/app/core/data/model/joke.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteStorage {
  static final SqfliteStorage instance = SqfliteStorage._init();

  static Database? _database;

  SqfliteStorage._init();

  String table = "jokes";

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('$table.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE $table ( id INTEGER PRIMARY KEY, content TEXT NOT NULL, isFunny INTEGER NOT NULL )');
  }

  Future<void> insertJoke(Joke joke) async {
    final db = await instance.database;
    await db.insert(table, joke.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Joke>> fetchJokes() async {
    final db = await instance.database;
    final maps = await db.query(table);

    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        return Joke(
          id: maps[i]['id'] as int,
          content: maps[i]['content'] as String,
          isFunny: maps[i]['isFunny'] == 1,
        );
      });
    }
    return [];
  }

  Future<void> updateJoke(Joke joke) async {
    final db = await instance.database;
    await db.rawUpdate('UPDATE $table SET isFunny = ${joke.isFunny ? 1 : 0} WHERE id = ${joke.id}');
  }
}
