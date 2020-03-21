
import 'package:estruturabasica/src/models/estado.dart';
import 'package:estruturabasica/src/models/pais.dart';
import 'package:estruturabasica/src/repository/estado_repository.dart';
import 'package:estruturabasica/src/repository/pais_repository.dart';
import 'package:estruturabasica/src/services/pais_service.dart';

class EstadoService {
  var _repository;

  EstadoService(){
    _repository = EstadoRepository();

  }

  Future<Estado> saveOrUpdate(Estado estado) async {
    Estado estadoretorno;
    if(estado.id == null || estado.id == 0){
      estado.status = 'A';
      estadoretorno = await _repository.add(estado);
    }else{
      int idestado = await _repository.update(estado);
      estadoretorno = estado;
      estadoretorno.id = idestado;
    }
    return estadoretorno;
  }

  String delete(int id){
    _repository.delete(id);
    return "Deletado com sucesso";
  }

  Future<List<Estado>> getListaEstado() async {
    
    List<Estado> listaEstado = await _repository.getListaEstado();
    var repositoryPais = PaisRepository();
    for(int i =0;i<listaEstado.length;i++){
        listaEstado[i].pais = await repositoryPais.getById(listaEstado[i].pais.id);
    }
    return listaEstado;
  }

  //recupera lista pais
  Future<List<Pais>> getListaPais() async {
    var paisService = PaisService();
    return await paisService.getListaPais();
  }

  void close(){
    _repository.close();
  }

}