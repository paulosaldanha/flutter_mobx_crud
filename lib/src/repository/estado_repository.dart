import 'package:estruturabasica/src/models/estado.dart';
import 'package:estruturabasica/src/repository/repostory.dart';

class EstadoRepository extends Repository{

  // Insere uma linha no banco de dados onde cada chave 
  // no Map é um nome de coluna e o valor é o valor da coluna. 
  // O valor de retorno é o id da linha inserida.
  Future<Estado> add(Estado estado) async { 
  var dbClient = await database;  
   estado.id = await dbClient.insert('estado', estado.toMap());    
   return estado;    
  }    
  

 Future<List<Estado>> getListaEstado() async {   
   var dbClient = await database;
   //List<Map> maps = await dbClient.query('pais', columns: ['id','nome','ddi','sigla']);    
   List<Map> maps = await dbClient.rawQuery('select id,nome,uf,pais_id,status,status_sync from estado where status=?',['A']);    
   List<Estado> listaEstado = [];    
   if(maps.length > 0){
     for(int i = 0; i < maps.length; i++){
       listaEstado.add(Estado.fromMap(maps[i]));
     }
   }
   return listaEstado;
 }    
     
 Future<int> delete(int id) async {    
   var dbClient = await database;
   return await dbClient.delete(    
     'estado',    
     where: 'id = ?',    
     whereArgs: [id],    
   );    
 }    
     
 Future<int> update(Estado estado) async {     
   var dbClient = await database;  
   return await dbClient.update(    
     'estado',    
     estado.toMap(),    
     where: 'id = ?',    
     whereArgs: [estado.id],    
   );    
 }    
     
 Future close() async {    
   var dbClient = await database;  
   dbClient.close();    
 }    
}