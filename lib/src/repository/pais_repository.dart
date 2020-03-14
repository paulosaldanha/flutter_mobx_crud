import 'package:estruturabasica/src/models/pais.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class PaisRepository {

 static final _databaseName = "ExemploDB.db";
 static final _databaseVersion = 1;
 
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
    await db.execute('CREATE TABLE IF NOT EXISTS pais (id INTEGER PRIMARY KEY, nome TEXT, ddi TEXT, sigla TEXT,status TEXT, status_sync TEXT)');
  }  


  // Insere uma linha no banco de dados onde cada chave 
  // no Map é um nome de coluna e o valor é o valor da coluna. 
  // O valor de retorno é o id da linha inserida.
  Future<Pais> add(Pais pais) async { 
  var dbClient = await database;  
   pais.id = await dbClient.insert('pais', pais.toMap());    
   print(pais);
   return pais;    
  }    
  

 Future<List<Pais>> getListaPais() async {   
   var dbClient = await database;
   //List<Map> maps = await dbClient.query('pais', columns: ['id','nome','ddi','sigla']);    
   List<Map> maps = await dbClient.rawQuery('select id,nome,ddi,sigla,status,status_sync from pais where status=?',['A']);    
   List<Pais> listaPais = [];    
   if(maps.length > 0){
     for(int i = 0; i < maps.length; i++){
       print(maps[i]);
       listaPais.add(Pais.fromMap(maps[i]));
     }
   }
   return listaPais;
 }    
     
 Future<int> delete(int id) async {    
   var dbClient = await database;
   return await dbClient.delete(    
     'pais',    
     where: 'id = ?',    
     whereArgs: [id],    
   );    
 }    
     
 Future<int> update(Pais pais) async {     
   print(pais.nome);
   print(pais.status);
   var dbClient = await database;  
   return await dbClient.update(    
     'pais',    
     pais.toMap(),    
     where: 'id = ?',    
     whereArgs: [pais.id],    
   );    
 }    
     
 Future close() async {    
   var dbClient = await database;  
   dbClient.close();    
 }    
}