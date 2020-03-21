import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Repository {
  static final _databaseName = "ExemploDB.db";
  static final _databaseVersion = 1;
  static final _tablePais = 'CREATE TABLE IF NOT EXISTS pais (id INTEGER PRIMARY KEY, nome TEXT, ddi TEXT, sigla TEXT,status TEXT, status_sync TEXT)';
  static final _tableEstado = 'CREATE TABLE IF NOT EXISTS estado (id INTEGER PRIMARY KEY, nome TEXT, uf TEXT, pais_id INTEGER,status TEXT, status_sync TEXT)';
 
// tem somente uma referência ao banco de dados
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
        return _database;
    }
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }  
  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }
  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute(_tablePais);
    await db.execute(_tableEstado);

  }
}