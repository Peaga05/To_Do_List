import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDeDados {
  BancoDeDados._();
  static final BancoDeDados instance = BancoDeDados._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'to_do.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE tarefas(id INTEGER PRIMARY KEY, tarefa TEXT)',
    );
  }
}
